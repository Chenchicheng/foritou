package cn.foritou.action;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import cn.foritou.model.Company;
import cn.foritou.util.DigestUtil;
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
public String login(){
	//进行登录的判断
   
   //用第二代加密算法对明码加密
    model.setPassword(DigestUtil.hmacSign(model.getPassword(), "deepnets"));

	model=companyService.login(model);
	if(model==null){
	   request.put("loginError", "用户名或密码错误，请重新登录！");
		return "clogin";
	}else{
		//登录成功，先存储到session，则根据情况返回相应的页面
		session.put("company", model);
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
 // int  checkNumber=NumberUtil.getSixNumber();//获取六位验证码
    session.put("checkCode",111111);//假定验证码为111111
//	messageUtil.SendMessage(cphone, checkNumber);//短信发送验证码
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
	 model.setPhone((String)session.get("compnayPhone"));
	 model.setPassword(DigestUtil.hmacSign(model.getPassword(), "deepnets"));
	 model.setEnrolltime(new Timestamp(System.currentTimeMillis()));
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
	model.setInterpassword(DigestUtil.hmacSign(model.getInterpassword(), "deepnets"));
	model=companyService.employeeLogin(model);	
	if(model==null){
		pageMap.put("check", "false");
	}else{
		pageMap.put("check", "true");
		pageMap.put("company", model);
	}
	return "jsonMap";
}


}
