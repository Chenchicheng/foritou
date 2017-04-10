package cn.foritou.service;

import java.util.List;

import cn.foritou.model.Discount;
import cn.foritou.model.Product;
import cn.foritou.model.Shop;
import cn.foritou.model.Size;

public interface ProductService extends BaseService<Product>{
public Product getbysid(int sid);
public List<Product> qureyByTid(int tid);
}
