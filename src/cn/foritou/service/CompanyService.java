package cn.foritou.service;

import cn.foritou.model.Company;

public interface CompanyService extends BaseService<Company>{
	//企业登录
	public Company login(Company company);
	//员工绑定企业接口
	public Company employeeLogin(Company company);
	//根据公司名称获得公司（注：公司注册时必须保证公司名不能重复)
	public Company getbyName(String companyname);
	public Company querybyCid(int cid);
}
