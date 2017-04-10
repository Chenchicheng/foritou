package cn.foritou.util;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;

import cn.foritou.model.Discount;
import cn.foritou.model.Product;
import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.model.Shoptype;
import cn.foritou.service.DiscountService;
import cn.foritou.service.ProductService;
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
	  private ServletContext application=null;//内置对象
	public void setApplication(ServletContext application) {
		this.application = application;
	}

	@Override
	public void run() {
		System.out.println("---------------重新开始----------------");
	  //  List<Product> productList=new ArrayList<Product>();
	
	
	for(Shoptype shoptype:shoptypeService.query()){	
		for(Shop shop:shopService.queryByType(shoptype.getId(), 1, 8)){
		    Product product=productService.getbysid(shop.getId());
			Discount discount=discountService.getDiscount(shop.getId(),1);//默认就是规模为0~50人的中小企业
		    String pic=shopimageService.getImageListbyType("首页展示", shop.getId()).get(0).getHref();	
		    //获取商家的评分信息和收藏人数
		    List<Score> scoreList=scoreService.getScorebySid(shop.getId());
		    Long scorecount=scoreService.getCountbyShop(shop);
		    double aveScore=0;
		    for(Score score:scoreList){
		       aveScore+=score.getScorenumber();
		    }
	
		    aveScore=aveScore/scorecount;
		    product.setShopid(shop.getId());
			product.setShopname(shop.getName());
			product.setMiaoshu(shop.getMiaoshu());
			product.setPrice(discount.getPersonprice());
		    product.setDiscount(discount.getDiscount());
		    product.setPic(pic);
		    product.setScore(aveScore);
		    product.setComment(Integer.parseInt(scorecount.toString()));
		    product.setSold(Integer.parseInt(scorecount.toString()));
		    product.setShoptype(shoptype);
		    product.setStpic(shoptype.getPic());
		    product.setShop(shop);
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
		
		
	/*	以下东西不能乱改*/
	/*	System.out.println("---------------------------开始-------------------");
		List<List<Discount>> delicacyList=new ArrayList<List<Discount>>();
    	for(Shop shop:shopService.queryByType(1,1,8)){
    		delicacyList.add(discountService.queryJoinSize(shop.getId()));
    	}
    	application.setAttribute("delicacyList", delicacyList);
    	List<List<Discount>> hotelList=new ArrayList<List<Discount>>();
    	for(Shop shop:shopService.queryByType(2,1,8)){
    		hotelList.add(discountService.queryJoinSize(shop.getId()));
    	}
    	application.setAttribute("hotelList", hotelList);
     	List<List<Discount>> movieList=new ArrayList<List<Discount>>();
    	for(Shop shop:shopService.queryByType(3,1,8)){
    		movieList.add(discountService.queryJoinSize(shop.getId()));
    	}
    	application.setAttribute("movieList", movieList);
     	List<List<Discount>> disportList=new ArrayList<List<Discount>>();
    	for(Shop shop:shopService.queryByType(4,1,8)){
    		disportList.add(discountService.queryJoinSize(shop.getId()));
    	}
    	application.setAttribute("disportList", disportList);
     	List<List<Discount>> sportsList=new ArrayList<List<Discount>>();
    	for(Shop shop:shopService.queryByType(5,1,8)){
    		sportsList.add(discountService.queryJoinSize(shop.getId()));
    	}
    	application.setAttribute("sportsList", sportsList);
     	List<List<Discount>> tourList=new ArrayList<List<Discount>>();
    	for(Shop shop:shopService.queryByType(6,1,8)){
    		tourList.add(discountService.queryJoinSize(shop.getId()));
    	}
    	application.setAttribute("tourList", tourList);
    	List<List<Discount>> lifeList=new ArrayList<List<Discount>>();
    	for(Shop shop:shopService.queryByType(7,1,8)){
    		lifeList.add(discountService.queryJoinSize(shop.getId()));
    	}
    	application.setAttribute("lifeList", lifeList);
     	List<List<Discount>> shoppingList=new ArrayList<List<Discount>>();
    	for(Shop shop:shopService.queryByType(8,1,8)){
    		shoppingList.add(discountService.queryJoinSize(shop.getId()));
    	}
    	application.setAttribute("shoppingList", shoppingList);
     	List<List<Discount>> beautyList=new ArrayList<List<Discount>>();
    	for(Shop shop:shopService.queryByType(9,1,8)){
    		beautyList.add(discountService.queryJoinSize(shop.getId()));
    	}
    	application.setAttribute("beautyList", beautyList);
		System.out.println("------------------结束-------------------");*/
	}
	/*public static void main(String[] args) {
		new Timer(false).schedule(new TimerTask() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				System.out.println("-------------------run-------------------------");
			}
		}, 0,2000);
	}*/

}
