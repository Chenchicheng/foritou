package cn.foritou.interceptor;

import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class CompanyInterceptor implements Interceptor{

	   public void init() {  
	        System.out.println("ExpessionInterceptor ********* init()");  
	  
	    }  
	  
	    public String intercept(ActionInvocation invocation) throws Exception {  
	        System.out.println("ExpessionInterceptor ********* intercept()");  
	          
	        //动作类的对象  
	        System.out.println("invocation.getAction() : "+invocation.getAction());  
	          
	        //invocation.getAction()方法获取的是同一的对象  
	        System.out.println("invocation.getProxy().getAction() : "+invocation.getProxy().getAction());  
	          
	        //userAction_save，自定义配置文件中的action标签的name属性的值  
	        System.out.println("invocation.getProxy().getActionName() : "+invocation.getProxy().getActionName());  
	          
	        //save，对应动作类指定要执行的方法名  
	        System.out.println("invocation.getProxy().getMethod() : "+invocation.getProxy().getMethod());  
	          
	        //  /aop，自定义配置文件中的package标签的namespace属性的值  
	        System.out.println("invocation.getProxy().getNamespace() : "+invocation.getProxy().getNamespace());  
	          
	        //null  返回结果  
	        System.out.println("invocation.getResult() : "+invocation.getResult());  
	          
	        Map<String, Object> session = ServletActionContext.getContext().getSession();  
	    
	        Object obj = session.get("company");  
	          
	        if(obj==null||obj.equals("")){  
	            System.out.println("要去登录哦"); 
	            session.put("nopower", "非法操作，请先登录");
	        	  session.put("goURL","sorder_add.action" );
	           return "companyLogin";
	        }else{  
	        	System.out.println("已登录");
	        	  session.put("goURL","sorder_add.action" );
	        	  return "sorderLook";
	        }
	    }  
	      
	    public void destroy() {  
	        System.out.println("ExpessionInterceptor ********* destroy()");  
	  
	    }  
}
