package cn.foritou.service;

import cn.foritou.model.Employee;

public interface EmployeeService extends BaseService<Employee>{
	//员工绑定企业接口
	public void save(Employee employee);
}
