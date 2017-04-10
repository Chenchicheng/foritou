package cn.foritou.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.foritou.model.Company;
import cn.foritou.model.Product;
import cn.foritou.model.Related;
import cn.foritou.service.CompanyService;
import cn.foritou.service.RelatedService;

//模块自身的业务逻辑
@Service("relatedService")
@SuppressWarnings("unchecked")
public class RelatedServiceImpl extends BaseServiceImpl<Related>  implements RelatedService{

	@Override
	public Related get(int sid, int cid) {
		// TODO Auto-generated method stub
				String hql="FROM Related where sid=:sid and cid=:cid";
		        return   (Related) getSession().createQuery(hql)
				 .setInteger("sid", sid)
				 .setInteger("cid",cid)
				 .uniqueResult();
	}


	@Override
	public List<Related> getbycid(int cid) {
		// TODO Auto-generated method stub
		String hql="FROM Related where  cid=:cid";
        return    getSession().createQuery(hql)
		 .setInteger("cid",cid)
		 .list();
	}

}
