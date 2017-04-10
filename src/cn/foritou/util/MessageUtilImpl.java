package cn.foritou.util;



import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.stereotype.Component;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

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
		/*//1:打开浏览器s
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
		}*/
	  
	   //获取服务气短返回的数据信息
		  /*number = (int) (Math.random()*10000);
		  String num =String.valueOf(number);*/
			/*HttpSession session =request.getSession();
			session.setAttribute("num", num);
			session.setMaxInactiveInterval(60);*/
			/*System.out.println(num);*/
			
			/*String to = new String(request.getParameter("to").getBytes("ISO8859-1"),"UTF-8");*/
			String url="https://eco.taobao.com/router/rest";
			System.out.println(phone);
			String appkey="23557210";
			String secret="f169fe612bc144a123f8a63011f1d28c";
			
			
			TaobaoClient client1 = new DefaultTaobaoClient(url, appkey, secret);
			AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
			req.setSmsType("normal");
			req.setSmsFreeSignName("福利淘");
			req.setSmsParamString("{\"code\":'"+number+"'}");
			req.setRecNum(phone);
			req.setSmsTemplateCode("SMS_33225369");
			AlibabaAliqinFcSmsNumSendResponse rsp = null;
			try {
				rsp = client1.execute(req);
			} catch (ApiException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(rsp.getBody());

		}

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

