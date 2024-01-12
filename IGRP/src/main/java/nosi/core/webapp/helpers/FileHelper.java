package nosi.core.webapp.helpers;

import nosi.core.webapp.Core;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import javax.imageio.ImageIO;
import jakarta.servlet.http.Part;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.function.Predicate;


public class FileHelper {

    private final Map<String, String> files = new HashMap<>();

    public Map<String, String> listFilesDirectory(String path) {
        if (FileHelper.fileExists(path)) {
            File folder = new File(path);
            for (final File fileEntry : folder.listFiles()) {
                if (fileEntry.isDirectory()) {
                    return listFilesDirectory(fileEntry.toString());
                } else {
                    this.files.put(fileEntry.getName(), fileEntry.getAbsolutePath());
                }
            }
            return this.files;
        }
        return null;
    }

    public static byte[] convertInputStreamToByte(InputStream inputStream) throws IOException {
        return IOUtils.toByteArray(inputStream);
    }

    public static String convertInputStreamToBase64(InputStream inputStream) throws IOException {
        return Base64.getEncoder().encodeToString(convertInputStreamToByte(inputStream));
    }

    public static String convertInputStreamToBase64(byte[] bytes) throws IOException {
        return Base64.getEncoder().encodeToString(bytes);
    }

    public Map<String, String> readAllFileDirectory(String path) {
        if (FileHelper.fileExists(path)) {
            File folder = new File(path);
            File[] listOfFiles = folder.listFiles();
            for (File listOfFile : listOfFiles) {
                if (listOfFile.isDirectory())
                    this.listFilesDirectory(path + listOfFile.getName());
                else
                    this.files.put(listOfFile.getName(), listOfFile.getAbsolutePath());
            }
            return this.files;
        }
        return null;
    }

    public Set<String> getDirectoriesFromPath(String path) {

        final Set<String> directories = new HashSet<>();

        if (!FileHelper.fileExists(path))
            return directories;

        final File folder = new File(path);
        final File[] listOfFiles = folder.listFiles();

        if (null == listOfFiles)
            return directories;

        Arrays.stream(listOfFiles)
                .filter(File::isDirectory)
                .forEach(file -> directories.add(file.getName()));

        return directories;
    }

    public static InputStream convertStringToInputStream(String value) {
        return new ByteArrayInputStream(value.getBytes(StandardCharsets.UTF_8));
    }

    //Converte file to string
    public static String convertToString(Part file) throws IOException {
        if (file != null) {
            InputStream is = file.getInputStream();
            StringBuilder code = new StringBuilder();
            String ls = System.getProperty("line.separator");
            String line = null;
            DataInputStream in = new DataInputStream(is);
            BufferedReader d = new BufferedReader(new InputStreamReader(in));
            try {
                while ((line = d.readLine()) != null) {
                    code.append(line);
                    code.append(ls);
                }
            } finally {
                is.close();
                in.close();
                d.close();
                file.delete();
            }
            return code.toString();
        }
        return null;
    }

