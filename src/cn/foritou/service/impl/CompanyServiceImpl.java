package cn.foritou.service.impl;

import org.springframework.stereotype.Service;

import cn.foritou.model.Company;
import cn.foritou.model.Usernotes;
import cn.foritou.service.CompanyService;

//模块自身的业务逻辑
@Service("companyService")
public class CompanyServiceImpl extends BaseServiceImpl<Company>  implements CompanyService{

	@Override
	public Company login(Company company) {
		// TODO Auto-generated method stub
		String hql="FROM Company c where c.phone=:phone AND c.password=:password";
        return  (Company)getSession().createQuery(hql)
		 .setString("phone", company.getPhone())
		 .setString("password",company.getPassword())
		 .uniqueResult();
	}

	@Override
	public Company employeeLogin(Company company) {
		// TODO Auto-generated method stub
		String hql="FROM Company c LEFT JOIN FETCH c.companytype where c.companyname=:companyname AND c.interpassword=:interpassword";
        return  (Company)getSession().createQuery(hql)
		 .setString("companyname", company.getCompanyname())
		 .setString("interpassword",company.getInterpassword())
		 .uniqueResult();
	}


	@Override
	public Company getbyName(String companyname) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String hql="FROM  Company where companyname=:companyname";
        return  (Company) getSession().createQuery(hql)
		 .setString("companyname", companyname)
		 .uniqueResult();
		
	}
	@Override
	public Company querybyCid(int cid) {
		// TODO Auto-generated method stub
		String hql="FROM Company where id=:cid";
        return  (Company) getSession().createQuery(hql)
		 .setInteger("cid", cid)
		 .uniqueResult();
	}
}
