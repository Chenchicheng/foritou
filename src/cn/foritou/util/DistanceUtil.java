package cn.foritou.util;

import java.util.ArrayList;
import java.util.List;

import cn.foritou.model.Distance;
import cn.foritou.model.Product;
import cn.foritou.model.Shop;
import cn.foritou.model.Store;
public class DistanceUtil {
	public static void main(String[] args) {
		
		  
		        List<Integer> list = new ArrayList<Integer>();  
		        list.add(76);  
		        list.add(4);  
		        list.add(786);  
		        list.add(43);  
		        list.add(21);  
		        list.add(432);  
		        list.add(10);  
		        for (int i = 0; i < list.size() - 1; i++) {  
		            for (int j = 1; j < list.size() - i; j++) {  
		                Integer a;  
		                if ((list.get(j - 1)).compareTo(list.get(j)) > 0) { // 比较两个整数的大小  
		  
		                    a = list.get(j - 1);  
		                    list.set((j - 1), list.get(j));  
		                    list.set(j, a);  
		                }  
		            }  
		        }  
		        for (Integer s : list) {  
		            System.out.println("-----------"+s.intValue());  
		        }  
		    
		
		
		
		
		
		
		
		
		
		
		
		List<String> scoreList=new ArrayList<String>();
		scoreList.add("1,2");
		scoreList.add("3,4");
		scoreList.add("4,5");

		scoreList.add("9,1");
		scoreList.add("7,2");
		scoreList.add("6,3");
		scoreList.add("4,6");
		scoreList.add("3,1");
		scoreList.add("3,2");
		scoreList.add("2,1");
		scoreList.add("1,1");
		
	
		
	String s=	DistanceUtil.getSmallDistance("2", "4",scoreList);
	}
	
