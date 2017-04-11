package cn.foritou.service.impl;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import cn.foritou.model.Forder;
import cn.foritou.model.Sorder;
import cn.foritou.service.SorderService;
//模块自身的业务逻辑
@Service("sorderService")

@SuppressWarnings("unchecked")
public class SorderServiceImpl extends BaseServiceImpl<Sorder>  implements SorderService{

	@Override
	public List<Sorder> qureybycid(int cid,int stateid) {
		// TODO Auto-generated method stub
		String hql="from  Sorder where company.id=:cid and status.id=:stateid";
		return  getSession().createQuery(hql)
				.setInteger("cid",cid)
				.setInteger("stateid", stateid)
				.list();	
	}

	@Override
	public Forder addSorder(Forder forder, Sorder model) {
		// TODO Auto-generated method stub
		boolean isHave=false;
		Sorder sorder=modelToSorder(model);
		//判断当前购物项是否重复，如果重复则添加数量即可
		for(Sorder old:forder.getSorderSet()){
			if(old.getShop().getId().equals(sorder.getShop().getId())){
				//购物项有重复，添加数量即可
				//已经购买
				isHave=true;
				break;
			}
		}
		//说明当前购物项在购物车是不存在的，新添加即可
		if(!isHave){
			//建立购物项和购物车的关联,此时forder的id为null,但是入库的时候先入库购物车，再入库购物项，那时就有主键了
			sorder.setForder(forder);//记住是先入库购物车，再入库购物项。
			forder.getSorderSet().add(sorder);
		}
	
		return forder;
	}

	@Override
	public Sorder modelToSorder(Sorder model) {
		// TODO Auto-generated method stub
		Sorder sorder=new Sorder();
		sorder.setShopname(model.getShopname());
        sorder.setPersonnumber(model.getPersonnumber());
        sorder.setPersonprice(model.getPersonprice());
        sorder.setShopimage(model.getShopimage());
        sorder.setDiscount(model.getDiscount());
        sorder.setShop(model.getShop()); 
		return sorder;
	}

	@Override
	public Forder updateSorder(Forder forder, Sorder sorder) {
		// TODO Auto-generated method stub
		for(Sorder  temp:forder.getSorderSet()){
			if(temp.getShop().getId().equals(sorder.getShop().getId())){
				temp.setPersonnumber(sorder.getPersonnumber());	
			}
		}
		return forder;
	}

	@Override
	public List<Object> findCompanyAndMoney() {
	 String sql = "select c.companyname as companyname,SUM(total) as sum from forder f "+
						"left outer join company c on c.id = f.cid "+
						"right outer join sorder s on s.fid = f.id "+
						"group by cid";

	//List<Object> list = (List<Object>) this.getHibernateTemplate().find(sql);
    Query query = getSession().createSQLQuery(sql);
	return query.list();
	}

}