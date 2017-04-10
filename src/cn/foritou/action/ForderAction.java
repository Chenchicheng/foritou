package cn.foritou.action;

import java.sql.Timestamp;
import java.util.HashSet;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Company;
import cn.foritou.model.Forder;
import cn.foritou.model.Shop;
import cn.foritou.model.Sorder;
import cn.foritou.model.Status;
@Controller
@Scope("prototype")
public class ForderAction extends BaseAction<Forder>{
	//@Override//重写getModel方法，将session中的forder赋给model
	//此方法不安全
	public Forder getModel() {
			// TODO Auto-generated method stub
		model=(Forder)session.get("forder");
			return model;
		}

		//实现购物车（订单）与（购物项）级联入库功能
		public String save(){
			//把session中的购物项，交给当前的model对象
		/*Forder forder=	(Forder)session.get("forder");
		//	model.setSorderSet(forder.getSorderSet());
		forder.setAddress(model.getAddress());
		forder.setName(model.getName());
		forder.setPhone(model.getPhone());
		forder.setRemark(model.getRemark());
		//forder.setTotal(model.getTotal());
	    forder.setUser((User)session.get("user"));
	    forder.setStatus(new Status(1));
	    forder.setPost(model.getPost());//这样才是真正关联的forder；
	    forder.setDate(new Timestamp(System.currentTimeMillis()));
	    forderService.save(forder);
	    session.put("oldForder", session.get("forder"));//后期会用到的购物车
	*/		//级联入库(需要在xml中配置)，需要sorder关联forder,在sorderServiceImpl业务逻辑中，追加sorder.setForder(forder);
			model.setCompany((Company)session.get("company"));
			model.setStatus(new Status(1));
			model.setDate(new Timestamp(System.currentTimeMillis()));//获得当前时间入库
		    forderService.save(model);// 如果model不重新获取的话//这里入库的还不是session中的forder，还只是model，还没有关联

		//此时购物车已经入库，那么原来session中的购物车就应该清空
		    session.put("oldForder",session.remove("forder"));

		return "bank";
}
}