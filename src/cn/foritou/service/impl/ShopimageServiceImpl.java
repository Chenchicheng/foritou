package cn.foritou.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;


import cn.foritou.model.Shopimage;

import cn.foritou.service.ShopimageService;

//模块自身的业务逻辑
@Service("shopimageService")
@SuppressWarnings("unchecked")
public class ShopimageServiceImpl extends BaseServiceImpl<Shopimage>  implements ShopimageService{


	@Override
	public List<Shopimage> getImageListWithPage(int sid,String page,String rows) {
		System.out.println(page);
		System.out.println(rows);  
		  int currentpage = Integer.parseInt((page == null || page == "0") ? "1": page);//第几页  
	      int pagesize = Integer.parseInt((rows == null || rows == "0") ? "10": rows);//每页多少行  
	          
		String hql="FROM Shopimage where shop.id=:sid";
        return  getSession().createQuery(hql)
        		.setInteger("sid", sid).setFirstResult((currentpage - 1) * pagesize).setMaxResults(pagesize)  
        		.list();
	}
    @Override
	 // 统计一共有多少数据  
    public int getImageTotal(int sid) throws Exception {  
        return getImageList(sid).size();
    }  
    
    
	@Override
	public List<Shopimage> getImageListbyType(String type, int sid) {
		// TODO Auto-generated method stub
		String hql="FROM Shopimage  where shop.id=:sid and type=:type";
        return  getSession().createQuery(hql)
        		.setString("type", type)
        		.setInteger("sid", sid)
        		.list();
        		
	}

	@Override
	public void deleteByids(String ids) {
		// TODO Auto-generated method stub
		String hql="delete from Shopimage where id in ("+ids+")";
		getSession().createQuery(hql)
		.executeUpdate()
		;
	}

	@Override
	public List<Shopimage> getImageListby(int sid, String type, int page,
			int size) {
		// TODO Auto-generated method stub
		String hql="FROM Shopimage  where shop.id=:sid and type=:type";
        return  getSession().createQuery(hql)
        		.setString("type", type)
        		.setInteger("sid", sid)
        		.setFirstResult((page-1)*size)
			    .setMaxResults(size)
        		.list();
	}

	@Override
	public List<Shopimage> getImageList(int sid) {
		String hql="FROM Shopimage where shop.id=:sid";
        return  getSession().createQuery(hql)
        		.setInteger("sid", sid)
        		.list();
	}




}


