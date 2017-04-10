package cn.foritou.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Company;
import cn.foritou.model.Forder;
import cn.foritou.model.Order;
import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.model.Sorder;
import cn.foritou.model.State;
import cn.foritou.model.Status;
import cn.foritou.model.Wxshop;
import cn.foritou.util.TimeUtil;
@Controller
@Scope("prototype")
public class OrderAction extends BaseAction<Order>{

		public String getMyOrder(){
			int cid=0;
			if(session.get("company")!=null){
				 cid=((Company)session.get("company")).getId();
				
			}else{
				cid=0;
			}
			List<Order> myOrderList=new ArrayList<Order>();
			myOrderList=orderService.queryOrderbyCid(cid);
			session.put("myOrderList",myOrderList);
			return "success";
		}
	
		
}