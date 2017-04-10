package cn.foritou.service;

import java.util.List;

import cn.foritou.model.Shop;
import cn.foritou.model.Shoptype;

public interface ShopService extends BaseService<Shop>{
	//商家登录
	public Shop login(Shop shop);
/*    //获取商家的类别
	public Shoptype getType(int id);*/

	public Shop querybyId(int id);

	//根据商家类别获取商家
	public List<Shop> queryByType(int tid);
	//根据商家类别+hot+最大查找量获取商家
	public List<Shop> queryByType(int tid,int hot, int number);

}
