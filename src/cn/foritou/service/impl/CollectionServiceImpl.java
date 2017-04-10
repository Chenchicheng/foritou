package cn.foritou.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.foritou.model.Collection;
import cn.foritou.service.CollectionService;

@Service("collectionService")
@SuppressWarnings("unchecked")
public class CollectionServiceImpl extends BaseServiceImpl<Collection>  implements CollectionService {

	@Override
	public void delete(int cid,int sid) {
		// TODO Auto-generated method stub
		String hql="delete from Collect where company.id=:cid and shop.id=:sid";
		getSession().createQuery(hql)
		.setInteger("cid",cid)
		.setInteger("sid", sid)
		.executeUpdate()
		;
	}

	@Override
	public Collection check(int cid, int sid) {
		// TODO Auto-generated method stub
		String hql="from Collection where company.id=:cid and shop.id=:sid";
	 return 	(Collection) getSession().createQuery(hql)
		.setInteger("cid", cid)
		.setInteger("sid", sid)
		.uniqueResult();
	}


	@Override
	public List<Collection> getbySid(int sid) {
		// TODO Auto-generated method stub
		String hql="from Collection where shop.id=:sid";
		 return getSession().createQuery(hql)
	
			.setInteger("sid", sid)
			.list();
}
	
	
}	
	
	