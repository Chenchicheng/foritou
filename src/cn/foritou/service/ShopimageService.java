package cn.foritou.service;

import java.util.List;

import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Shoptype;

public interface ShopimageService extends BaseService<Shopimage>{
	//根据商家id获取到商家图片集
public List<Shopimage> getImageList(int sid);
//根据图片类型+商家id获取商家图片集
public List<Shopimage> getImageListbyType(String type,int sid);
//根据ids删除图片
public void deleteByids(String ids);
public List<Shopimage> getImageListWithPage(int sid,String page,String rows);
public List<Shopimage> getImageListby(int sid,String type,int page,int size);
int getImageTotal(int sid) throws Exception;
}
