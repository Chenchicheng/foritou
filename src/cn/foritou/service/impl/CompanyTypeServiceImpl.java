package cn.foritou.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.stereotype.Service;

import cn.foritou.model.Company;
import cn.foritou.model.Companytype;
import cn.foritou.service.CompanyService;
import cn.foritou.service.CompanyTypeService;

//模块自身的业务逻辑
@Service("companyTypeService")
public class CompanyTypeServiceImpl extends BaseServiceImpl<Companytype>  implements CompanyTypeService{
	@Override
	public Companytype querybyType(String name) {
		// TODO Auto-generated method stub
		String hql="from Companytype ct where ct.name=:name";
	
	return 	(Companytype) getSession().createQuery(hql)
			.setString("name", name)
			.uniqueResult();
	}

	@Override
	public Companytype querybyID(int id) {
		String hql="from Companytype ct where ct.id=:id";
		
		return 	(Companytype) getSession().createQuery(hql)
				.setInteger("id", id)
				.uniqueResult();
	}

		
}
