package cn.foritou.service;

import java.util.List;

import cn.foritou.model.Product;
import cn.foritou.model.Shop;
import cn.foritou.model.Shoptype;

public interface ShoptypeService extends BaseService<Shoptype>{
public List<Product> getShop(int tid,int size);
public Shoptype getbyId(int tid);
}
