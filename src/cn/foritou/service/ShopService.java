package cn.foritou.service;

import java.util.List;
import java.util.Set;

import cn.foritou.model.Shop;
import cn.foritou.model.Shoptype;

public interface ShopService extends BaseService<Shop>{
	//商家登录
	public Shop login(Shop shop);
/*    //获取商家的类别
	public Shoptype getType(int id);*/
	//根据商家类别获取商家
	public List<Shop> queryByType(int tid);
	//根据商家类别+hot+最大查找量获取商家
	public List<Shop> queryByType(int tid,int hot, int number);
	//根据商家的商区获取商家
    public List<Shop> queryByQu(String shangqu,int start,int pageSize);
    //根据商家的商圈获取商家
    public  List<Shop> queryByQuan(String shangquan,int start,int pageSize );
    //根据关键字搜索商家
    public List<Shop> Search(String searchString,int start,int pageSize);
    //找出热门商家
    public List<Shop> queryHot(int hot,int number);


}
