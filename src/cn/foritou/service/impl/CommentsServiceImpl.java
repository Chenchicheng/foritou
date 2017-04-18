package cn.foritou.service.impl;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import cn.foritou.model.Comments;
import cn.foritou.model.Company;
import cn.foritou.model.Employee;
import cn.foritou.service.CommentsService;
import cn.foritou.service.CompanyService;
import cn.foritou.service.EmployeeService;

//模块自身的业务逻辑
@Service("commentsService")
@SuppressWarnings("unchecked")
public class CommentsServiceImpl extends BaseServiceImpl<Comments>  implements CommentsService{
	@Override
	public void delete(int eid, int sid) {
		// TODO Auto-generated method stub
		String hql="delete from Comments where employee.id=:eid and shop.id=:sid";
		getSession().createQuery(hql)
		.setInteger("eid",eid)
		.setInteger("sid", sid)
		.executeUpdate()
		;
	}


	@Override
	public List<Comments> getBysid(int sid) {
		// TODO Auto-generated method stub
		String hql="from Comments where shop.id=:sid";
		return getSession().createQuery(hql)

		.setInteger("sid", sid)
		.list()
		;
	}


	@Override
	public List<Comments> get(int eid, int sid, Timestamp now,
			Timestamp lastMonth,BigDecimal state) {
		// TODO Auto-generated method stub
		String hql="from Comments where employee.id=:eid and sid=:sid and date between :now and :lastMonth and state=:state";
		return getSession().createQuery(hql)
                 .setInteger("eid", eid)
                 .setInteger("sid", sid)
                 .setTimestamp("now", now)
                 .setBigDecimal("state", state)
                 .setTimestamp("lastMonth", lastMonth)
				.list();
	}


	@Override
	public List<Comments> getBysidWithPage(Integer sid, String page, String rows) {
		  int currentpage = Integer.parseInt((page == null || page == "0") ? "1": page);//第几页  
	      int pagesize = Integer.parseInt((rows == null || rows == "0") ? "10": rows);//每页多少行  
	          
		String hql="FROM Comments where shop.id=:sid";
        return  getSession().createQuery(hql)
        		.setInteger("sid", sid).setFirstResult((currentpage - 1) * pagesize).setMaxResults(pagesize)  
        		.list();
	}


	@Override
	public int getCommentsTotal(Integer id) {
		return getBysid(id).size();
	}


	@Override
	public List<Object> findGoodComments() {
		 String sql = "select s.name as shopname,sum(state) as sum from comments c "+ 
					  "left outer join shop s on s.id = c.sid "+
                      "where c.state='1' "+
					  "group by sid ";
		Query query = getSession().createSQLQuery(sql);
		return query.list();
	
	}


	@Override
	public List<Object> findGeneralComments() {
		 String sql = "select s.name as shopname,count(state) as sum from comments c "+ 
				  "left outer join shop s on s.id = c.sid "+
                 "where c.state='2' "+
				  "group by sid ";
		 Query query = getSession().createSQLQuery(sql);
			return query.list();
	}


	@Override
	public List<Object> findBadComments() {
		 String sql = "select s.name as shopname,count(state) as sum from comments c "+ 
				  "left outer join shop s on s.id = c.sid "+
                 "where c.state='3' "+
				  "group by sid ";
		 Query query = getSession().createSQLQuery(sql);
			return query.list();
	}



	}




