package nosi.core.webapp.import_export;
/**
 * @author: Emanuel Pereira
 * 6 Nov 2017
 */
public class FileImportAppOrPage  implements Comparable<FileImportAppOrPage>{

	private String conteudo;
	private String nome;
	private String folder;
	private int order;
	
	public FileImportAppOrPage(String nome, String conteudo, int order) {
		super();
		this.conteudo = conteudo;
		this.nome = nome;
		this.order = order;
	}
	
	public String getConteudo() {
		return conteudo;
	}
	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	
	public String getFolder() {
		return folder;
	}

	public void setFolder(String folder) {
		this.folder = folder;
	}

	@Override
	public int compareTo(FileImportAppOrPage file) {
		if(this.order < file.order) {
			return -1;
		}
		if(this.order > file.order) {
			return 1;
		}
		return 0;
	}

	@Override
	public String toString() {
		return "FileImportAppOrPage [ nome=" + nome + ", folder=" + folder + ", order=" + order + "]";
	}
	
	
}
