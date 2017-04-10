
package cn.foritou.service.impl;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.foritou.model.Discount;
import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.service.ScoreService;
import cn.foritou.service.ShopService;

//模块自身的业务逻辑
@Service("scoreService")
@SuppressWarnings("unchecked")
public class ScoreServiceImpl extends BaseServiceImpl<Score>  implements ScoreService{
	@Override
	public List<Score> getScorebySid(int sid) {
		String hql="FROM Score where shop.id=:sid";
        return  getSession().createQuery(hql)
		 .setInteger("sid", sid)
		 .list();
	}
	@Override
	public Long getCountbyShop(Shop shop) {
		// TODO Auto-generated method stub
		String hql="select count(s) from Score  s where s.shop=:shop";
		return (Long)getSession().createQuery(hql)
				.setEntity("shop", shop)
				.uniqueResult();
	}
}