package cn.foritou.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.foritou.model.Company;
import cn.foritou.model.Wxshop;
import cn.foritou.service.CompanyService;
import cn.foritou.service.WxshopService;

//模块自身的业务逻辑
@Service("wxshopService")
public class WxshopServiceImpl extends BaseServiceImpl<Wxshop>  implements WxshopService{

	@Override
	public Wxshop querybySid(int sid, int cid) {
		// TODO Auto-generated method stub
		String hql="from Wxshop where shop.id=:sid and company.id=:cid";
		 return  (Wxshop)getSession().createQuery(hql)
				  .setInteger("sid",sid)
				  .setInteger("cid", cid)
				   .uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Wxshop> query(int cid, Timestamp now, int start, int pageSize,int stateid) {
		// TODO Auto-generated method stub
		String hql="from Wxshop where stateid=:stateid and company.id=:cid and :now between date and validdate";
		 return  getSession().createQuery(hql)
				  .setInteger("cid", cid)
				  .setInteger("stateid", stateid)
				  .setTimestamp("now", now)
				  .setFirstResult(start)
				  .setMaxResults(pageSize)
				   .list();
	}

	@Override
	public long getWxCount(int cid, Timestamp now, int stateid) {
		// TODO Auto-generated method stub
		String hql="select count(*) from Wxshop where stateid=:stateid and company.id=:cid and :now between date and validdate";
		 return   (Long) getSession().createQuery(hql)
				  .setInteger("cid", cid)
				  .setInteger("stateid", stateid)
				  .setTimestamp("now", now)
                  .uniqueResult();
				   
	}


}
