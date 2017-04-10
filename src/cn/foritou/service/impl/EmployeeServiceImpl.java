package cn.foritou.service.impl;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;

import cn.foritou.model.Company;
import cn.foritou.model.Employee;
import cn.foritou.service.CompanyService;
import cn.foritou.service.EmployeeService;

//模块自身的业务逻辑
@Service("employeeService")
public class EmployeeServiceImpl extends BaseServiceImpl<Employee>  implements EmployeeService{

	@Override
	public Employee getByWX(String weixin) {
	String hql="from Employee where weixin=:weixin";
		return (Employee)getSession().createQuery(hql)
				.setString("weixin",weixin)
				.uniqueResult();
		// TODO Auto-generated method stub
	}




}
