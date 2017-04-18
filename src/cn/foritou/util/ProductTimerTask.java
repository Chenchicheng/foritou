package cn.foritou.util;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;

import cn.foritou.model.Average;
import cn.foritou.model.Comments;
import cn.foritou.model.Company;
import cn.foritou.model.Discount;
import cn.foritou.model.Employee;
import cn.foritou.model.Product;
import cn.foritou.model.Related;
import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.model.Shoptype;
import cn.foritou.service.AverageService;
import cn.foritou.service.CollectionService;
import cn.foritou.service.CommentsService;
import cn.foritou.service.CompanyService;
import cn.foritou.service.DiscountService;
import cn.foritou.service.OrderService;
import cn.foritou.service.ProductService;
import cn.foritou.service.RelatedService;
import cn.foritou.service.ScoreService;
import cn.foritou.service.ShopService;
import cn.foritou.service.ShopimageService;
import cn.foritou.service.ShoptypeService;

/*
 * 设置一个任务：run方法中用来加载首页商品信息数据
 */
@Component("productTimerTask")
public class ProductTimerTask extends TimerTask{
	@Resource
     private ShoptypeService shoptypeService=null;
	@Resource
    private ShopimageService  shopimageService=null;
	@Resource
    private ScoreService scoreService=null;
	@Resource
    private ShopService shopService=null;
	@Resource
    private ProductService productService=null;
	@Resource
    private DiscountService discountService=null;
	@Resource
	protected CollectionService collectionService=null;
	@Resource
	protected CommentsService  commentsService=null;
	@Resource
	protected CompanyService  companyService=null;
	@Resource
	protected OrderService  orderService=null;
	@Resource
	protected AverageService  averageService=null;
	@Resource
	protected  RelatedService  relatedService=null;
	  private ServletContext application=null;//内置对象
	public void setApplication(ServletContext application) {
		this.application = application;
	}

