package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Collection;
import cn.foritou.model.Product;
import cn.foritou.model.Shoptype;
@Controller
@Scope("prototype")

public class ShoptypeAction extends BaseAction<Shoptype> {

	
	public String getShop(){
		List<Product> shopList=new ArrayList<Product>();
		shopList=ShoptypeService.getShop(model.getId(),8);
		session.put("shopbytypeList",shopList);
		return "success";
	}
}
