package cn.foritou.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class LogonUtils {


	public static void remeberMeByCookie(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		//获取页面中的登录名和密码
		String name = request.getParameter("phone");
		String password = request.getParameter("password");
		//创建2个Cookie，分别用来存放登录名和密码
		//处理Cookie中存在的中文字符
		String codeName = URLEncoder.encode(name, "UTF-8");
		Cookie nameCookie = new Cookie("phone",codeName);
		Cookie passwordCookie = new Cookie("password",password);
		//设置Cookie的有效路径，有效路径定义为项目的根路径
		//System.out.println("path="+request.getContextPath());
		nameCookie.setPath(request.getContextPath()+"/");
		passwordCookie.setPath(request.getContextPath()+"/");
		/**
		 * 从页面中获取记住我的复选框的值，
		 *    * 如果有值，设置Cookie的有效时长
		 *    * 如果没有值，清空Cookie的有效时长
		 * <input type="checkbox" name="remeberMe" id="remeberMe" value="yes">
		 */
		String remeberMe = request.getParameter("remberme");
		//设置Cookie的有效时长
		if(remeberMe!=null && remeberMe.equals("yes")){
			nameCookie.setMaxAge(7*24*60*60);
			passwordCookie.setMaxAge(7*24*60*60);
		}
		//清空Cookie的有效时长
		else{
			nameCookie.setMaxAge(0);
			passwordCookie.setMaxAge(0);
		}
		//将2个Cookie的对象存放到response对象
		response.addCookie(nameCookie);
		response.addCookie(passwordCookie);
	}
	public static void remeberMeByCookie2(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		//获取页面中的登录名和密码
		String name = request.getParameter("phone");
		System.out.println(name);
		String password = request.getParameter("password");
		//创建2个Cookie，分别用来存放登录名和密码
		//处理Cookie中存在的中文字符
		String codeName="";
		if(name!=null&&!"".equals(name)){
		 codeName = URLEncoder.encode(name, "UTF-8");
		}else{
	     codeName = URLEncoder.encode("", "UTF-8");
		}
		Cookie nameCookie = new Cookie("username",codeName);
		Cookie passwordCookie = new Cookie("password2",password);
		//设置Cookie的有效路径，有效路径定义为项目的根路径
		//System.out.println("path="+request.getContextPath());
		nameCookie.setPath(request.getContextPath()+"/");
		passwordCookie.setPath(request.getContextPath()+"/");
		/**
		 * 从页面中获取记住我的复选框的值，
		 *    * 如果有值，设置Cookie的有效时长
		 *    * 如果没有值，清空Cookie的有效时长
		 * <input type="checkbox" name="remeberMe" id="remeberMe" value="yes">
		 */
		String remeberMe = request.getParameter("remberme");
		//设置Cookie的有效时长
		if(remeberMe!=null && remeberMe.equals("yes")){
			nameCookie.setMaxAge(7*24*60*60);
			passwordCookie.setMaxAge(7*24*60*60);
		}
		//清空Cookie的有效时长
		else{
			nameCookie.setMaxAge(0);
			passwordCookie.setMaxAge(0);
		}
		//将2个Cookie的对象存放到response对象
		response.addCookie(nameCookie);
		response.addCookie(passwordCookie);
	}


}
