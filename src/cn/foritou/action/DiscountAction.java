package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.util.HashMap;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import cn.foritou.model.Discount;
import cn.foritou.model.Shop;
import cn.foritou.model.Size;
@Controller
@Scope("prototype")
public class DiscountAction extends BaseAction<Discount>{
	public String query(){
		Shop shop=(Shop) session.get("shop");
		jsonList=discountService.queryJoinSize(shop.getId());
		return "jsonList";
	}
	public void save(){
		Shop shop =(Shop) session.get("shop");
       model.setShop(shop);
      discountService.save(model);
	}
	
	public String deleteByIds(){
	    discountService.deleteByids(ids);
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
		
	}
	public void update(){

			System.out.println("model:"+model);
			discountService.update(model);
			
	}
	public String getDiscount(){
		Shop shop=new Shop();
		if(session.get("shop")!=null){
			 shop=(Shop)session.get("shop");
		}else if(session.get("shopLook")!=null){
			 shop=(Shop) session.get("shopLook");
		}
		pageMap=new HashMap<String, Object>();
     	model=discountService.getDiscount(shop.getId(), model.getSize().getId());
        pageMap.put("discount",model );
        return "jsonMap";
		
	}
	
	
}
