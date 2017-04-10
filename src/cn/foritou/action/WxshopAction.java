package cn.foritou.action;


import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Wxshop;
@Controller
@Scope("prototype")

public class WxshopAction extends BaseAction<Wxshop> {
	
	public String getWxshop(){
/*		HttpServletRequest req = ServletActionContext.getRequest();
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
/*	    int cid=Integer.parseInt(req.getParameter("cid").trim());
	    
	    int start=(Integer) req.getParameter("start");
	    int pageSize=(Integer) request.get("pageSize");*/
		int cid=model.getCompany().getId();
		System.out.println("cid:"+cid);
	    Timestamp now = new Timestamp(System.currentTimeMillis());
	    System.out.println("cid:"+cid+"-----start:"+start+"pageSize:"+pageSize);
		pageMap=new HashMap<String, Object>();
         long count=wxshopService.getWxCount(cid, now, 1);
		List<Wxshop> wxShopList=wxshopService.query(cid, now, start, pageSize, 1);
		pageMap.put("count", count);
		pageMap.put("wxShopList", wxShopList);
        return "jsonMap";
	}
	
		
	

}
