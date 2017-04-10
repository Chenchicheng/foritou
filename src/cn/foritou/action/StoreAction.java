package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Store;

@Controller
@Scope("prototype")
public class StoreAction extends BaseAction<Store>{
	public String query() throws Exception{
		Shop shop=(Shop) session.get("shop");
		List<Store> list = storeService.getStorebySidWithPage(shop.getId(),page,rows);
		this.toBeJson(list,storeService.getImageTotal(shop.getId())); 
		return null;
	}
	
	public JSONObject toBeJson(List<Store> list,int total) throws Exception{  
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
