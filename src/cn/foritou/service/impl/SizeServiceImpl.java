package cn.foritou.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;


import cn.foritou.model.Shop;
import cn.foritou.model.Size;
import cn.foritou.service.ShopService;
import cn.foritou.service.SizeService;

//模块自身的业务逻辑
@Service("sizeService")
public class SizeServiceImpl extends BaseServiceImpl<Size>  implements SizeService{


	@Override
    @SuppressWarnings("unchecked")
	public Size getSize(int number){
		// TODO Auto-generated method stub
		String hql="FROM Size s";

		List<Size> slist= getSession().createQuery(hql).list();
        for(Size size:slist){
        	//取出size中的最大最小数判断后获取公司的规模
        	String sizeString=size.getSize();
        	int min=Integer.parseInt(sizeString.split(",")[0]);
        	int max=Integer.parseInt(sizeString.split(",")[1]);
        	if(number>min&&number<max||number>min&&number==max){
        		return size;
        	}
        	
        }
        return null;
		 
	}


}
