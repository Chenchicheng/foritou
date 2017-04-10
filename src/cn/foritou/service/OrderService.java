package cn.foritou.service;
import java.util.List;

import cn.foritou.model.Order;
public interface OrderService extends BaseService<Order>{
public List<Order> queryOrderbyCid(int cid);
public List<Order> getBySid(int sid,int statusid);
}
