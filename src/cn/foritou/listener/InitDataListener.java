package cn.foritou.listener;


import java.util.Timer;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.foritou.service.ShoptypeService;
import cn.foritou.util.FileUpload;
import cn.foritou.util.ProductTimerTask;

/*
 *用于项目启动的时候数据初始化
 *
 *
 */
@Service
public class InitDataListener implements ServletContextListener {
	
  // private ProductService productService=null;
   private ApplicationContext context=null;
   
   private ShoptypeService shoptypeService=null;
   private ProductTimerTask productTimerTask=null;
   private FileUpload fileUpload=null;
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		// TODO Auto-generated method stub
		//1.获取业务逻辑类查询商品信息
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
//1.项目在启动的时候把Spring 配置文件通过监听器加载，存储了servletcontext中我们只需要获取即可
		//解决方案1:直接到servletcontext获取spring配置文件
		//此方案的key不容易记住
/*ApplicationContext context= (ApplicationContext) event.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
productService=(ProductService) context.getBean("productService");
System.out.println("productService:"+productService);*/
//解决方案2：通过工具类加载即可
 context=WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
 productTimerTask=(ProductTimerTask)context.getBean("productTimerTask");
 fileUpload=(FileUpload)context.getBean("fileUpload");
 shoptypeService=(ShoptypeService)context.getBean("shoptypeService");
 //把内置对象交给productTimerTask
 productTimerTask.setApplication(event.getServletContext());
 //通过设置定时器，让首页的数据每隔一小时同步一次(要配置为守护线程)
 
 new Timer(true).schedule(productTimerTask, 0, 1000*60*60);
 //项目启动时要加载银行图表,并且放到application中
 System.out.println("getBankImage：---------------" +
 		"-----------------------"+fileUpload.getBankImage());
 System.out.println("getshoptype:-----------------------------------" +
 		"--------------------"+shoptypeService.query());
 event.getServletContext().setAttribute("bankList", fileUpload.getBankImage());
 event.getServletContext().setAttribute("stlist", shoptypeService.query());
 
System.out.println("-------------------------------------------------------");
	}

}
