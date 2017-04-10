package cn.foritou.util;

import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.RandomAccessFile;

public class Write2 {
	public static void writeToTxt(String filePath,String value){
		  try {
			RandomAccessFile rf = new RandomAccessFile(filePath, "rw");
		    long count = rf.length(); 
		    rf.seek(count);  
		    rf.writeBytes(value+"\r\n");
		    rf.close();  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
	}
	
	
	public static void main(String[] args) {
		
		
		Write2.writeToTxt("d:1.txt",1+"\t"+8+"\t"+1+"\t"+875072484 );
		
		try {  
		    RandomAccessFile rf = new RandomAccessFile("d://1.txt", "rw");  
		    long count = rf.length(); 
		    System.out.println(count);
		  
		    rf.seek(count);  
		             
		    // 如要换行，用 /r/n 次序不要乱  
		  //rf.writeBytes("ABC "+"\r\n"); //只是写入字符的时候不会乱码，如果需要写入汉字，需要用下面这一行的方法  
		              
		    String strfile = new String("在最后一行写入数据GFGFGF！".getBytes(),"ISO_8859-1");   
		 //   rf.writeBytes(strfile+"\r\n");  
		    rf.close();  
		  
		} catch (Exception e) {  
		    System.err.println("读写出错");  
		}  
		
	}
	  
}
