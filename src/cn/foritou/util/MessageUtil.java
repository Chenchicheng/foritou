package cn.foritou.util;



public interface MessageUtil {

	//参数：手机号+验证码
	public abstract void SendMessage(String phone, int number);

}