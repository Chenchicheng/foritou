package cn.foritou.action;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.FileImage;
import cn.foritou.service.AverageService;
import cn.foritou.service.CollectionService;
import cn.foritou.service.CommentsService;
import cn.foritou.service.CompanyService;
import cn.foritou.service.CompanyTypeService;
import cn.foritou.service.DiscountService;
import cn.foritou.service.EmployeeService;
import cn.foritou.service.ForderService;
import cn.foritou.service.OrderService;
import cn.foritou.service.ProductService;
import cn.foritou.service.RelatedService;
import cn.foritou.service.ScoreService;
import cn.foritou.service.ShopService;
import cn.foritou.service.ShopimageService;

import cn.foritou.service.ShoptypeService;
import cn.foritou.service.SizeService;
import cn.foritou.service.SorderService;
import cn.foritou.service.StatusService;
import cn.foritou.service.StoreService;
import cn.foritou.service.UsernotesService;
import cn.foritou.service.WxshopService;
import cn.foritou.util.EmailUtil;
import cn.foritou.util.FileUpload;
import cn.foritou.util.MessageUtil;


import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/*
 * struts流程，先创建action，在调用拦截器，拦截器访问成功再调用Action的方法
 * 在项目启动的时候Struts的过滤器，和内置对象对应的map存储到了actionContext和值栈中
 * 如果实现了相应的aware接口就会从actionContext中获取Map进行传入实现的拦截器为servletconfig
 * servletconfi
 * */
@Controller
@Scope("prototype")
public class BaseAction<T> extends ActionSupport implements ServletRequestAware,ServletResponseAware,RequestAware,SessionAware,ApplicationAware,ModelDriven<T> {
	@Resource
	protected CompanyService companyService;
	@Resource
	protected ShopService shopService;
	@Resource
	protected ShopimageService shopimageService;
	@Resource
	protected StoreService storeService;
	@Resource
	protected DiscountService discountService;
	@Resource
	protected SizeService sizeService;
	@Resource
	protected UsernotesService usernotesService;
	@Resource
	protected ScoreService scoreService;
	@Resource
	protected ProductService productService;
	@Resource
	protected SorderService sorderService;
	@Resource
	protected ForderService forderService;
	@Resource
	protected EmployeeService employeeService;
	@Resource
	protected CollectionService collectionService;
	@Resource
	protected WxshopService  wxshopService;
	@Resource
	protected OrderService  orderService;
	@Resource
	protected StatusService  statusService;
	@Resource
	protected ShoptypeService  ShoptypeService;
	@Resource
	protected CommentsService  commentsService;
	@Resource
	protected AverageService  averageService;
	@Resource
	protected RelatedService  relatedService;
	@Resource
	protected CompanyTypeService  companyTypeService;
	
	//获取要删除的id数组
    protected String ids;
	protected InputStream inputStream;
	
    public InputStream getInputStream() {
		return inputStream;
	}


public String getIds() {
		return ids;
	}


	public void setIds(String ids) {
		this.ids = ids;
	}

	/*
 * 
 * 可重复使用代码*/
	//图片上传功能实现
	protected FileImage fileImage;
	@Resource
	protected FileUpload fileUpload;
	@Resource
	protected EmailUtil emailUtil;
	@Resource
	protected MessageUtil messageUtil ;
	
	
	
	
	
	
	
	
	//wxshop分页
     protected Integer pageSize;
     protected Integer start;
	//2016/11/30获取地理位置
     protected String latitude;
     protected String longitude;
     //2016、、12/3验证公司名字
     protected String companyname;
  //搜索字段
     protected String searchString;
     
     
     
     
     
	
	//存储分页
	protected String  page;
	protected String rows;
	
	protected Map<String, Object> pageMap=null;//分页用的
	protected List<T> jsonList=null;
	protected ArrayList<String> listString=null;//用于返回json结果
	public Map<String, Object> getPageMap() {//返回json格式需要get方法
		System.out.println("-----getPageMap------");
		return pageMap;
	}

	public List<T> getJsonList() {//返回json格式需要get方法
		return jsonList;
	}

	protected Map<String,Object> request;
	protected Map<String,Object> session;
	protected Map<String,Object> application;
	protected T model;
	@Override
	public T getModel() {
		// TODO Auto-generated method stub
		//getClass().getGenericSuperclass()返回表示此 Class 所表示的实体（类、接口、基本类型或 void）的直接超类的 Type
		//getActualTypeArguments()返回表示此类型实际类型参数的 Type 对象的数组。[0]就是这个数组中第一个了。。
		
		ParameterizedType type=	(ParameterizedType)this.getClass().getGenericSuperclass();
		Class clazz=(Class) type.getActualTypeArguments()[0];
		try {
			model=(T)clazz.newInstance();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return model;
	}


	public FileImage getFileImage() {
		System.out.println("getFileImage:"+fileImage); 
		return fileImage;
	}


	public void setFileImage(FileImage fileImage) {
		System.out.println("setsFileImage:"+fileImage); 
		this.fileImage = fileImage;
	}




	public ArrayList<String> getListString() {
		return listString;
	}


	public void setListString(ArrayList<String> listString) {
		this.listString = listString;
	}
	
	
	
	
	public String getPage() {
		return page;
	}


	public void setPage(String page) {
		this.page = page;
	}


	public String getRows() {
		return rows;
	}


	public void setRows(String rows) {
		this.rows = rows;
	}


	public Integer getPageSize() {
		return pageSize;
	}


	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	public Integer getStart() {
		return start;
	}


	public String getLatitude() {
		return latitude;
	}


	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}


	public String getLongitude() {
		return longitude;
	}


	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}


	public void setStart(Integer start) {
		this.start = start;
	}


	public String getCompanyname() {
		return companyname;
	}


	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getSearchString() {
		return searchString;
	}


	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}


	public void returnJson() {
		try {
			JSONArray jsonobject=JSONArray.fromObject(listString); 
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().printf(jsonobject.toString());
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException();
		}	
		
	}


	@Override
	public void setApplication(Map<String, Object> application) {
		// TODO Auto-generated method stub
		this.application=application;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	
	protected HttpServletRequest request2;
	protected HttpServletResponse response2;
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request2 = request;
		
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response2 = response;
		
	}

}
