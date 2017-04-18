package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.foritou.model.Collection;
import cn.foritou.model.Comments;
import cn.foritou.model.Company;
import cn.foritou.model.Discount;
import cn.foritou.model.Shop;
import cn.foritou.util.DigestUtil;
import cn.foritou.util.NumberUtil;
@Controller
@Scope("prototype")
public class CommentsAction extends BaseAction<Comments>  {
	private int eid;
	private int sid;
	public String setComments(){
		model.setShop(shopService.get(sid));
		model.setEmployee(employeeService.get(eid));
	    model.setDate(new Timestamp(System.currentTimeMillis()));
	    model.setState(model.getState());
	    commentsService.save(model);
	    return "success";
	}

	
	public String query() throws Exception{
		System.out.println("进入");
		Shop shop=(Shop) session.get("shop");
		jsonList = commentsService.getBysid(shop.getId());
		return "jsonlist";
		/*List<Comments> list = commentsService.getBysidWithPage(shop.getId(),page,rows);
		this.toBeJson(list, commentsService.getCommentsTotal(shop.getId()));
		return null;*/
	}
	public JSONObject toBeJson(List<Comments> list,int total) throws Exception{  
        HttpServletResponse response = ServletActionContext.getResponse();  
        HttpServletRequest request = ServletActionContext.getRequest();  
        JSONArray jsonArr = new JSONArray();
        JsonConfig config = new JsonConfig();//json配置  
        PropertyFilter proFilter = new PropertyFilter() {//过滤属性  
            public boolean apply(Object arg0, String name, Object arg2) {  
                if ("shop".equals(name)) {  
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


	public void reply(){
		  
		System.out.println("model:"+model.getReply());
		commentsService.update(model);
}
	public String updateByIds(){
		System.out.println(ids);
		System.out.println("删除回复------------");
	  String[] i=ids.split(",");
	  for(String j:i){
		  int index=Integer.valueOf(j);
		  Comments comments=commentsService.get(index);
		  comments.setReply(null);
		  commentsService.update(comments);
	  }
	  
	  
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
		
	}

	
	
	
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	

    public String queryGood(){
    	 List<Object> jsonList = commentsService.findGoodComments();
	 	    ActionContext.getContext().getValueStack().push(jsonList);
	 		return "jsonList";
    }
    public String queryGeneral(){
   	 List<Object> jsonList = commentsService.findGeneralComments();
	    ActionContext.getContext().getValueStack().push(jsonList);
		return "jsonList";
   }
	
    public String queryBad(){
   	 List<Object> jsonList = commentsService.findBadComments();
	    ActionContext.getContext().getValueStack().push(jsonList);
		return "jsonList";
   }
	
	
	
	

}
