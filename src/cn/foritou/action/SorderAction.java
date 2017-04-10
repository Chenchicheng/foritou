package cn.foritou.action;

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

		//1.获取当前商家
		Shop shop=(Shop) session.get("shopLook");
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
}
