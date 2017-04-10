
package cn.foritou.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.foritou.model.Order;
import cn.foritou.model.Product;
import cn.foritou.model.Score;
import cn.foritou.service.OrderService;
import cn.foritou.service.ProductService;

//模块自身的业务逻辑
@Service("orderService")

@SuppressWarnings("unchecked")
public class OrderServiceImpl extends BaseServiceImpl<Order>  implements OrderService{

	@Override
	public List<Order> queryOrderbyCid(int cid) {
		// TODO Auto-generated method stub
	
			String hql="FROM Order where company.id=:cid";
	        return  getSession().createQuery(hql)
			 .setInteger("cid", cid)
			 .list();
		
	}

	@Override
	public List<Order> getBySid(int sid, int statusid) {
		// TODO Auto-generated method stub
		String hql="FROM Order where shop.id=:sid and status.id=:statusid";
        return  getSession().createQuery(hql)
		 .setInteger("sid", sid)
		 .setInteger("statusid", statusid)
		 .list();
	}




}