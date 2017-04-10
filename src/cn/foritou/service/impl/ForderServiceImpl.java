
package cn.foritou.service.impl;

import java.math.BigDecimal;

import org.springframework.stereotype.Service;

import cn.foritou.model.Forder;
import cn.foritou.model.Sorder;
import cn.foritou.service.ForderService;
import cn.foritou.service.SorderService;

//模块自身的业务逻辑
@Service("forderService")

@SuppressWarnings("unchecked")
public class ForderServiceImpl extends BaseServiceImpl<Forder>  implements ForderService{

	@Override
	public BigDecimal cluTotal(Forder forder) {
		BigDecimal total=new BigDecimal(0.00);
		for(Sorder temp:forder.getSorderSet()){
		total=total.add(temp.getPersonprice().multiply(new BigDecimal(temp.getPersonnumber())));//计算价格后要返回新的total
			
		}
		System.out.println(total);
		return total;
		// TODO Auto-generated method stub
	
	}



}