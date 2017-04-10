package cn.foritou.service;

import cn.foritou.model.Employee;

public interface EmployeeService extends BaseService<Employee>{
public Employee getByWX(String weixin);
}
