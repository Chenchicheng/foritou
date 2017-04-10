package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Collection;
import cn.foritou.model.Comments;
import cn.foritou.model.Company;
import cn.foritou.model.Distance;
import cn.foritou.model.Employee;
import cn.foritou.model.Product;
import cn.foritou.model.Score;
import cn.foritou.model.ScoreData;
import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Store;
import cn.foritou.model.Usernotes;
import cn.foritou.util.DigestUtil;
import cn.foritou.util.DistanceUtil;
import cn.foritou.util.GroomShopUtil;
import cn.foritou.util.LogonUtils;
@Controller
@Scope("prototype")
public class ShopAction extends BaseAction<Shop> {
public String login() throws UnsupportedEncodingException{
	//获取到商家的用户须知信息放到session中	
	//进行登录的判断
	if(model.getPassword()!=null&&!model.getPassword().equals("")){
		 model.setPassword(DigestUtil.hmacSign(model.getPassword(), "deepnets"));	
	}
	model=shopService.login(model);
	System.out.println("stlist:"+application.get("stlist"));
	System.out.println("bankList:"+application.get("bankList"));
	//添加记住我的功能
	LogonUtils.remeberMeByCookie2(request2, response2);
	if(model==null){
		//session.put("error", "用户名或密码错误");
		request.put("loginError", "用户名或密码错误");
	return "slogin";
	}else{
		//登录成功，先存储到session，则根据情况返回相应的页面
		session.put("shop", model);
		session.put("usernotes",usernotesService.querybySid(model.getId()));
		//根据session中goURL是否有值而决定页面的跳
			return "index";
	
		
	}
}

public String enroll(){
		try {
	    model.setPassword(DigestUtil.hmacSign(model.getPassword(), "deepnets"));
		shopService.save(model);
		Product product=new Product();
		product.setShop(model);
		productService.save(product);
		//注册好生成一条用户须知记录
	    Usernotes usernotes=new Usernotes();
	     usernotes.setShopname(model.getName());
	     usernotes.setShop(model);
	    usernotesService.save(usernotes);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	return "enroll";	
}
//2016、12/1日新方法
public String wxShopXQ(){
	try {
		System.out.println("-------------"+model.getId());
		pageMap=new HashMap<String, Object>();
		Shop shop=shopService.get(model.getId());
		Usernotes usernotes=usernotesService.querybySid(model.getId());
		String jieshao=shop.getDescrible();
		List<String> imageList=new ArrayList<String>();
		for(Shopimage image:shopimageService.getImageListbyType("介绍展示", shop.getId())){
			imageList.add("http://localhost:8080:/foritou/image/shop/"+image.getHref());
		}
		pageMap.put("usernotes", usernotes);
		pageMap.put("jieshao", jieshao);
		
		pageMap.put("imageUrl", imageList);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	return "jsonMap";	
}

public String getNearbyShop(){
	System.out.println("纬度："+latitude);
	System.out.println("经度度："+longitude);
	System.out.println("开始的id:"+start);
	System.out.println("pageSize:"+pageSize);
	List<Product> productList=new ArrayList<Product>();
	List<Shop> shopList=shopService.query();
	List<Integer> sidList=new ArrayList<Integer>();
	sidList=DistanceUtil.getSmallDistance(longitude, latitude, shopList);
	
	if(start==0&&sidList.size()<pageSize){
		for(int i=0;i<sidList.size();i++){
			Product product=new Product();
			product=productService.getbysid(sidList.get(i));
			productList.add(product);
		} 
		
	}else if(start==0&&sidList.size()>pageSize){
		
		for(int i=0;i<pageSize;i++){
			Product product=new Product();
			product=productService.getbysid(sidList.get(i));
			productList.add(product);
		} 
	}else if(start>0&&(sidList.size()>pageSize||sidList.size()==pageSize)&&(sidList.size()-start)<pageSize){
		
		for(int i=start;i<sidList.size() ;i++){
			Product product=new Product();
			product=productService.getbysid(sidList.get(i));
			productList.add(product);
		} 
		
	}else if(start>0&&(sidList.size()>pageSize||sidList.size()==pageSize)&&((sidList.size()-start)>pageSize||(sidList.size()-start)==pageSize)){
		

		for(int i=start;i<start+pageSize;i++){
			Product product=new Product();
			product=productService.getbysid(sidList.get(i));
			productList.add(product);
		} 
		
	}
	
	
  
  session.put("shopbytypeList", productList);
	return "nearby";
}

public String getShopByArea(){

       try {
		model.setArea(new String(model.getArea().getBytes("ISO-8859-1"),"utf-8"));
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   	System.out.println("区域："+model.getArea());
	System.out.println("开始id："+start);
	System.out.println("pageSize:"+pageSize);
	List<Shop> shopList=new ArrayList<Shop>();
	List<Product> productList=new ArrayList<Product>();
	shopList=shopService.queryByQu(model.getArea(), start, pageSize);
	for(Shop shop:shopList){
		Product product=new Product();
		product=productService.getbysid(shop.getId());
		productList.add(product);
	}
	session.put("shopbytypeList", productList);
	return "nearby";
}
public String getShopByShangquan(){
	try {
		model.setShangquan(new String(model.getShangquan().getBytes("ISO-8859-1"),"utf-8"));
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("商圈："+model.getShangquan());
	System.out.println("开始id："+start);
	System.out.println("pageSize:"+pageSize);
	List<Shop> shopList=new ArrayList<Shop>();
	List<Product> productList=new ArrayList<Product>();
	shopList=shopService.queryByQuan(model.getShangquan(), start, pageSize);
	for(Shop shop:shopList){
		Product product=new Product();
		product=productService.getbysid(shop.getId());
		productList.add(product);
	}
	session.put("shopbytypeList", productList);
	return "nearby";
}
public String getShopBySearch(){
	int i=0;
	System.out.println("关键字："+searchString);
	System.out.println("开始id："+start);
	System.out.println("pageSize:"+pageSize);

	List<Shop> shopList=new ArrayList<Shop>();
	List<Shop> shopsonList=new ArrayList<Shop>();
	List<Product> productList=new ArrayList<Product>();
    shopList=shopService.Search(searchString, start, pageSize);
	if(shopList.size()<pageSize){
	while(i<searchString.length()&&shopList.size()<pageSize){
	
		shopsonList=shopService.Search(String.valueOf(searchString.charAt(i)), 0, pageSize-shopList.size());
		shopList.addAll(shopsonList);
		i++;
	}
	}

 for ( int k = 0 ; k <shopList.size() - 1 ; k ++ ) {  
		     for ( int j =shopList.size() - 1 ; j > k; j --) {  
		       if (shopList.get(j).getId()==shopList.get(k).getId()) {  
		         shopList.remove(j);  
		       }   
		      }   
		    }  
	for(Shop shop:shopList){
		Product product=new Product();
		product=productService.getbysid(shop.getId());
		productList.add(product);
	}
	session.put("shopbytypeList", productList);
	return "nearby";
}
public String getShopByHot(){
	int i=0;
	try {
		searchString=new String(searchString.getBytes("ISO-8859-1"),"utf-8");
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("关键字："+searchString);
	System.out.println("开始id："+start);
	System.out.println("pageSize:"+pageSize);

	List<Shop> shopList=new ArrayList<Shop>();
	List<Shop> shopsonList=new ArrayList<Shop>();
	List<Product> productList=new ArrayList<Product>();
    shopList=shopService.Search(searchString, start, pageSize);
	if(shopList.size()<pageSize){
	while(i<searchString.length()&&shopList.size()<pageSize){
	
		shopsonList=shopService.Search(String.valueOf(searchString.charAt(i)), 0, pageSize-shopList.size());
		shopList.addAll(shopsonList);
		i++;
	}
	}

 for ( int k = 0 ; k <shopList.size() - 1 ; k ++ ) {  
		     for ( int j =shopList.size() - 1 ; j > k; j --) {  
		       if (shopList.get(j).getId()==shopList.get(k).getId()) {  
		         shopList.remove(j);  
		       }   
		      }   
		    }  
	for(Shop shop:shopList){
		Product product=new Product();
		product=productService.getbysid(shop.getId());
		productList.add(product);
	}
	session.put("shopbytypeList", productList);
	return "nearby";
}
public String checkPhone(){//验证手机号码是否已经注册

	   inputStream=new ByteArrayInputStream("true".getBytes());
	   for(Shop shop:shopService.query()){	
		 if(model.getPhone().equals(shop.getPhone())){
			 inputStream=new ByteArrayInputStream("false".getBytes());
		 }
	 }
	return "stream";
}

//--------------------------------------------华丽的分割线---------------------------


public String wxGetShop(){
System.out.println("纬度："+latitude);
System.out.println("经度："+longitude);
	pageMap=new HashMap<String, Object>();
	Shop shop=shopService.get(model.getId());
	Usernotes usernotes=usernotesService.querybySid(model.getId());
	List<Store> storeList=storeService.getStorebySid(model.getId());
	
	Store store=DistanceUtil.getSmallDistance(longitude, latitude, storeList);    
	System.out.println("分店："+store.getId());
	double distance=DistanceUtil.LantitudeLongitude(longitude, latitude, store);
  
	if(distance>1000){
    	 
    	 distance=(int)distance/1000;
    	 pageMap.put("distance", distance+"km");
     }else{
    	 distance=(int)distance;
    	 pageMap.put("distance", distance+"m");
     }
	System.out.println("距离："+distance);
	pageMap.put("store", store);
	pageMap.put("usernotes", usernotes);
	pageMap.put("shop", shop);
    
	List<String> imageList=new ArrayList<String>();
	for(Shopimage image: shopimageService.getImageListby(shop.getId(),"首页展示", 1, 4)){
		imageList.add("http://localhost:8080:/foritou/image/shop/"+image.getHref());
	}
	
	
	
	pageMap.put("imageUrl", imageList);
	
	
	
	
	return "jsonMap";
}
public String get(){
//清空collection
	if(session.get("collection")!=null){
	session.remove("collection");
	}
	Shop shop=shopService.get(model.getId());
	if(session.get("company")!=null){
		Collection collection=(Collection)collectionService.check(((Company)session.get("company")).getId(),shop.getId());
		if(collection!=null){
			session.put("collection", collection);	
		}
	}
	session.put("shopLook",shop);
	session.put("dimageList", shopimageService.getImageListby(shop.getId(),"首页展示", 1, 4));
	//获取商家介绍时的图片
	session.put("jimageList", shopimageService.getImageListbyType("介绍展示", shop.getId()));
	//获取商家的折扣信息
	session.put("discount",discountService.getDiscount(shop.getId(), 1));//默认显示规模为1(0~50)人的规模		
	//获取上家的评分信息和收藏人数
	List<Score> scoreList=scoreService.getScorebySid(shop.getId());
	Long scorecount=scoreService.getCountbyShop(shop);
	double aveScore=0;
	for(Score score:scoreList){
	   aveScore+=score.getScorenumber();
	}
	if(scorecount!=0){
		aveScore=aveScore/scorecount;
	}else{
		aveScore=0;
	}
	int collectionNumber=collectionService.getbySid(shop.getId()).size();
	
	//收藏人数还没改
	session.put("scoreData", new ScoreData(aveScore,scorecount, collectionNumber));
	//获取分店
	session.put("storeList", storeService.getStore(shop.getId(), 1, 3));
	//获取够买须知
	session.put("usernotes", usernotesService.querybySid(shop.getId()));
	//获取本店所有的折扣信息，获取size
	session.put("discountList", discountService.queryJoinSize(shop.getId()));
	System.out.println("----------------------获取推荐商家--------------------");
	List<Integer> sidList=new ArrayList<Integer>();
	List<Distance> distanceList=new ArrayList<Distance>();
	for(Shop groomShop:shopService.queryByType(shop.getShoptype().getId())){
		Distance distance=new Distance();
		distance.setSid(groomShop.getId());
		distance.setDistance(GroomShopUtil.getPoor(shop.getCoefficient(), groomShop.getCoefficient()));
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
	List<Product> productList=new ArrayList<Product>();
	for(int i=0;i<sidList.size();i++){//这里需要修改	   
		Product product=new Product();
		product=productService.getbysid(sidList.get(i));
		productList.add(product);
		
	}

	session.put("groomProductList", productList);
	System.out.println("------------------------华丽的分割线---------------------");
	//评论信息
	System.out.println("------------这个时候的shopid："+shop.getId());
	List<Comments> commentsList=new ArrayList<Comments>();
	commentsList=commentsService.getBysid(shop.getId());
	session.put("commentsList", commentsList);
	return "companyLook";	
}
public String getDetail(){
	
Shop shop=(Shop) session.get("shop");
//这里是判断是否登录
//地图上的展示
//获取展示的图片
session.put("dimageList", shopimageService.getImageListby(shop.getId(),"首页展示", 1, 4));
//获取商家介绍时的图片
session.put("jimageList", shopimageService.getImageListbyType("介绍展示", shop.getId()));
//获取商家的折扣信息
session.put("discount",discountService.getDiscount(shop.getId(), 1));//默认显示规模为1(0~50)人的规模		
//获取上家的评分信息和收藏人数
List<Score> scoreList=scoreService.getScorebySid(shop.getId());
Long scorecount=scoreService.getCountbyShop(shop);
double aveScore=0;
for(Score score:scoreList){
   aveScore+=score.getScorenumber();
}
aveScore=aveScore/scorecount;
//收藏人数还没改
session.put("scoreData", new ScoreData(aveScore,scorecount, scorecount));
//获取分店
session.put("storeList", storeService.getStore(shop.getId(), 1, 3));
//获取够买须知
session.put("usernotes", usernotesService.querybySid(shop.getId()));
//获取本店所有的折扣信息，获取size
session.put("discountList", discountService.queryJoinSize(shop.getId()));
//获取推荐的商家、
if(session.get("shopLook")!=null && session.get("company")!=null){
	Collection collection=collectionService.check(((Company)session.get("company")).getId(),((Shop)session.get("shopLook")).getId());
	if(collection!=null){
		session.put("collection",collection);
	}
	
}

return "detail";
}















private int shoptypeid;


public int getShoptypeid() {
	return shoptypeid;
}

public void setShoptypeid(int shoptypeid) {
	this.shoptypeid = shoptypeid;
}

public String update(){
	try {
	
		System.out.println(model.getAddress());
		System.out.println(shoptypeid);
		model.setShoptype(ShoptypeService.getbyId(shoptypeid));
		
		
		shopService.update(model);
		session.put("shop", shopService.get(model.getId()));
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "updateinfo";
	
}
}
