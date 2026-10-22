package nosi.core.webapp;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

class ModelSeparatorListUploadTest {

    @AfterEach
    void releaseRequest() {
        Igrp.remove();
    }

    @Test
    void associatesNewUploadWithItsRowAfterAnExistingReference() throws Exception {
        TestModel model = load(List.of(text("linkA"), file("B.pdf", "B")), Map.of());

        assertEquals(2, model.rows.size());
        assertEquals("linkA", model.rows.get(0).getDocumento().getKey());
        assertNull(model.rows.get(0).getDocumento().getFile().getSubmittedFileName());
        assertUpload(model, 1, "B.pdf", "B");
        assertEquals("", model.rows.get(1).getDocumento().getKey());
    }

    @Test
    void keepsReferencesBetweenMultipleUploadsAndEmptyRows() throws Exception {
        TestModel model = load(List.of(text("linkA"), file("B.pdf", "B"), text(""),
                text("ligaçãoD"), file("E.pdf", "E")), Map.of());

        assertEquals(5, model.rows.size());
        assertUpload(model, 1, "B.pdf", "B");
        assertEquals("", model.rows.get(2).getDocumento().getKey());
        assertEquals("ligaçãoD", model.rows.get(3).getDocumento().getKey());
        assertNull(model.rows.get(3).getDocumento().getFile().getSubmittedFileName());
        assertUpload(model, 4, "E.pdf", "E");
    }

    @Test
    void supportsReplacingTheFirstRowFileWithoutMovingTheNextReference() throws Exception {
        TestModel model = load(List.of(file("replacement.pdf", "new"), text("linkB")), Map.of());

        assertUpload(model, 0, "replacement.pdf", "new");
        assertEquals("linkB", model.rows.get(1).getDocumento().getKey());
        assertNull(model.rows.get(1).getDocumento().getFile().getSubmittedFileName());
    }

    @Test
    void distinguishesAnUnselectedFileFromASelectedZeroByteFile() throws Exception {
        TestModel model = load(List.of(file("", ""), file("empty.txt", "")), Map.of());

        assertNull(model.rows.get(0).getDocumento().getFile().getSubmittedFileName());
        assertUpload(model, 1, "empty.txt", "");
        assertEquals(0, model.rows.get(1).getDocumento().getFile().getSize());
    }

    @Test
    void preservesTemporaryIdentifiersForTheirOwnUploadRows() throws Exception {
        TestModel model = load(List.of(text("linkA"), file("B.pdf", "B")),
                Map.of("p_documento_file_uploaded_id", new String[]{"-1", "temporary-B"}));

        assertEquals("temporary-B", model.rows.get(1).getDocumento().getFile().getId());
        assertUpload(model, 1, "B.pdf", "B");
    }

    @Test
    void preservesTextOnlyFieldsAlongsideFileFields() throws Exception {
        TestModel model = load(List.of(text("linkA"), file("B.pdf", "B")),
                Map.of("p_nome_fk", new String[]{"first", "second"}));

        assertEquals("first", model.rows.get(0).getNome().getKey());
        assertEquals("second", model.rows.get(1).getNome().getKey());
        assertUpload(model, 1, "B.pdf", "B");
    }

    @Test
    void preservesParameterLoadingWhenThereAreNoNewUploads() throws Exception {
        TestModel model = load(List.of(text("linkA"), text("linkB")), Map.of());

        assertEquals("linkA", model.rows.get(0).getDocumento().getKey());
        assertEquals("linkB", model.rows.get(1).getDocumento().getKey());
        assertNull(model.rows.get(1).getDocumento().getFile().getSubmittedFileName());
    }

    private static TestModel load(List<Part> parts, Map<String, String[]> overrides) throws Exception {
        Map<String, String[]> parameters = new java.util.HashMap<>();
        parameters.put("p_rows_id", new String[parts.size()]);
        // Avoid database lookups for saved references; the reference remains in Pair.key.
        String[] ids = new String[parts.size()];
        Arrays.fill(ids, "-1");
        parameters.put("p_documento_file_uploaded_id", ids);
        parameters.put("p_nome_file_uploaded_id", ids);
        parameters.put("p_nome_fk", new String[parts.size()]);
        parameters.put("p_documento_fk", parts.stream()
                .filter(part -> part.getSubmittedFileName() == null)
                .map(part -> new String(((TestPart) part).bytes, StandardCharsets.UTF_8))
                .toArray(String[]::new));
        parameters.putAll(overrides);

        HttpSession session = (HttpSession) Proxy.newProxyInstance(HttpSession.class.getClassLoader(),
                new Class<?>[]{HttpSession.class}, (proxy, method, args) -> null);
        HttpServletRequest request = (HttpServletRequest) Proxy.newProxyInstance(
                HttpServletRequest.class.getClassLoader(), new Class<?>[]{HttpServletRequest.class},
                (proxy, method, args) -> switch (method.getName()) {
                    case "getParts" -> parts;
                    case "getHeader" -> "multipart/form-data";
                    case "getCharacterEncoding" -> "UTF-8";
                    case "getMethod" -> "POST";
                    case "getSession" -> session;
                    case "getParameterValues" -> parameters.get(args[0]);
                    case "getParameter" -> {
                        String[] values = parameters.get(args[0]);
                        yield values != null && values.length > 0 ? values[0] : null;
                    }
                    default -> null;
                });
        Igrp.set();
        Igrp.getInstance().setRequest(request);
        TestModel model = new TestModel();
        model.load();
        return model;
    }

    private static void assertUpload(TestModel model, int row, String filename, String content) {
        assertEquals(filename, model.rows.get(row).getDocumento().getFile().getSubmittedFileName());
        assertArrayEquals(content.getBytes(StandardCharsets.UTF_8),
                model.rows.get(row).getDocumento().getFile().getBytes());
    }

    private static Part text(String value) {
        return new TestPart(null, value);
    }

    private static Part file(String filename, String content) {
        return new TestPart(filename, content);
    }

    public static class TestModel extends Model {
        @SeparatorList(name = Rows.class)
        private List<Rows> rows;

        public static class Rows {
            private Pair rows_id;
            private Pair documento;
            private Pair nome;

            public Pair getRows_id() { return rows_id; }
            public void setRows_id(Pair value) { rows_id = value; }
            public Pair getDocumento() { return documento; }
            public void setDocumento(Pair value) { documento = value; }
            public Pair getNome() { return nome; }
            public void setNome(Pair value) { nome = value; }
        }
    }

    private static class TestPart implements Part {
        private final String filename;
        private final byte[] bytes;

        TestPart(String filename, String content) {
            this.filename = filename;
            this.bytes = content.getBytes(StandardCharsets.UTF_8);
        }

        public InputStream getInputStream() { return new ByteArrayInputStream(bytes); }
        public String getContentType() { return filename != null ? "application/octet-stream" : null; }
        public String getName() { return "p_documento_fk"; }
        public String getSubmittedFileName() { return filename; }
        public long getSize() { return bytes.length; }
        public void write(String path) { throw new UnsupportedOperationException(); }
        public void delete() { }
        public String getHeader(String name) { return null; }
        public Collection<String> getHeaders(String name) { return List.of(); }
        public Collection<String> getHeaderNames() { return List.of(); }
    }
}
