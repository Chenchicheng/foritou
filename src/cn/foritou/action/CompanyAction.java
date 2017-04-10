package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Collection;
import cn.foritou.model.Company;
import cn.foritou.model.Shop;
import cn.foritou.util.DigestUtil;
import cn.foritou.util.LogonUtils;
import cn.foritou.util.MD5;
import cn.foritou.util.NumberUtil;
@Controller
@Scope("prototype")
public class CompanyAction extends BaseAction<Company> {
private String cphone;//为了验证该手机号码是否注册用的手机变量
private int checkCode;//验证码

public String getCphone() {
	return cphone;
}
public void setCphone(String cphone) {
	this.cphone = cphone;
}
public void setCheckCode(int checkCode) {
	this.checkCode = checkCode;
}
public String login() throws UnsupportedEncodingException{
	//进行登录的判断
   
   //用第二代加密算法对明码加密
	System.out.println(model.getPassword());
    model.setPassword(DigestUtil.hmacSign(model.getPassword(), "deepnets"));
    System.out.println(model.getPassword());
	model=companyService.login(model);
	if(model==null){
	   request.put("loginError", "用户名或密码错误，请重新登录！");
		return "clogin";
	}else{
		//登录成功，先存储到session，则根据情况返回相应的页面
		session.put("company", model);
	
		if(session.get("shopLook")!=null){
			Collection collection=collectionService.check(model.getId(),((Shop)session.get("shopLook")).getId());
			if(collection!=null){
				session.put("collection",collection);
			}
			
		}
		
		//添加记住我的功能
				LogonUtils.remeberMeByCookie(request2, response2);
		//根据session中goURL是否有值而决定页面的跳转
		if(session.get("goURL")==null){
			
			return "index";
			
		}else{
			return "goURL";
		}
		
	}
}
public void getCheckCode(){//获取手机验证码
    cphone=(String) request.get("cphone");//获取手机号码
    System.out.println("手机号码:"+cphone);
	session.put("compnayPhone", cphone);
    int  checkNumber=NumberUtil.getSixNumber();//获取六位验证码
    session.put("checkCode",checkNumber);//假定验证码为111111
	messageUtil.SendMessage(cphone, checkNumber);//短信发送验证码
}
public String checkPhone(){//验证手机号码是否已经注册
	   System.out.println("cphone:"+cphone);
	   inputStream=new ByteArrayInputStream("true".getBytes());
	   for(Company company:companyService.query()){	
		 if(cphone.equals(company.getPhone())){
			 inputStream=new ByteArrayInputStream("false".getBytes());
		 }
	 }
	return "stream";
}


public String enroll1(){
	if(checkCode==(Integer)session.get("checkCode")){
		 return "enroll2";
	}else{
	    request.put("error", "验证码错误，请重新输入！");
		return  "enroll1";
		
	}
}
public String enroll(){
	
	 String interpassword=String.valueOf(NumberUtil.getSixNumber());
	 session.put("interpassword", interpassword);
	 model.setInterpassword(interpassword);
	 model.setPhone((String)session.get("compnayPhone"));
	 model.setPassword(DigestUtil.hmacSign(model.getPassword(), "deepnets"));
	 model.setEnrolltime(new Timestamp(System.currentTimeMillis()));
	 String typeid = request2.getParameter("type");
	 model.setCompanytype(companyTypeService.querybyID(Integer.parseInt(typeid)));
	 companyService.save(model);
	 return "enroll3";
}
public String employeeLogin(){
	System.out.println("model:"+model);
	System.out.println("interpassword："+model.getInterpassword());

try {
	model.setCompanyname(new String(model.getCompanyname().getBytes("ISO-8859-1"),"utf-8"));
} catch (UnsupportedEncodingException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	System.out.println("companyname:"+model.getCompanyname());
	pageMap=new HashMap<String, Object>();
	model.setInterpassword(model.getInterpassword());
	model=companyService.employeeLogin(model);	
	System.out.println("model"+model);

	if(model==null){
		System.out.println("false");
		pageMap.put("check", "false");
	}else{
		System.out.println("true");
		pageMap.put("check", "true");
		pageMap.put("company", model);
	}
	return "jsonMap";
}

//---------------2016/12/3

public String checkname(){
	try {
		System.out.println("companyname:" + model.getCompanyname());
		model = companyService.getbyName(model.getCompanyname());
		System.out.println("model:" + model);
		if (model != null) {
			inputStream = new ByteArrayInputStream("false".getBytes());
		} else {
			inputStream = new ByteArrayInputStream("true".getBytes());
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	return "stream";
	
	
}
   public String modify(){
	   System.out.println(model.getId());
	   model=companyService.querybyCid(model.getId());
	   System.out.println("修改前所在城市"+model.getCity());
	   session.put("company", model);
	   return "modify";
   }
   public String update(){
	   System.out.println("update.........");
	   System.out.print(model.getId());
	   String typeid = request2.getParameter("type");
	   model.setCompanytype(companyTypeService.querybyID(Integer.parseInt(typeid)));

	    
	    String password=model.getPassword();
		String md5password = "";
		if(password==null&&"".equals(password)){
			//初始密码000000
			password = "000000";
		}
		//修改时两次密码一致，不需要进行加密
		System.out.println(model.getMd5flag());
		if(model.getMd5flag()!=null&&model.getMd5flag().equals("1")){
		md5password = password;
		model.setPassword(md5password);
		}
		else{
			
			 md5password=DigestUtil.hmacSign(password, "deepnets");
		}
		model.setPassword(md5password);
	   companyService.update(model);
	   model=companyService.querybyCid(model.getId());
	   System.out.println("修改后所在城市"+model.getCity());
//	   session.put("company", model);
	   session.put("company", model);
	   request2.setAttribute("Flag", "12345");
	   return "update";
   }
   
   public String logout(){
	   request2.getSession().invalidate();
	   return "logout";
   }


}
