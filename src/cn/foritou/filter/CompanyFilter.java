package cn.foritou.filter;



import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class CompanyFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//判断当前session是否有企业信息
	HttpServletRequest req=(HttpServletRequest)request;
	HttpServletResponse res=(HttpServletResponse)response;
	if(req.getSession().getAttribute("company")==null){
		//保存当前客户想要的url地址
	//System.out.println(req.getServletPath());//请求地址，没有工程名
	//System.out.println(req.getContextPath());//工程名
	//System.out.println(req.getQueryString());//当前请求的参数
    String goURL=req.getServletPath();
    String param=req.getQueryString();
    if(param!=null){
    	goURL=goURL+"?"+param;
    }
    //把当前客户想要访问的地址，存储到session中
    System.out.println("goURL"+goURL+"-----------------");
    req.getSession().setAttribute("goURL", goURL);
    
		req.getSession().setAttribute("nopower","非法请求,请登录！");
		res.sendRedirect(req.getContextPath()+"/company/login.jsp");//重定向到登录页面
	}else{
		//如果有下一个过滤器，则跳转，否则直接到目标页面
		chain.doFilter(request, response);
	}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
