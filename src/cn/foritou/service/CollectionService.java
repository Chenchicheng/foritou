package cn.foritou.service;

import java.util.List;

import cn.foritou.model.Collection;
import cn.foritou.model.Company;

public interface CollectionService extends BaseService<Collection>  {
	
	public  void delete(int cid,int  sid);
   public Collection check(int cid,int sid);
   public List<Collection> getbySid(int sid);
}
