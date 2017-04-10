package cn.foritou.action;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Company;
import cn.foritou.model.Employee;

@Controller
@Scope("prototype")
public class EmployeeAction extends BaseAction<Employee>{
	public String getInfo(){
		pageMap=new HashMap<String, Object>();
	     model=employeeService.getByWX(model.getWeixin());
		if(model==null){
			pageMap.put("employee", "false");
		}else{
			pageMap.put("employee", model);
		}
		
		return "jsonMap";
		
	}
	
	
public String addEmployee(){
	pageMap=new HashMap<String, Object>();
	Company company=new Company();
	try {
		System.out.println("转码后："+new String(model.getCompany().getCompanyname().getBytes("ISO-8859-1"),"utf-8"));
		//转码公司名字
		String companyString=new String(model.getCompany().getCompanyname().getBytes("ISO-8859-1"),"utf-8");
	     //获取公司
		 company=companyService.getbyName(companyString);
		model.setCompany(company);
		System.out.println("cid"+model.getCompany().getId());
		
		model.setCity(new String(model.getCity().getBytes("ISO-8859-1"),"utf-8").trim());
	    model.setProvince(new String(model.getProvince().getBytes("ISO-8859-1"),"utf-8").trim());
	    model.setNickname(new String(model.getNickname().getBytes("ISO-8859-1"),"utf-8").trim());
	    
	
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("headapper:"+model.getHeadappear());
	System.out.println("province:"+model.getProvince());
	System.out.println("city:"+model.getCity());
	System.out.println("interpassword:"+model.getInterpassword());
	System.out.println("nickname:"+model.getNickname());
	System.out.println("cid:"+model.getCompany().getId());
    System.out.println( "size:"+ model.getCompany().getEmployeeSet().size());
	System.out.println("enumber:"+company.getEnumber());

	
	
	
	
	if(model.getCompany().getEmployeeSet().size()<company.getEnumber()){
		
		model.getCompany().getEmployeeSet().add(model);
		employeeService.save(model);
		pageMap.put("success", "true");
	}else{
		
		
		System.out.println("人数已满！请咨询公司人事部门！");
		pageMap.put("success", "false");
	}
	
	
	return "jsonMap";
}

//2016/12/11
public String  delete(){
	employeeService.delete(model.getId());
  Company company=(Company) session.get("company");
	session.put("company", companyService.get(company.getId()));
	
	return  "delete";
}




	
}
