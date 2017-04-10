package cn.foritou.service.impl;

import org.springframework.stereotype.Service;

import cn.foritou.model.Average;
import cn.foritou.model.Company;
import cn.foritou.model.Product;
import cn.foritou.service.AverageService;
import cn.foritou.service.CompanyService;

//模块自身的业务逻辑
@Service("averageService")
public class AverageServiceImpl extends BaseServiceImpl<Average>  implements AverageService{

	@Override
	public Average queryByTid(int tid) {
			// TODO Auto-generated method stub
			String hql="FROM Average where tid=:tid";
	        return  (Average) getSession().createQuery(hql)
			 .setInteger("tid", tid)
			 .uniqueResult();
	
	}





}
