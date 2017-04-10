package cn.foritou.service;
import cn.foritou.model.Companytype;
public interface CompanyTypeService extends BaseService<Companytype>{

	public Companytype querybyType(String name);
	
}
