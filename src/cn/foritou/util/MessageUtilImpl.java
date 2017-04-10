package cn.foritou.util;



import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.stereotype.Component;

/**
 * 
 * @author Administrator
 *实现短信的发送功能
 */
@Component("messageUtil")
public class MessageUtilImpl implements MessageUtil {
	//参数：手机号+订单号
	/* (non-Javadoc)
	 * @see com.it.shop.util.MessageUtil#SendMessage(java.lang.String, java.lang.String)
	 */
	@Override
	public void SendMessage(String phone,int number){
		//1:打开浏览器s
		HttpClient client=new HttpClient();
		//2:创建请求的方式get/post
		PostMethod post=new PostMethod("http://utf8.sms.webchinese.cn/");
		//3:设置请求的参数信息
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");//在头文件中设置转码
		post.setParameter("Uid", "zhiyezhe");
		post.setParameter("key", "62b1f0933ba37bed75a2");
		post.setParameter("smsMob", phone);
		post.setParameter("smsText","您的验证码为："+number+"（10分钟内有效），为了保证您安全，请勿向任何人提供此验证码。感谢您使用福利淘服务！");
		 try {
		//4：提交请求
		int code=0;
	   
	     code=	client.executeMethod(post);
	     System.out.println("HTTP返回的状态码："+code);
		 String result=  post.getResponseBodyAsString();
		    System.out.println("短信发送结果为："+result);
		} catch (Exception e) {
		throw new RuntimeException(e);
		}finally{
			post.releaseConnection();
		}
	  
	   //获取服务气短返回的数据信息
	 

	}
	
	
	
/*public static void main(String[] args) throws HttpException, IOException {
	//1:打开浏览器s
	HttpClient client=new HttpClient();
	//2:创建请求的方式get/post
	PostMethod post=new PostMethod("http://utf8.sms.webchinese.cn/");
	//3:设置请求的参数信息
	post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");//在头文件中设置转码
	post.setParameter("Uid", "zhiyezhe");
	post.setParameter("key", "62b1f0933ba37bed75a2");
	post.setParameter("smsMob", "15779166452");
	post.setParameter("smsText", "订单*****已支付成功！");
	//4：提交请求
    int code=	client.executeMethod(post);
    System.out.println("HTTP返回的状态码："+code);
   //获取服务气短返回的数据信息
    String result=  post.getResponseBodyAsString();
    System.out.println(result);
}*/
}
