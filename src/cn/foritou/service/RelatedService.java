package cn.foritou.service;

import java.util.List;

import cn.foritou.model.Related;

public interface RelatedService extends BaseService<Related>{
public Related get(int sid,int cid);
public List<Related> getbycid(int cid);
}
