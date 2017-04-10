package cn.foritou.test;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.foritou.model.Company;
import cn.foritou.model.Score;
import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Shoptype;
import cn.foritou.model.Store;
import cn.foritou.service.CompanyService;
import cn.foritou.service.ScoreService;
import cn.foritou.service.ShopService;
import cn.foritou.service.ShopimageService;
import cn.foritou.service.StoreService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class ScoreServiceImplTest {
    @Resource
	private ScoreService scoreService;
    @Test
    public void testgetScore(){
    	Shop shop =new Shop(5);
	 List<Score> slist=scoreService.getScorebySid(5);
	 System.out.println(slist.get(0).getScorenumber());
	 System.out.println(scoreService.getCountbyShop(shop));
  }
    
}