	@Override
	public void run() {
		System.out.println("---------------重新开始----------------");
	  //  List<Product> productList=new ArrayList<Product>();
	
	System.out.println("run");
	for(Shoptype shoptype:shoptypeService.query()){	
		for(Shop shop:shopService.queryByType(shoptype.getId(), 2, 8)){
		    Product product=productService.getbysid(shop.getId());
			Discount discount=discountService.getDiscount(shop.getId(),1);//默认就是规模为0~50人的中小企业
		     System.out.println("如果报错的话："+shop.getId());
			String pic=shopimageService.getImageListbyType("1", shop.getId()).get(0).getHref();	
		    //获取商家的评分信息和收藏人数
            System.out.println("pic:"+pic);
		    List<Score> scoreList=scoreService.getScorebySid(shop.getId());
		    Long scorecount=scoreService.getCountbyShop(shop);
		    int comemntscount=commentsService.getBysid(shop.getId()).size();
		    double aveScore=0;
		    for(Score score:scoreList){
		       aveScore+=score.getScorenumber();
		    }
		    if(scorecount!=0){
		    	aveScore=aveScore/scorecount;
		    }else{
		    	aveScore=0;
		    }
		    
		    product.setShopid(shop.getId());
		    System.out.println("shopid："+shop.getId());
			product.setShopname(shop.getName());
			System.out.println(shop.getName());
			product.setMiaoshu(shop.getMiaoshu());
			System.out.println(shop.getMiaoshu());
			product.setPrice(discount.getPersonprice());
			System.out.println(discount.getPersonprice());
		    product.setDiscount(discount.getDiscount());
		    System.out.println(discount.getDiscount());
		    product.setPic(pic);
		    System.out.println(pic);
		    product.setScore(aveScore);
		    System.out.println(aveScore);
		    product.setComment(comemntscount);
		    System.out.println(comemntscount);
		    product.setSold(Integer.parseInt(scorecount.toString()));
		    System.out.println(scorecount);
		    product.setShoptype(shoptype);
		    
		    product.setStpic(shoptype.getPic());
		    System.out.println("此时："+shop.getId());
		    product.setShop(shop);
		    System.out.println("此时："+shop.getId());
		    productService.update(product);
		    
		}
	
	
	}
	List<List<Product>> bigList=new ArrayList<List<Product>>();

	for(Shoptype shoptype:shoptypeService.query()){	
		if(!productService.qureyByTid(shoptype.getId()).isEmpty()){
			bigList.add(productService.qureyByTid(shoptype.getId()));
		}
		//将查出的产品集合放入biglist中
	}
	application.setAttribute("bigList", bigList);
	
	System.out.println("----------------华丽的分割线------2016，12,9");
	//取出名店抢购的几家商家	
	List<Product> HotProductList=new ArrayList<Product>();
   for(Shop shop:shopService.queryHot(2, 4)){
	   Product product=new Product();
	   product=productService.getbysid(shop.getId());
	   HotProductList.add(product); 
   }
   application.setAttribute("HotProductList", HotProductList);
   System.out.println("下面是求每个店的相关系数");
   int storeNumber=0;
   double scoreNumber=0.0;
   int collectionNumber=0;
   int  commentsNumber=0;
   int saleNumber=0;
   int comsumption=0;
   int score_sum=0;
   for(Shoptype shoptype:shoptypeService.query()){
	   storeNumber=0;
	    scoreNumber=0.0;
	    collectionNumber=0;
	     commentsNumber=0;
	    saleNumber=0;
	   comsumption=0;
	   score_sum=0;
	   for(Shop shop:shopService.queryByType(shoptype.getId())){
		   storeNumber+=shop.getStoreSet().size();
		   for(Score score:shop.getScoreSet()){
			   scoreNumber+=score.getScorenumber();
			   score_sum++;
		   }
		   collectionNumber+=collectionService.getbySid(shop.getId()).size();
		   commentsNumber+=commentsService.getBysid(shop.getId()).size();
		   saleNumber+=orderService.getBySid(shop.getId(), 3).size();
		   comsumption=scoreService.getScorebySid(shop.getId()).size();  
		   
	   }
	   
	   
	if(averageService.queryByTid(shoptype.getId())!=null){
	Average average=averageService.queryByTid(shoptype.getId());
	
	  if(shopService.queryByType(shoptype.getId()).size()==0){
		   average.setComment(0.0);
		   average.setCollection(0.0);
		   average.setComsumption(0.0);
		   average.setSale(0.0);
		   average.setScore(0.0);
		   average.setStore(0.0); 
		   
		   
		   
	   }else{
		   average.setComment((double)commentsNumber/shopService.queryByType(shoptype.getId()).size());
		   average.setCollection((double)collectionNumber/shopService.queryByType(shoptype.getId()).size());
		   average.setComsumption((double)comsumption/shopService.queryByType(shoptype.getId()).size());
		   average.setSale((double)saleNumber/shopService.queryByType(shoptype.getId()).size());
		 
		   if(score_sum==0){
			   average.setScore(0.0);
		   }else{
			   average.setScore((double)scoreNumber/score_sum);  
		   }
		 
		   average.setStore((double)storeNumber/shopService.queryByType(shoptype.getId()).size());
	   }
	   averageService.update(average);
	   
	}else{
		Average average=new Average();
		   average.setTid(shoptype.getId());
		   
		   
		   if(shopService.queryByType(shoptype.getId()).size()==0){
			   average.setComment(0.0);
			   average.setCollection(0.0);
			   average.setComsumption(0.0);
			   average.setSale(0.0);
			   average.setScore(0.0);
			   average.setStore(0.0); 
		   }else{
			   average.setComment((double)commentsNumber/shopService.queryByType(shoptype.getId()).size());
			   average.setCollection((double)collectionNumber/shopService.queryByType(shoptype.getId()).size());
			   average.setComsumption((double)comsumption/shopService.queryByType(shoptype.getId()).size());
			   average.setSale((double)saleNumber/shopService.queryByType(shoptype.getId()).size());
			   
			   if(score_sum==0){
				   average.setScore(0.0);
			   }else{
				   average.setScore((double)scoreNumber/score_sum);  
			   }
			   average.setStore((double)storeNumber/shopService.queryByType(shoptype.getId()).size());
		   }
		   
		   averageService.save(average);
	}
	   
   }
  double coefficient=0.0;
   double average_score=0.0;
   for(Shoptype shoptype:shoptypeService.query()){
	   for(Shop shop:shopService.queryByType(shoptype.getId())){
    		 Average average= averageService.queryByTid(shop.getShoptype().getId());
		   if(average.getStore()!=0){
			   coefficient=shop.getStoreSet().size()/average.getStore()*0.25; 
		   }else{
			   coefficient=0;   
		   }
		   if(average.getCollection()!=0){
			   coefficient+=collectionService.getbySid(shop.getId()).size()/average.getCollection()*0.1;   
		   }else{
			   coefficient+=0;   
		   }
		   if(average.getComsumption()!=0){
			   coefficient+=scoreService.getScorebySid(shop.getId()).size()/average.getComsumption()*0.2;
		   }else{
			   
			   coefficient+=0;      
		   }
		   if(average.getComment()!=0){
			   coefficient+=commentsService.getBysid(shop.getId()).size()/average.getComment()*0.1;
		   }else{
			   
			   coefficient+=0;      
		   }  
		   if(average.getScore()!=0){
			   for(Score score:shop.getScoreSet()){
				average_score+=score.getScorenumber();
			   }
			   if(shop.getScoreSet().size()>0){
				   average_score=average_score/shop.getScoreSet().size();  
			   }
		
			   coefficient+=average_score/average.getScore()*0.2;
			   
		   }else{
			   
			   coefficient+=0;      
		   }  
		   if(average.getSale()!=0){
			   coefficient+=orderService.getBySid(shop.getId(), 3).size()/average.getSale()*0.15;
		   }else{
			   coefficient+=0;  
		   }
		   
		   
    		
    		 
    		 shop.setCoefficient(coefficient);
    		 shopService.update(shop);
    		 
		   
	   }
   }
   
   
   System.out.println("-------------------------华丽的分割线--------------");
   //求每一个月商家与企业的相关系数
   Timestamp now = new Timestamp(System.currentTimeMillis());
	  Timestamp lastMonth=TimeUtil.getTime(now, -1);
   for(Company company:companyService.query()){
	   for(Shop shop:shopService.query()){
		   
		   double average=0.0;//平均法
		   int i=0;//消费次数也是打分次数
		   int j=0;//评论数
		   BigDecimal a=new BigDecimal(1);		  
		   for(Employee employee:company.getEmployeeSet()){
		      for(Score score:scoreService.getScoreByEid(employee.getId(),shop.getId(),now,lastMonth)){
		    	 average+=score.getScorenumber();
		    	 i++;
		      }
		      for(Comments comments:commentsService.get(employee.getId(), shop.getId(), now, lastMonth,a)){
		    	  
		    	  j++;
		    	  
		      }
		      
		      
		      
		   }
		  if(i>0){
			  average=average/i;
			  
		  }else{
			  average=0;
		  }
		
		  if(relatedService.get(shop.getId(),company.getId())!=null){
			Related related=relatedService.get(shop.getId(),company.getId());
			related.setDegree(average*j);
			relatedService.update(related);
		  }else{
			  Related related=new Related();
			  related.setCid(company.getId());
			  related.setSid(shop.getId());
			  related.setDegree(average*j);
			  relatedService.save(related);
		  }
		   
		   
	   }
	   
   }
   
   List<List<Product>> bigList2=new ArrayList<List<Product>>();
	for(Shoptype shoptype:shoptypeService.query()){	
		if(!productService.qureyByTid(shoptype.getId()).isEmpty()){
			bigList2.add(productService.queryByTid(shoptype.getId(), 2));
			
	     }
				
	}
	application.setAttribute("bigList2", bigList2);	
	}

	
    
  	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
