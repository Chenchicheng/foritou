package cn.foritou.test;
import java.util.Set;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.foritou.model.Company;
import cn.foritou.model.Discount;
import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Shoptype;
import cn.foritou.model.Store;
import cn.foritou.service.CompanyService;
import cn.foritou.service.ShopService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class shopServiceImplTest {
	@Resource
	private ShopService shopService;
	@Test
	public void testSave() {
    Shoptype st=new Shoptype(1);
    Shop s=new Shop();

	}
	@Test
	public void testlogin(){
    Shop s=new Shop();
    s.setPhone("15779166452");
    s.setPassword("123");
   Shop s1=shopService.login(s);
   System.out.println(s1.getShoptype().getTypename());
	}
	@Test
	public void testDelete(){
	     shopService.delete(6);
	     for(Shop  s:shopService.query()){
	      for(Shopimage image:s.getImageSet()){
	    	  System.out.println(image.getHref());
	      }
	      for(Store store:s.getStoreSet()){
	    	  System.out.println(store.getAddressmap());
	      }
	      for(Discount discount:s.getDiscountSet()){
	    	  System.out.println(discount.getPersonprice());
	      }
	      for(Score score:s.getScoreSet()){
	    	  System.out.println(score.getScorenumber());
	      }
	     }
	}
	@Test
	public void testQuery(){
		for(Shop shop:shopService.queryByType(1, 1, 8)){

		}
	}
	
}
