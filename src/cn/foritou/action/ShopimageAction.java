package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;

import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;

@Controller
@Scope("prototype")
public class ShopimageAction extends BaseAction<Shopimage>{

	
	
    private JSONObject jsonObj;
	public String query() throws Exception{
		Shop shop=(Shop) session.get("shop");
		List<Shopimage> list = shopimageService.getImageListWithPage(shop.getId(), page, rows);
		  this.toBeJson(list,shopimageService.getImageTotal(shop.getId())); 
		/*jsonList=shopimageService.getImageList(shop.getId());	*/	
		return null;
		  
	}
	public JSONObject toBeJson(List<Shopimage> list,int total) throws Exception{  
        HttpServletResponse response = ServletActionContext.getResponse();  
        HttpServletRequest request = ServletActionContext.getRequest();  
        JSONArray jsonArr = new JSONArray();
        JsonConfig config = new JsonConfig();//json配置  
        PropertyFilter proFilter = new PropertyFilter() {//过滤属性  
            public boolean apply(Object arg0, String name, Object arg2) {  
                if ("shop".equals(name) || "shop" == name) {  
                    return true;  
                }  
                return false;  
            }  
        };  
        
        config.setJsonPropertyFilter(proFilter);//设置过滤属性  
        jsonArr = JSONArray.fromObject(list, config);//生成json对象   
        
        JSONObject jobj = new JSONObject();//new一个JSON  
        jobj.accumulate("total",total );//total代表一共有多少数据  
        jobj.accumulate("rows", jsonArr);//row是代表显示的页的数据  

        response.setCharacterEncoding("utf-8");//指定为utf-8  
        
        response.getWriter().write(jobj.toString());//转化为JSOn格式  
        return jobj;
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
	public JSONObject getJsonObj() {
		return jsonObj;
	}
	public void setJsonObj(JSONObject jsonObj) {
		this.jsonObj = jsonObj;
	}
	
	
}
