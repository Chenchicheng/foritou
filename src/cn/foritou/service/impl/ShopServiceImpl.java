
package cn.foritou.service.impl;
import java.util.List;

import org.springframework.stereotype.Service;
import cn.foritou.model.Shop;
import cn.foritou.model.Usernotes;
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
	public Shop querybyId(int id){
		String hql="FROM Shop s where s.id=:id";
        return  (Shop) getSession().createQuery(hql)
		 .setInteger("id", id)
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


}