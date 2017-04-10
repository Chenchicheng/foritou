package cn.foritou.util;

public class NumberUtil {
public static int getSixNumber(){//六位随机生成器
	int randNum = 1 + (int)(Math.random() * ((999999 - 1) + 1));
	return randNum;
}
public static void main(String[] args) {
	System.out.println(NumberUtil.getSixNumber());
}
}
