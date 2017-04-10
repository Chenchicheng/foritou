package cn.foritou.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class TimeUtil {
	public static Timestamp getTime(Timestamp tt,int month){
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   Calendar cc = Calendar.getInstance();
		   cc.setTime(tt);
		   cc.add(Calendar.MONTH, month); 
		   String ccTime= sdf.format(cc.getTime());
		//获取下个月的时间
		   Timestamp ts = Timestamp.valueOf(ccTime);
		  return ts;
		
	}
	public static Timestamp  addOneMonth(Timestamp tt){
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   Calendar cc = Calendar.getInstance();
		   cc.setTime(tt);
		   cc.add(Calendar.MONTH, 1); 
		   String ccTime= sdf.format(cc.getTime());
		//获取下个月的时间
		   Timestamp ts = Timestamp.valueOf(ccTime);
		  return ts;
		
	}
	 
	
	
	
public static void main(String[] args) {
//获取当前时间
	   Timestamp tt = new Timestamp(System.currentTimeMillis());
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   Calendar cc = Calendar.getInstance();
	   cc.setTime(tt);
	   cc.add(Calendar.MONTH, -1); 
	  
	   String ccTime= sdf.format(cc.getTime());
	//获取下个月的时间
	   Timestamp ts = Timestamp.valueOf(ccTime);
	System.out.println(tt);
	System.out.println(cc);
	System.out.println(ccTime);
	System.out.println(ts);
	
	   
}
}
