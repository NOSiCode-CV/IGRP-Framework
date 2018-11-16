package nosi.core.webapp;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

/**
 * Marcel Iekiny
 * Oct 24, 2017
 */
public final class UploadedFile {
	
	private String fileName;
	private String submittedFileName;
	private String type; // Content-Type 
	private String extension;
	private long size; // bytes
	
	private InputStream in;
	
	private UploadedFile() {}
	
	public static UploadedFile getInstance(String name) {
		UploadedFile file = null;
		try {
			Part part = Igrp.getInstance().getRequest().getPart(name);
			file = new UploadedFile();
			file.fileName = part.getName();
			file.submittedFileName = part.getSubmittedFileName();
			file.type = part.getContentType();
			file.extension = "."+file.type.split("/")[1];
			file.size = part.getSize();
			file.in = part.getInputStream();
		}catch(Exception e){
			e.printStackTrace();
		}
		return file;
	}
	
	public static List<UploadedFile> getInstances() {
		List<UploadedFile> files = new ArrayList<UploadedFile>();
		try {
			ArrayList<Part> list = new ArrayList<Part>(Igrp.getInstance().getRequest().getParts());
			for(Part obj : list) {
				UploadedFile aux = new UploadedFile();
				aux.fileName = obj.getName();
				aux.submittedFileName = obj.getSubmittedFileName();
				//System.out.println(aux.submittedFileName);
				aux.type = obj.getContentType();
				//aux.extension = aux.type.split("/")[1];
				aux.size = obj.getSize();
				aux.in = obj.getInputStream();
				files.add(aux);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return files;
	}
	
	public static List<UploadedFile> getInstances(String name) {
		List<UploadedFile> files = getInstances();
		files.removeIf((file) -> !file.getFileName().equalsIgnoreCase(name));
		return files;
	}
	
	public boolean saveAs(String path) {
		String result = Igrp.getInstance().getServlet().getServletContext().getRealPath(path);
		File file = new File(result);
		boolean flag = false;
		try {
			file.createNewFile();
			FileOutputStream out = new FileOutputStream(file);
			out.write(this.getContent());
			out.flush();
			out.close();
			flag = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public byte[] getContent() {
		BufferedInputStream stream = new BufferedInputStream(in);
		byte []result = new byte[(int) this.size];
		try {
			int x = stream.read(result);
			if(x == -1) result = null;
		} catch (IOException e) {
			e.printStackTrace();
			result = null;
		}finally {
			try {
				stream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSubmittedFileName() {
		return submittedFileName;
	}

	public void setSubmittedFileName(String submittedFileName) {
		this.submittedFileName = submittedFileName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "UploadedFile [fileName=" + fileName + ", submittedFileName=" + submittedFileName + ", type=" + type
				+ ", extension=" + extension + ", size=" + size + "]";
	}
	
}
