package cn.foritou.service;

import cn.foritou.model.Company;

public interface CompanyService extends BaseService<Company>{
	//企业登录
	public Company login(Company company);
	//员工绑定企业接口
	public Company employeeLogin(Company company);
}
