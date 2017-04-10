package cn.foritou.service;

import java.util.List;

import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Shoptype;
import cn.foritou.model.Store;

public interface StoreService extends BaseService<Store>{
//根据sid获取门店信

	
public List<Store> getStorebySid(int sid);
//获 取平均分
	
public Long getCountbyShop(Shop shop);
//根据ids删除分店
public void deleteByids(String ids);

//根据商家sid和page还有size(返回最大数）获取分店
public List<Store> getStore(int sid,int page,int size);
//根据id获取当前分店
public Store getStore(int id);

}
