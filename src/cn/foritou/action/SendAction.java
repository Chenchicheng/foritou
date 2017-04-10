package cn.foritou.action;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 	此action用来完成web-inf中jsp与jsp请求转发功能，此Action不做任何逻辑
 * 
 * */
@Controller
public class SendAction extends ActionSupport{
	public SendAction(){
		System.out.println("--------启动时完成实例化-------------");
	}
public String execute(){
	return "send";
}
}
