package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.sql.Timestamp;
import java.util.HashSet;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Company;
import cn.foritou.model.Forder;
import cn.foritou.model.Shop;
import cn.foritou.model.Sorder;
import cn.foritou.model.Status;
@Controller
@Scope("prototype")
public class SorderAction extends BaseAction<Sorder>{
	public String addSorder(){
    System.out.println("image"+model.getShopimage());
    System.out.println("shopname:"+model.getShopname());
    System.out.println("personNumber:"+model.getPersonnumber());
    System.out.println("price:"+model.getPersonprice());
    System.out.println("discount:"+model.getDiscount());
	
    
    //1.获取当前商家
    
		Shop shop=(Shop) session.get("shopLook");
		model.setShop(shop);
		//2.判断当前session是否有购物车，如果没有则创建
		if(session.get("forder")==null){
			//创建新的购物车存储到session中
			session.put("forder", new Forder(new HashSet<Sorder>()));
		}   
		//3.把商品信息转换为sorder,并且添加到购物车中(判断商品购物项是否成立)
	  
	   Forder forder=(Forder) session.get("forder");//获取购物车
	  
	   forder=sorderService.addSorder(forder, model);//添加后的购物车
	 
		//4.计算购物的总价格
	  forder.setTotal(forderService.cluTotal(forder));
	  //5:把新的购物车存储到session中
	  session.put("forder", forder);
	  return "showCar";
	}
	
	//根据商品编号根性商品的数量
	public String updateSorder(){
		System.out.println(model.getShop());
	    System.out.println(model.getPersonnumber());
		Forder forder=(Forder) session.get("forder");//session中获取购物车
		forder=sorderService.updateSorder(forder, model);
		forder.setTotal(forderService.cluTotal(forder));//重新计算总价格
		session.put("forder", forder);
		inputStream=new ByteArrayInputStream(forder.getTotal().toString().getBytes());//返回流格式
		
		return "stream";
		
	}
	/*public String  delete(){
		sorderService.delete(model.getShop().getId());
		Forder forder=(Forder) session.get("forder");//session中获取购物车
		session.put("forder", forder);
		return  "delete";
	}*/
	
}
