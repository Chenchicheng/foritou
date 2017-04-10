
package cn.foritou.service.impl;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.foritou.model.Discount;
import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.model.Store;
import cn.foritou.service.ScoreService;
import cn.foritou.service.ShopService;
import cn.foritou.service.StoreService;

//模块自身的业务逻辑
@Service("storeService")
@SuppressWarnings("unchecked")
public class StoreServiceImpl extends BaseServiceImpl<Store>  implements StoreService{


	@Override
	public List<Store> getStorebySid(int sid) {
		String hql="FROM Store  where shop.id=:sid";
        return  getSession().createQuery(hql)
		 .setInteger("sid", sid)
		 .list();
	}

	@Override
	public Long getCountbyShop(Shop shop) {
		// TODO Auto-generated method stub
		String hql="select count(s) from Store s where s.shop=:shop";
		return (Long)getSession().createQuery(hql)
				.setEntity("shop", shop)
				.uniqueResult();
				
	}

	@Override
	public void deleteByids(String ids) {
		// TODO Auto-generated method stub
		String hql="delete from Store where id in ("+ids+")";
		getSession().createQuery(hql)
		.executeUpdate()
		;
	}

	@Override
	public List<Store> getStore(int sid, int page, int size) {
		// TODO Auto-generated method stub
		String hql="from Store where shop.id like:sid";
		
		List<Store> slist=getSession().createQuery(hql)
			       .setInteger("sid",sid)
			       .setFirstResult((page-1)*size)
			       .setMaxResults(size)
			       .list();
		return slist;
	}

	@Override
	public Store getStore(int id) {
		// TODO Auto-generated method stub
		String hql="from Store where id =:id";
		return (Store)getSession().createQuery(hql)
				.setInteger("id", id)
				.uniqueResult();
	}
}