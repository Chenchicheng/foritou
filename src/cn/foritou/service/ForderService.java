package cn.foritou.service;

import java.math.BigDecimal;

import cn.foritou.model.Forder;



public interface ForderService extends BaseService<Forder>{
//计算购物车总价钱
	public BigDecimal cluTotal(Forder forder);

}
