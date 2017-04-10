package cn.foritou.util;



import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.stereotype.Component;

/**
 * 
 * @author Administrator
 *用来完成邮件的发送
 */
@Component("emailUtil")
public class EmailUtilImpl implements EmailUtil {
	/* (non-Javadoc)
	 * @see com.it.shop.util.MessageUtil#sendMessage(java.lang.String, java.lang.String)
	 */
	@Override
	public void sendEmail(String address,String id) {
		//登录邮件客户端（创建会话session）
	Properties prop =new Properties();	
    Session session=null;
    Transport transport=null;
	try {
		prop.setProperty("mail.transport.protocol", "smtp");//配置传输协议为smtp
		prop.setProperty("mail.smtp.auth","true");
		//创建session会话
		
		 session=Session.getDefaultInstance(prop);
		//创建一封邮件对象
		session.setDebug(true);
		Message message=new MimeMessage(session);
		//写信
		message.setSubject("订单支付成功邮件");
		//正文内容
		message.setContent("订单"+id+"已经支付成功!","text/html;charset=utf-8");
        //发件人地址
		message.setFrom(new InternetAddress("javatest666@163.com"));
        //设置收件人地址，和链接邮件服务器的认证信息
		transport=session.getTransport();
		transport.connect("smtp.163.com","javatest666@163.com","deepnets1995");//主机，用户名，密码
		//设置收件人地址,并且发送邮件
		transport.sendMessage(message, new Address[]{new InternetAddress(address)});
	}catch (Exception e) {
		throw new RuntimeException(e);
	}finally{
	    try {
			transport.close();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
	
		}	
	}
 
    
    
}
	
	/*public void main(String[] args) throws Exception{
		//登录邮件客户端（创建会话session）
		
		Properties prop =new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");//配置传输协议为smtp
	    prop.setProperty("mail.smtp.auth","true");
		//创建session会话
		
		Session session=Session.getDefaultInstance(prop);
	    //创建一封邮件对象
		session.setDebug(true);
		Message message=new MimeMessage(session);
		//写信
		message.setSubject("订单支付成功邮件");
		//正文内容
		message.setContent("订单12332已经支付成功","text/html;charset=utf-8");
	//发件人地址
		message.setFrom(new InternetAddress("javatest666@163.com"));
	//设置收件人地址，和链接邮件服务器的认证信息
		Transport transport=session.getTransport();
	    transport.connect("smtp.163.com","javatest666@163.com","deepnets1995");//主机，用户名，密码
		//设置收件人地址,并且发送邮件
	    transport.sendMessage(message, new Address[]{new InternetAddress("894291200@qq.com")});
	    transport.close();	
	}
*/
	
	
	
}