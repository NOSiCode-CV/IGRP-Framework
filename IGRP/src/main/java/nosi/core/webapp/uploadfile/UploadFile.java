package nosi.core.webapp.uploadfile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.Part;

import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.TempFile;

/**
 * Emanuel
 * 1 Aug 2019
 */
public class UploadFile {

	private String id;//ID of temp file
	private String name;
	private String submittedFileName;
	private String contentType; // Content-Type 
	private long size; // size of file
	private InputStream inputStream;
	private byte[] bytes;
	
	
	public UploadFile(String id,String name, String submittedFileName, String contentType, long size, InputStream inputStream) {
		super();
		this.id = id;
		this.name = name;
		this.submittedFileName = submittedFileName;
		this.contentType = contentType;
		this.size = size;
		this.inputStream = inputStream;
		if(inputStream!=null) {
			try {
				this.bytes = Core.convertInputStreamToByte(inputStream);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public UploadFile(String id) {
		this.id = id;
		if(Core.isNotNull(this.id) && !this.id.equals("-1")) {
			TempFile tempFile = new TempFile().findOne(this.id);
			if(tempFile!=null) {
				this.setBytes(tempFile.getContent());
				this.setContentType(tempFile.getMime_type());
				this.setInputStream(new ByteArrayInputStream(tempFile.getContent()));
				this.setName(tempFile.getName());
				this.setSize(tempFile.getSize());
				this.setSubmittedFileName(tempFile.getName());
			}
		}
	}

	public UploadFile(Part file) {
		if(file!=null) {
			try {
				this.setBytes(Core.convertInputStreamToByte(file.getInputStream()));
				this.setContentType(file.getContentType());
				this.setInputStream(file.getInputStream());
				this.setName(file.getSubmittedFileName());
				this.setSubmittedFileName(file.getSubmittedFileName());
				this.setSize(file.getSize());
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubmittedFileName() {
		return submittedFileName;
	}
	public void setSubmittedFileName(String submittedFileName) {
		this.submittedFileName = submittedFileName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public byte[] getBytes() {
		return bytes;
	}
	public void setBytes(byte[] bytes) {
		this.bytes = bytes;
	}
	
	public boolean isUploaded() {
		return Core.isNotNullMultiple(this.getSubmittedFileName(),this.getContentType(),this.getInputStream());
	}
}