    //Converte InputStream to String
    public static String convertToString(InputStream inputStream) throws IOException {
        if (inputStream != null) {
            StringBuilder code = new StringBuilder();
            String ls = System.getProperty("line.separator");
            String line = null;
            DataInputStream in = new DataInputStream(inputStream);
            BufferedReader d = new BufferedReader(new InputStreamReader(in));
            try {
                while ((line = d.readLine()) != null) {
                    code.append(line);
                    code.append(ls);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                inputStream.close();
                in.close();
                d.close();
            }
            return code.toString();
        }
        return null;
    }

    //Save file in a specific directory
    public static boolean save(String path, String fileName, String data, String encodeIn, String encodeOut) throws IOException {
        boolean isSaved = true;
        String fName = path + (fileName != null ? (File.separator + fileName) : "");
        File file = new File(fName);
        try {
            FileHelper.createDiretory(path);
            if (Core.isNotNull(encodeIn))
                FileUtils.writeByteArrayToFile(file, data.getBytes(encodeIn));
            else
                FileUtils.writeByteArrayToFile(file, data.getBytes());

        } catch (IOException e) {
            isSaved = false;
            e.printStackTrace();
        }
        return isSaved;
    }

    //Save file in a specific directory
    public static boolean save(String path, String fileName, String data) throws IOException {
        return FileHelper.save(path, fileName, data, null, null);
    }

    //Write data using default encode UTF-8
    public static boolean save(String path, String filename, Part file) throws IOException {
        return FileHelper.save(path, filename, convertToString(file));
    }

    //Write data using default encode UTF-8
    public static boolean saveFile(String path, String filename, Part file) throws IOException {
        return FileHelper.saveFile(path, filename, file, StandardCharsets.UTF_8.name(), StandardCharsets.UTF_8.name());
    }

    public static boolean saveFile(String path, String filename, Part file, String encodeIn, String encodeOut) throws IOException {
        boolean isSaved = true;
        String fileName = path + (filename != null ? (File.separator + filename) : "");
        try {
            FileHelper.createDiretory(path);
            FileUtils.writeByteArrayToFile(new File(fileName), FileHelper.convertInputStreamToByte(file.getInputStream()));
        } catch (IOException e) {
            e.printStackTrace();
            isSaved = false;
        }
        return isSaved;
    }


    //save image using default encode UTF-8
    public static boolean saveImage(String path, String filename, String formatName, Part file) throws IOException {
        return saveImage(path, filename, formatName, file, StandardCharsets.UTF_8.name(), StandardCharsets.UTF_8.name());
    }

    public static boolean saveImage(String path, String filename, String formatName, Part filePart, String encodeIn, String encodeOut) throws IOException {
        boolean isSaved = true;
        if (formatName.equals("svg"))
            isSaved = saveFile(path, filename, filePart, StandardCharsets.UTF_8.name(), StandardCharsets.UTF_8.name());
        else {
            FileHelper.createDiretory(path);
            BufferedImage bImage;
            try {
                String fileName = path + (filename != null ? (File.separator + filename) : "");
                File file = new File(fileName);
                bImage = ImageIO.read(filePart.getInputStream());
                ImageIO.write(bImage, formatName, file);
                bImage.flush();
            } catch (IOException e) {
                isSaved = false;
                e.printStackTrace();
            }
        }

        return isSaved;
    }

    //Create directories
    public static boolean createDiretory(String path) {
        Path dir = Paths.get(path);
        try {
            if (!Files.exists(dir)) {
                FileUtils.forceMkdir(new File(path));
                Files.createDirectories(dir);
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean fileExists(String fileName) {

        if (Core.isNull(fileName))
            return false;

        return Files.exists(Paths.get(fileName));
    }

    public static boolean dirExists(String dirName) {
        return fileExists(dirName);
    }

    //Read file and return your content
    public static String readFile(String basePath, String fileName) {
        String code = "";
        String file = fileName;
        if (Core.isNotNull(file))
            file = basePath + File.separator + fileName;
        else
            file = basePath;
        if (fileExists(file)) {
            try {
                code = FileUtils.readFileToString(new File(file), StandardCharsets.UTF_8);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return code;
    }

    //Read file and return your content
    public static String readImage(String basePath, String fileName) {
        return FileHelper.readFile(basePath, fileName);
    }

    public static String readFileFromServer(String basePath, String fileName) {
        return FileHelper.readFile(basePath, fileName);
    }

    public static boolean renameFile(String classPath, String oldName, String newName) throws IOException {
        Path pathFile = Paths.get(classPath + oldName);
        return Files.move(pathFile, pathFile.resolveSibling(newName)) != null;
    }

    public static File saveFilesJavaControllerAndReplace(String classPath, String fileName, String content) {
        try {
            FileHelper.save(classPath, fileName + "Controller.java", content);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new File(classPath + File.separator + fileName + "Controller.java");
    }

    public static File saveFilesJavaAndNotReplace(String classPath, String fileName, String content) {
        try {
            if (!fileExists(classPath + File.separator + fileName + ".java"))
                FileHelper.save(classPath, fileName + ".java", content);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new File(classPath + File.separator + fileName + ".java");
    }

    //Save MVC code java
    public static boolean saveFilesJava(String path, String page, Part[] content) throws IOException {
        return FileHelper.saveFile(path, page + ".java", content[0]) && // Save Model;
                FileHelper.saveFile(path, page + "View.java", content[1]) && //Save View
                FileHelper.saveFile(path, page + "Controller.java", content[2]);
    }

    //Save files json, xml and xsl of the page
    public static boolean saveFilesPageConfig(String path, String page, Part[] content) throws IOException {
        return FileHelper.saveFile(path, page + ".xml", content[0]) && // Save xml;
                FileHelper.saveFile(path, page + ".xsl", content[1]) && //Save xsl
                FileHelper.saveFile(path, page + ".json", content[2]);
    }

    //Save files json, xml and xsl of the page
    public static boolean saveFilesPageConfig(String path, String page, String[] content) throws IOException {
        return FileHelper.save(path, page + ".xml", content[0]) && // Save xml;
                FileHelper.save(path, page + ".xsl", content[1]) && //Save xsl
                FileHelper.save(path, page + ".json", content[2]);
    }

    public static boolean saveFilesJava(String path, String page, String[] content) throws IOException {
    	String pageDelegatePath = String.format("%s%cpagedelegate", path, File.separatorChar);
		String mvcPath = String.format("%s%cpages%c%s", path, File.separatorChar, File.separatorChar, page.toLowerCase().trim());
    	int index = path.lastIndexOf("pages");
    	if(index != -1) {
    		pageDelegatePath = String.format("%spagedelegate", path.substring(0, index));
    		mvcPath = String.format("%spages%c%s", path.substring(0,index), File.separatorChar, page.toLowerCase().trim());
    	}
        return FileHelper.save(mvcPath, String.format("%s.java", page), content[0]) && // Save Model
                FileHelper.save(mvcPath, String.format("%sView.java", page), content[1]) && //Save View
                FileHelper.save(mvcPath, String.format("%sController.java", page), content[2]) && //Save Controller
                (content.length == 3 || FileHelper.save(pageDelegatePath, String.format("I%sDelegate.java", page), content[3])); // //Save PageDelegate
    }

    public static void deletePartFile(Part file) throws IOException {
        if (file != null)
            file.delete();
    }

    public static void deletePartFile(Part file, Predicate<Part> predicate) throws IOException {
        if (predicate.test(file))
            file.delete();
    }

    public static void deletePartFile(Collection<Part> files) throws IOException {
        for (Part file : files)
            deletePartFile(file);
    }

    public static void deletePartFile(Collection<Part> files, Predicate<Part> test) throws IOException {
        for (Part file : files)
            deletePartFile(file, test);
    }

    public static boolean saveFilesJava(String path, String page, String[] content, String encodeIn, String encodeOut) throws IOException {
    	String pageDelegatePath = String.format("%spagedelegate", path.substring(0, path.lastIndexOf("pages")));
        return FileHelper.save(path, String.format("%s.java", page), content[0], encodeIn, encodeOut) && // Save Model;
                FileHelper.save(path, String.format("%sView.java", page), content[1], encodeIn, encodeOut) && //Save View
                FileHelper.save(path, String.format("%sController.java", page), content[2], encodeIn, encodeOut) && // Save Controller
                (content.length == 3 || FileHelper.save(pageDelegatePath, String.format("I%sDelegate.java", page), content[3], encodeIn, encodeOut)); // Save Page Delegate
    }

    public static boolean saveFilesJava(String path, String page, Part[] content, String encodeIn, String encodeOut) throws IOException {
        return FileHelper.saveFile(path, page + ".java", content[0], encodeIn, encodeOut) && // Save Model;
                FileHelper.saveFile(path, page + "View.java", content[1], encodeIn, encodeOut) && //Save View
                FileHelper.saveFile(path, page + "Controller.java", content[2], encodeIn, encodeOut);
    }

    public static void forceDelete(String fileNameOrDirectory) {
        try {
            File file = new File(fileNameOrDirectory);
            FileUtils.forceDelete(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
}
