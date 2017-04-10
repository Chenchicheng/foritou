
package cn.foritou.service.impl;
import org.springframework.stereotype.Service;
import cn.foritou.model.Shop;
import cn.foritou.model.Usernotes;
import cn.foritou.service.ShopService;
import cn.foritou.service.UsernotesService;

//模块自身的业务逻辑
@Service("usernotesService")
public class UsernotesServiceImpl extends BaseServiceImpl<Usernotes>  implements UsernotesService{

	@Override
	public Usernotes querybySid(int sid) {
		// TODO Auto-generated method stub
		String hql="FROM Usernotes where shop.id=:sid";
        return  (Usernotes) getSession().createQuery(hql)
		 .setInteger("sid", sid)
		 .uniqueResult();
	}




}