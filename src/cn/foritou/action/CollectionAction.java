package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.sql.Timestamp;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Collection;
import cn.foritou.model.Company;
import cn.foritou.model.Shop;
@Controller
@Scope("prototype")

public class CollectionAction extends BaseAction<Collection> {	
	public String save(){
		Shop shop=(Shop) session.get("shopLook");
		
		Company company=(Company) session.get("company");
		System.out.println("company:"+company);
	    if(company==null){
	    	session.put("goURL", "/company/detail.jsp");
	    	 inputStream=new ByteArrayInputStream("false".getBytes()); 
	    	return "login";
	    	
	    }else{
	    	 model.setCompany(company);
	         model.setShop(shop);
	         model.setPic(shopimageService.getImageListbyType("3", shop.getId()).get(0).getHref());
	         model.setCollectdate(new Timestamp(System.currentTimeMillis()));
	         collectionService.save(model);
	         Collection collection=(Collection)collectionService.check(company.getId(),shop.getId());
	         session.put("collection", collection);	
	       
	         inputStream=new ByteArrayInputStream("true".getBytes());  
	         session.put("company", companyService.get(company.getId()));
	         System.out.println("成功！");
	    }
        
	    return "stream";
	}
	public String delete(){
		System.out.println("----------------------删除--------------");
		Shop shop=(Shop) session.get("shopLook");
		Company company=(Company) session.get("company");
		Collection collection=(Collection)collectionService.check(company.getId(),shop.getId());
		collectionService.delete(collection.getId());   
		inputStream=new ByteArrayInputStream("true".getBytes());
		session.remove("collection");
		return "stream";
			
		}
	public String deletebyid(){
		System.out.println("----------------------取消收藏--------------");
		Company company=(Company) session.get("company");
		collectionService.delete(model.getId());   	
		session.put("company",companyService.get(company.getId()) );
		return "cancel";
			
		}
		
	

}
