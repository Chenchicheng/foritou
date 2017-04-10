package cn.foritou.service;

import java.sql.Timestamp;
import java.util.List;

import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Shoptype;

public interface ScoreService extends BaseService<Score>{
	
//根据sid获取评分信息
public List<Score> getScorebySid(int sid);

//获取平均分
public Long getCountbyShop(Shop shop);
//通过eid获取分数，获取平均分
public List<Score> getScoreByEid(int eid,int sid,Timestamp now ,Timestamp lastMonth);
}
