package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.sql.Timestamp;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Store;

@Controller
@Scope("prototype")
public class ScoreAction extends BaseAction<Score>{
	private int eid;
	private int sid;
public String setScore(){
	
	model.setShop(shopService.get(sid));
	model.setEmployee(employeeService.get(eid));
    model.setDate(new Timestamp(System.currentTimeMillis()));
	scoreService.save(model);
	session.put("identyShop", shopService.get(sid));
	session.put("identyEmployee",employeeService.get(eid));
	session.put("discount", wxshopService.querybySid(sid, employeeService.get(eid).getCompany().getId()).getDiscount());
	return "success";
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
	
}
