
package cn.foritou.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.foritou.model.Product;
import cn.foritou.model.Shop;
import cn.foritou.service.ProductService;
import cn.foritou.util.DistanceUtil;

//模块自身的业务逻辑
@Service("productService")

@SuppressWarnings("unchecked")
public class ProductServiceImpl extends BaseServiceImpl<Product>  implements ProductService{

	@Override
	public Product getbysid(int sid) {
		// TODO Auto-generated method stub
		String hql="FROM Product where shop.id=:sid";
        return  (Product) getSession().createQuery(hql)
		 .setInteger("sid", sid)
		 .uniqueResult();
	}

	@Override
	public List<Product> qureyByTid(int tid) {
		// TODO Auto-generated method stub
		String hql="FROM Product where shoptype.id=:tid";
        return  getSession().createQuery(hql)
		 .setInteger("tid", tid)
		 .list();
	}

	@Override
	public List<Product> queryByTid(int tid, int size) {
		// TODO Auto-generated method stub
		String hql="FROM Product where shoptype.id=:tid";
        return  getSession().createQuery(hql)
		 .setInteger("tid", tid)
		 .setMaxResults(size)
		 .list();
	}


}