package cn.foritou.model;
import java.io.File;

public class FileImage {
private File file;
private String contentType;
private String filename;
public File getFile() {
	return file;
}
public String getContentType() {
	return contentType;
}
public String getFilename() {
	return filename;
}
public void setUpload(File file){
	System.out.println("file:"+file);
	this.file=file;
}
public void setUploadContentType(String contentType){
	System.out.println("contentType:"+contentType);
	this.contentType=contentType;
	
}
public void setUploadFileName(String filename){
	System.out.println("filename:"+filename);
	this.filename=filename;
}

}
