package cn.foritou.util;


import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
//用来实现文件上传的业务逻辑

import cn.foritou.model.FileImage;


@Component("fileUpload")
public class FileUploadUtil implements FileUpload {
	@Value("#{prop.basePath+prop.filePath}")
	private String filePath;
	@Value("#{prop.basePath+prop.bankPath}")
	private String bankPath;
	@Value("#{prop.basePath+prop.shopPath}")
	private String shopPath;
	public void setFilePath(String filePath) {
		System.out.println("filePath:"+filePath);
		this.filePath = filePath;
	}
	
	public String[] getBankImage(){
		System.out.println("bankPath:"+bankPath);
		  return  new File(bankPath).list(new FilenameFilter() {
				
				@Override
				public boolean accept(File dir, String name) {//dirw为文件路径，name为文件名
					// TODO 通过后缀名实现文件过滤效果
				//	System.out.println("dir:"+dir+",name,"+name);
					return name.endsWith(".gif");
				}
			});
	}
	

	//1.通过文件名获取扩展名
	private String getFileExt(String fileName){
		return FilenameUtils.getExtension(fileName);
	}
	//2.生成uuid随机数，做为新的的文件名	
	private String newFileName(String fileName){
	String ext=getFileExt(fileName);
	return UUID.randomUUID().toString()+"."+ext;
}
	//3.实现文件上传的功能，返回上传后新的文件名称
@Override
public String uploadFile(FileImage fileImage){
	//获取到新唯一文件名
System.out.println("此时的shoppath:"+shopPath);
System.out.println("进入uploadFile时的fileImage:"+fileImage);
String pic=	newFileName(fileImage.getFilename());
System.out.println(pic);
try {
	FileUtil.copyFile(fileImage.getFile(), new File(shopPath,pic));
	return pic;
} catch (IOException e) {
	// TODO Auto-generated catch block
	throw new RuntimeException(e);
}finally{
	try {
		fileImage.getFile().delete();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("没关系！");
	}
}

	
}

}
