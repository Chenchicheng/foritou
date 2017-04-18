package cn.foritou.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import cn.foritou.model.Collection;
import cn.foritou.model.Comments;
import cn.foritou.model.Company;

public interface CommentsService extends BaseService<Comments>  {
	
	public  void delete(int eid,int  sid);
   public List<Comments> getBysid(int sid);
   public List<Comments> get(int eid,int sid,Timestamp now,Timestamp lastMonth,BigDecimal state);
public List<Comments> getBysidWithPage(Integer id, String page, String rows);
public int getCommentsTotal(Integer id);
public List<Object> findGoodComments();
public List<Object> findGeneralComments();
public List<Object> findBadComments();

}
