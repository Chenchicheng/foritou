package cn.foritou.service.impl;


import java.lang.reflect.ParameterizedType;
import java.util.List;


import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import cn.foritou.service.BaseService;



//公共模块的抽取
@SuppressWarnings("unchecked")
@Service("baseService")
@Lazy(true)
public class BaseServiceImpl<T> implements BaseService<T> {
	private Class clazz;//clazz中存储了当前操作类型
	public BaseServiceImpl(){
	    ParameterizedType type=(ParameterizedType) this.getClass().getGenericSuperclass();
	    clazz=(Class)type.getActualTypeArguments()[0];
	    System.out.println(clazz);
	}
		
	@Resource//没有指定名称，默认是属性的名称与Id捆绑
	private SessionFactory sessionFactory;

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	/*public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}*/
	@Override
	public void save(T t) {
		// TODO Auto-generated method stub
		getSession().save(t);
	}

	@Override
	public void update(T t) {
		// TODO Auto-generated method stub
		getSession().update(t);
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		String sql="delete "+clazz.getSimpleName()+"  where id=:id";
		getSession().createQuery(sql).setInteger("id",id).executeUpdate();
	}

	@Override
	public T get(int id) {
		// TODO Auto-generated method stub
		return (T)getSession().get(clazz, id);
	}

	@Override
	public List<T> query() {
		// TODO Auto-generated method stub
		String hql="from "+clazz.getSimpleName();
		return getSession().createQuery(hql).list();
	}

}











































/*
//公共模块的抽取
@SuppressWarnings("unchecked")
@Service("baseService")
@Lazy(true)
public class BaseServiceImpl<T> implements BaseService<T> {
	private Class clazz;//clazz中存储了当前操作类型
	public BaseServiceImpl(){
		System.out.println("this代表当前调用构造方法的对象："+this);
		System.out.println("获取this对象的父类信息："+this.getClass().getSuperclass());
		System.out.println("获取当前this对象的父类信息(包括泛型信息）:"+this.getClass().getGenericSuperclass());
	    ParameterizedType type=(ParameterizedType) this.getClass().getGenericSuperclass();
	    clazz=(Class)type.getActualTypeArguments()[0];
	    System.out.println("此时的class:"+clazz);
	    //System.out.println("---------启动流程1-----------");
	  
	    
	}
	@PostConstruct
	public void init(){
		System.out.println("init");
		//根据clazz的类型，把不同的Dao对象赋值给baseDao对象
		String clazzName=clazz.getSimpleName();//类的简单名称如Account
		System.out.println("clazzName:"+clazzName);
		String clazzDao=clazzName.substring(0,1).toLowerCase() //获取第一字母并转成小写
		+clazzName.substring(1)+"Dao"; //加上末尾Dao 如Account-->accountDao
		  try {
	Field clazzfield=this.getClass().getSuperclass().getDeclaredField(clazzDao);
	Field baseField=this.getClass().getSuperclass().getDeclaredField("baseDao");
	baseField.set(this, clazzfield.get(this));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}
	
	protected BaseDao baseDao;//如果当前T是account，则basedao里面就是AccountDao，如果，category，则是categorydao
	@Resource
	protected AccountDao accountDao;
	@Resource
	protected CategoryDao categoryDao;
	@Resource
	protected ProductDao  productDao;
	@Resource
	protected ForderDao forderDao;
	@Resource
	protected SorderDao  sorderDao;
	@Resource
	protected UserDao  userDao;
	@Resource//没有指定名称，默认是属性的名称与Id捆绑
	//private SessionFactory sessionFactory;

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void save(T t) {
		// TODO Auto-generated method stub
		baseDao.save(t);
	}

	@Override
	public void update(T t) {
		// TODO Auto-generated method stub
		baseDao.update(t);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(id);
	
	}

	@Override
	public T get(int id) {
		// TODO Auto-generated method stub
		return (T)baseDao.get(id);
	}

	@Override
	public List<T> query() {
		// TODO Auto-generated method stub
     return baseDao.query();
	}

}
*/