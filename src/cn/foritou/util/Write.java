package cn.foritou.util;


import java.io.File;
import java.io.RandomAccessFile;
 
 
/**
 * 
 * @author sie1501
 *
 */
public class Write{
  
    public static void insertNewLine(String insertContent, int line) {
        try {
            File srcFile = new File("D:\\1.txt");//首先存在文件,文件内容:1 2 3
            if (srcFile.exists()) {
                File temp = new File("D:\\2.txt");
                RandomAccessFile read = new RandomAccessFile(srcFile, "rw");
                RandomAccessFile insert = new RandomAccessFile(temp, "rw");
                String str = "";
                int index = 0;
            
            
     
                while (null != (str = read.readLine())) {
                	
                    if (index == line) {//等于写入行号时
                        insert.write((insertContent + str+"\n\r").getBytes());//写入新内容+原有内容
                    } else {
                        insert.write((str+"\n\r").getBytes());//写入原有内容
                    }
 
                    index++;
                }
         
 
                if (index < line) {//行号大于文件行数,在文件末位处添加内容
                    long length = temp.length();//原有文件长度
                    insert.seek(length);
                    insert.write(insertContent.getBytes());//写入文件末尾处
                }
 
                insert.close();
                read.close();
                read = new RandomAccessFile(srcFile, "rw");
 
                insert = new RandomAccessFile(temp, "rw");
                while (null != (str = insert.readLine())) {//将临时文件内容写到源文件
                    read.write((str + "\n\r").getBytes());
                }
 
                read.close();
                insert.close();
                temp.delete();//删除临时文件
                System.out.println("--------------End ----------");
 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    public static void main(String[] args) {
 
        insertNewLine("line0d", 8);//第一行插入 line0
      System.out.println("end");
     
    }
 
}