package cn.foritou.util;

import cn.foritou.model.FileImage;
public interface FileUpload {

	//3.实现文件上传的功能，返回上传后新的文件名称
	public  String uploadFile(FileImage fileImage);
   public String[] getBankImage();
}