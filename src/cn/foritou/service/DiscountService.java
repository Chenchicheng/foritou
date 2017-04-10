package cn.foritou.service;

import java.util.List;

import cn.foritou.model.Discount;
import cn.foritou.model.Shop;
import cn.foritou.model.Size;

public interface DiscountService extends BaseService<Discount>{
	//根据当前店家和和规模返回一个折扣
	public Discount getDiscount(Shop shop,Size size);
	//根据当前商家的sid和规模返回折扣
	
	public Discount getDiscount(int sid,int csizeid);
	//根据当前商家返回discount的list
	public List<Discount> queryJoinSize(int sid);
	//根据ids删除折扣信息
	public  void deleteByids(String ids);

	public List<Discount> queryJoinSizeWithPage(Integer id, String page,
			String rows);

	public int getDiscountTotal(Integer id);
}
