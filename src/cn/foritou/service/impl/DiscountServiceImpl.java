package cn.foritou.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.foritou.model.Discount;
import cn.foritou.model.Shop;
import cn.foritou.model.Size;
import cn.foritou.service.DiscountService;

//模块自身的业务逻辑
@Service("discountService")
public class DiscountServiceImpl extends BaseServiceImpl<Discount>  implements DiscountService{

	@Override
	public Discount getDiscount(Shop shop, Size size) {

			String hql="FROM Discount d  where d.shop=:shop AND d.size=:size";
	        return  (Discount)getSession().createQuery(hql)
			 .setEntity("shop", shop)
			 .setEntity("size", size)
			 .uniqueResult();
	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Discount> queryJoinSize(int sid) {
		// TODO Auto-generated method stub
		String hql="FROM Discount  where shop.id=:sid";
        return  getSession().createQuery(hql)
	     .setInteger("sid", sid)
		 .list();
         
	}

	@Override
	public void deleteByids(String ids) {
		// TODO Auto-generated method stub
		String hql="delete from Discount where id in ("+ids+")";
		getSession().createQuery(hql)
		.executeUpdate()
		;
	}

	@Override
	public Discount getDiscount(int sid, int csizeid) {
		// TODO Auto-generated method stub
		String hql="FROM Discount  where shop.id=:sid AND size.id=:csizeid";
        return  (Discount)getSession().createQuery(hql)
		 .setInteger("sid", sid)
		 .setInteger("csizeid",csizeid)
		 .uniqueResult();
	}

	@Override
	public List<Discount> queryJoinSizeWithPage(Integer sid, String page,
			String rows) {
		int currentpage = Integer.parseInt((page == null || page == "0") ? "1": page);//第几页  
	      int pagesize = Integer.parseInt((rows == null || rows == "0") ? "10": rows);//每页多少行  
	          
		String hql="FROM Discount where shop.id=:sid";
      return  getSession().createQuery(hql)
      		.setInteger("sid", sid).setFirstResult((currentpage - 1) * pagesize).setMaxResults(pagesize)  
      		.list();
	}

	@Override
	public int getDiscountTotal(Integer sid) {
		  String hql="FROM Discount where shop.id=:sid";
	      return  getSession().createQuery(hql)
	    		  .setInteger("sid", sid)
	    		  .list().size();
	}

	


}
