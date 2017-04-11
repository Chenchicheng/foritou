package cn.foritou.service;

import java.util.List;

import cn.foritou.model.Forder;
import cn.foritou.model.Sorder;



public interface SorderService extends BaseService<Sorder>{
//通过company和stateid获取购物车里的内容
	public List<Sorder> qureybycid(int cid,int stateid);
	//加入购物车
	public  Forder addSorder(Forder forder,Sorder sorder);
	//把model转化为Sorder
	public Sorder modelToSorder(Sorder sorder);
	//更新购物车
	public Forder updateSorder(Forder forder, Sorder sorder);
	public List<Object> findCompanyAndMoney();
}