	public static String getSmallDistance(String latitude,String longitude,List<String> storeSet){
		double lati=Double.parseDouble(latitude);
		double longi=Double.parseDouble(longitude);
		int i=-1,index=0;
		double distance=9999999999.0;
		for(String str:storeSet){
			
	      i++;
	      System.out.println("第几个："+i);
			double a[]=new double[2];
			a[0]=Double.parseDouble(str.split(",")[0]);
			a[1]=Double.parseDouble(str.split(",")[1]);
			System.out.println("a[0]:"+a[0]);
			System.out.println("a[1]:"+a[1]);
			double realDistance=Math.sqrt(Math.pow(lati-a[0], 2)+Math.pow(longi-a[1],2));
			System.out.println(realDistance);
			if(distance>realDistance){
	
				distance=realDistance;
				index=i;
				
			}
			
			
			
		}
		System.out.println("结果："+index);
		return "true";
	}
	

	
	public static List<Integer> getSmallDistance(String  longitude,String latitude,List<Shop> shopList){
		List<Product> productList=new ArrayList<Product>();
		List<Distance> distanceList=new ArrayList<Distance>();
		List<Integer> sidList=new ArrayList<Integer>();
		double lati=Double.parseDouble(latitude);//纬度
		double longi=Double.parseDouble(longitude);//经度	
		for(Shop shop:shopList){
	
			String addressMap=shop.getAddressmap();
			double a[]=new double[2];
			a[0]=Double.parseDouble(addressMap.split(",")[0]);
			a[1]=Double.parseDouble(addressMap.split(",")[1]);
			double realDistance=Math.sqrt(Math.pow(longi-a[0], 2)+Math.pow(lati-a[1],2));
		    Distance distance=new Distance();
		    distance.setSid(shop.getId());
		    distance.setDistance(realDistance);
		    distanceList.add(distance);
		 
		}
		
		   for (int i = 0; i < distanceList.size() - 1; i++) {  
	            for (int j = 1; j < distanceList.size() - i; j++) {  
	                Distance a=new Distance();  
	                if ((distanceList.get(j - 1).getDistance())>(distanceList.get(j).getDistance()) ) { // 比较两个整数的大小  
	  
	                    a = distanceList.get(j - 1);  
	                    distanceList.set((j - 1), distanceList.get(j));  
	                    distanceList.set(j, a);  
	                }  
	            }  
	        } 
		for(Distance d:distanceList){
		sidList.add(d.getSid());
		}    
		return sidList;
	}
public static Store getSmallDistance(String latitude,String longitude,List<Store> storeList){
	double lati=Double.parseDouble(latitude);
	double longi=Double.parseDouble(longitude);
	int i=-1,index=0;
	double distance=99999999999999999.0;
	for(Store store:storeList){
	      i++;
		String addressMap=store.getAddressmap();
		double a[]=new double[2];
		a[0]=Double.parseDouble(addressMap.split(",")[0]);
		a[1]=Double.parseDouble(addressMap.split(",")[1]);
		double realDistance=Math.sqrt(Math.pow(lati-a[0], 2)+Math.pow(longi-a[1],2));
		if(distance<realDistance){
			distance=realDistance;
			index=i;
			
		}
		
		
		
	}
	return storeList.get(index);

}



private static double EARTH_RADIUS = 6378137.0;
//通过经度纬度求距离
private static double rad(double d)  
{  
   return d * Math.PI / 180.0;  
}  
public static double  LantitudeLongitude(String lat1, String lon1,Store store){
	double lati=Double.parseDouble(lat1);
	double longi=Double.parseDouble(lon1);
	String addressMap=store.getAddressmap();
	double a[]=new double[2];
	a[0]=Double.parseDouble(addressMap.split(",")[0]);
	a[1]=Double.parseDouble(addressMap.split(",")[1]);
	
	
	return LantitudeLongitudeDist( longi,  lati, a[1],a[0]);
	
	
	
	
}

/** 
 * 基于余弦定理求两经纬度距离 
 * @param lon1 第一点的精度 
 * @param lat1 第一点的纬度 
 * @param lon2 第二点的精度 
 * @param lat3 第二点的纬度 
 * @return 返回的距离，单位km 
 * */  

public static double LantitudeLongitudeDist(double lon1, double lat1,double lon2, double lat2) {  
    double radLat1 = rad(lat1);  
    double radLat2 = rad(lat2);  

    double radLon1 = rad(lon1);  
    double radLon2 = rad(lon2);  

    if (radLat1 < 0)  
        radLat1 = Math.PI / 2 + Math.abs(radLat1);// south  
    if (radLat1 > 0)  
        radLat1 = Math.PI / 2 - Math.abs(radLat1);// north  
    if (radLon1 < 0)  
        radLon1 = Math.PI * 2 - Math.abs(radLon1);// west  
    if (radLat2 < 0)  
        radLat2 = Math.PI / 2 + Math.abs(radLat2);// south  
    if (radLat2 > 0)  
        radLat2 = Math.PI / 2 - Math.abs(radLat2);// north  
    if (radLon2 < 0)  
        radLon2 = Math.PI * 2 - Math.abs(radLon2);// west  
    double x1 = EARTH_RADIUS * Math.cos(radLon1) * Math.sin(radLat1);  
    double y1 = EARTH_RADIUS * Math.sin(radLon1) * Math.sin(radLat1);  
    double z1 = EARTH_RADIUS * Math.cos(radLat1);  

    double x2 = EARTH_RADIUS * Math.cos(radLon2) * Math.sin(radLat2);  
    double y2 = EARTH_RADIUS * Math.sin(radLon2) * Math.sin(radLat2);  
    double z2 = EARTH_RADIUS * Math.cos(radLat2);  

    double d = Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)+ (z1 - z2) * (z1 - z2));  
    //余弦定理求夹角  
    double theta = Math.acos((EARTH_RADIUS * EARTH_RADIUS + EARTH_RADIUS * EARTH_RADIUS - d * d) / (2 * EARTH_RADIUS * EARTH_RADIUS));  
    double dist = theta * EARTH_RADIUS;  
    return dist;  
}











}
