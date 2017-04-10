package cn.foritou.test;
import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.foritou.model.Discount;
import cn.foritou.model.Shop;
import cn.foritou.model.Size;
import cn.foritou.service.DiscountService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class DiscountServiceImplTest {

	@Resource
	private DiscountService discountService;
	@Test
	public void testquery(){
		for(Discount  d:discountService.query()){
			System.out.println(d.getShop().getShoptype().getTypename());
		}
		Size size=new Size(1);
		Shop shop=new Shop(5);
		Discount d=discountService.getDiscount(shop, size);
		System.out.println(d.getId());
	    d=discountService.getDiscount(5, 1);
	    System.out.println(d.getId());
	
		
	}
	@Test
	public void testqueryJoinSIZE(){
		for(Discount d:discountService.queryJoinSize(5)){
			System.out.println(d.getSize().getSize());
		}
	}
	
    
}
