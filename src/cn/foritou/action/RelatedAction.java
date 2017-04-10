package cn.foritou.action;


import java.util.ArrayList;

import java.util.List;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Collection;
import cn.foritou.model.Comments;
import cn.foritou.model.Company;
import cn.foritou.model.Distance;
import cn.foritou.model.Product;
import cn.foritou.model.Related;
import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.util.DigestUtil;
import cn.foritou.util.GroomShopUtil;
import cn.foritou.util.NumberUtil;
@Controller
@Scope("prototype")
public class RelatedAction extends BaseAction<Related> {
	private int eid;
	private int sid;

	public String getGroomShop(){
		Company company=new Company();
		List<Related> relatedList=new ArrayList<Related>();
		List<Integer> sidList=new ArrayList<Integer>();
		if(session.get("company")!=null){
			company=(Company) session.get("company");
			relatedList=relatedService.getbycid(company.getId());
			for (int i = 0; i < relatedList.size() - 1; i++) {  
			     for (int j = 1; j < relatedList.size() - i; j++) {  
			         Related a=new Related();  
			         if ((relatedList.get(j - 1).getDegree())<(relatedList.get(j).getDegree()) ) { // 比较两个关联系数的大小  

			             a = relatedList.get(j - 1);  
			             relatedList.set((j - 1), relatedList.get(j));  
			             relatedList.set(j, a);  
			         }  
			     }  
			 } 
			
			for(Related r:relatedList){
				sidList.add(r.getSid());
				} 
			List<Product> productList=new ArrayList<Product>();
			for(int i=0;i<sidList.size();i++){//这里需要修改
				Product product=new Product();
				product=productService.getbysid(sidList.get(i));
				productList.add(product);
				
			}
		
			session.put("shopbytypeList", productList);
			
		}else{
			List<Distance> distanceList=new ArrayList<Distance>();
			double average=0.0;
			for(Shop shop:shopService.query()){
				average=0.0;
				for(Score score:scoreService.getScorebySid(shop.getId())){
					
					average+=score.getScorenumber();
					
				}
				Distance distance=new Distance();
				distance.setSid(shop.getId());
				distance.setDistance(average);
			    distanceList.add(distance);	
			}
			
			for (int i = 0; i < distanceList.size() - 1; i++) {  
			     for (int j = 1; j < distanceList.size() - i; j++) {  
			         Distance a=new Distance();  
			         if ((distanceList.get(j - 1).getDistance())<(distanceList.get(j).getDistance()) ) { // 比较两个整数的大小  

			             a = distanceList.get(j - 1);  
			             distanceList.set((j - 1), distanceList.get(j));  
			             distanceList.set(j, a);  
			         }  
			     }  
			 } 
			for(Distance d:distanceList){
			sidList.add(d.getSid());
			} 
			List<Product> productList=new ArrayList<Product>();
			for(int i=0;i<sidList.size();i++){//这里需要修改
				Product product=new Product();
				product=productService.getbysid(sidList.get(i));
				productList.add(product);
				
			}
			session.put("shopbytypeList", productList);
		}
		
		
		return "success";
		
	}
	
	
	
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	


	
	
	

}
