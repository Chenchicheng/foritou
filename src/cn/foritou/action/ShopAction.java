package cn.foritou.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Product;
import cn.foritou.model.Score;
import cn.foritou.model.ScoreData;
import cn.foritou.model.Shop;
import cn.foritou.model.Usernotes;
import cn.foritou.service.ProductService;
@Controller
@Scope("prototype")
public class ShopAction extends BaseAction<Shop> {
public String login(){
	//获取到商家的用户须知信息放到session中	
	//进行登录的判断
   //用第二代加密算法对明码加密DigestUtil.hmacSign(model.getPassword(), "deepnets")
	model=shopService.login(model);
	System.out.println("stlist:"+application.get("stlist"));
	System.out.println("bankList:"+application.get("bankList"));
	if(model==null){
		session.put("error", "登录失败");
		return "slogin";
	}else{
		//登录成功，先存储到session，则根据情况返回相应的页面
		session.put("shop", model);
		session.put("usernotes",usernotesService.querybySid(model.getId()));
		//根据session中goURL是否有值而决定页面的跳转
		if(session.get("goURL")==null){
			return "index";
		}else{
			return "goURL";
		}
		
	}
}

public String enroll(){
		try {
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

public String get(){
	Shop shop=shopService.get(model.getId());
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
	aveScore=aveScore/scorecount;
	//收藏人数还没改
	session.put("scoreData", new ScoreData(aveScore,scorecount, scorecount));
	//获取分店
	session.put("storeList", storeService.getStore(shop.getId(), 1, 3));
	//获取够买须知
	session.put("usernotes", usernotesService.querybySid(shop.getId()));
	//获取本店所有的折扣信息，获取size
	session.put("discountList", discountService.queryJoinSize(shop.getId()));
	return "companyLook";	
}
public String getDetail(){
Shop shop=(Shop) session.get("shop");
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
return "detail";
}

public String update(){
	try {
		System.out.println("id"+model.getId());
		
		shopService.update(model);
		session.put("shop", shopService.querybyId(model.getId()));
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "shopinfo_update";
}


}
