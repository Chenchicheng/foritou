package cn.foritou.action;

import java.io.ByteArrayInputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;

@Controller
@Scope("prototype")
public class ShopimageAction extends BaseAction<Shopimage>{
	public String query(){
		Shop shop=(Shop) session.get("shop");
		jsonList=shopimageService.getImageList(shop.getId());		
		return "jsonList";
	}
	public void save(){
		Shop shop =(Shop) session.get("shop");
		System.out.println("shop的id:"+shop.getId());
		String pic=fileUpload.uploadFile(fileImage);
		System.out.println("此时的PIC:"+pic);
		model.setHref(pic);
        System.out.println("此时的图片类型："+model.getType());
        model.setShop(shop);
        shopimageService.save(model);
	}
	
	public String deleteByIds(){
		System.out.println("删除id为："+ids);
		shopimageService.deleteByids(ids);
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
		
	}
	
}
