package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Store;

@Controller
@Scope("prototype")
public class StoreAction extends BaseAction<Store>{
	public String query(){
		Shop shop=(Shop) session.get("shop");
		jsonList=storeService.getStorebySid(shop.getId());
		System.out.println("地址："+jsonList.get(0).getAdress());
		System.out.println("联系方式："+jsonList.get(0).getPhone());
		return "jsonList";
	}
	public void save(){
		Shop shop =(Shop) session.get("shop");
        model.setShop(shop);
        storeService.save(model);
	}
	
	public String deleteByIds(){
	    storeService.deleteByids(ids);
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
		
	}
	public void update(){
  
			System.out.println("model:"+model);
			storeService.update(model);
	}
	public String getStore(){
		pageMap=new HashMap<String, Object>();
		model=storeService.getStore(model.getId());
		pageMap.put("store", model);
		return "jsonMap";
	}
	
}
