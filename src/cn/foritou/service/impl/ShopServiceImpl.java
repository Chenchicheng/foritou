
package cn.foritou.service.impl;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;
import cn.foritou.model.Shop;
import cn.foritou.service.ShopService;

//模块自身的业务逻辑
@Service("shopService")

@SuppressWarnings("unchecked")
public class ShopServiceImpl extends BaseServiceImpl<Shop>  implements ShopService{

	@Override
	public Shop login(Shop shop) {
		// TODO Auto-generated method stub
		String hql="FROM Shop s LEFT JOIN FETCH s.shoptype where s.phone=:phone AND s.password=:password";
          return  (Shop)getSession().createQuery(hql)
		 .setString("phone", shop.getPhone())
		 .setString("password",shop.getPassword())
		 .uniqueResult();
	}

	@Override
	public List<Shop> queryByType(int tid) {
		// TODO Auto-generated method stub
		String hql="FROM Shop where shoptype.id=:tid";
        return  getSession().createQuery(hql)
		 .setInteger("tid", tid)
		 .list();
	}

	@Override
	public List<Shop> queryByType(int tid, int hot, int number) {
		// TODO Auto-generated method stub
		String hql="FROM Shop where shoptype.id=:tid and hot=:hot";
        return  getSession().createQuery(hql)
		 .setInteger("tid", tid)
		 .setInteger("hot", hot)
		 .setMaxResults(number)
		 .list();
	}

	@Override
	public List<Shop> queryByQu(String shangqu,int start,int pageSize) {
		// TODO Auto-generated method stub
		System.out.println(shangqu);
		String hql="FROM Shop where area like:shangqu";
        return  getSession().createQuery(hql)
        		 .setString("shangqu","%"+shangqu+"%")
        		 .setFirstResult(start)
        		 .setMaxResults(pageSize)
        	
		         .list();
	}

	@Override
	public List<Shop> queryByQuan(String shangquan,int start,int pageSize) {
		// TODO Auto-generated method stub
		String hql="FROM Shop where shangquan  like:shangquan";
        return  getSession().createQuery(hql)
        	.setString("shangquan","%"+shangquan+"%")	
		 .setFirstResult(start)
		 .setMaxResults(pageSize)
		 .list();
	}

	@Override
	public List<Shop> Search(String searchString, int start, int pageSize) {
		// TODO Auto-generated method stub
		String hql="FROM Shop where shangquan like:searchString"+
				" or miaoshu like:searchString"+
				" or city like:searchString"+
				" or describle like:searchString"+
				" or area like:searchString"+
				" or address like:searchString"+
				" or shoptype.typename like:searchString";
        return  getSession().createQuery(hql)
        	.setString("searchString","%"+searchString+"%")	
		 .setFirstResult(start)
		 .setMaxResults(pageSize)
		 .list();
	}

	@Override
	public List<Shop> queryHot(int hot, int number) {
		// TODO Auto-generated method stub
		String hql="FROM Shop where hot=:hot";
        return  getSession().createQuery(hql)
		 .setInteger("hot", hot)
		 .setMaxResults(number)
		 .list();
	}


}