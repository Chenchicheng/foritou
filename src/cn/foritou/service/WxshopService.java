package cn.foritou.service;

import java.sql.Timestamp;
import java.util.List;

import cn.foritou.model.Wxshop;


public interface WxshopService extends BaseService<Wxshop>{
//根据sid和ci和状态查出Wxshop
	public Wxshop querybySid(int sid,int cid);
	public List<Wxshop> query(int cid,Timestamp now,int start, int pageSize,int stateid);
    public long getWxCount(int cid,Timestamp now,int stateid);
}
