
package cn.foritou.service.impl;
import java.util.List;

import org.springframework.stereotype.Service;


import cn.foritou.model.Product;
import cn.foritou.model.Shop;
import cn.foritou.model.Shoptype;

import cn.foritou.service.ShoptypeService;

//模块自身的业务逻辑
@Service("shoptypeService")
@SuppressWarnings("unchecked")
public class ShoptypeServiceImpl extends BaseServiceImpl<Shoptype>  implements ShoptypeService{

	@Override
	public List<Product> getShop(int tid, int size) {
		// TODO Auto-generated method stub
		String hql="FROM Product where  shoptype.id=:tid";
        return  getSession().createQuery(hql)
        		.setInteger("tid", tid)
          		.setMaxResults(size)
          		.list();
		 
	}

	@Override
	public Shoptype getbyId(int tid) {
		String hql="FROM Shoptype where  id=:tid";
        return  (Shoptype) getSession().createQuery(hql)
        		.setInteger("tid", tid)

          		.uniqueResult();
	}


}