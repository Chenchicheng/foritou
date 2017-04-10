package cn.foritou.test;
import java.util.List;
import javax.annotation.Resource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.foritou.model.Shop;
import cn.foritou.model.Store;
import cn.foritou.service.StoreService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class storeServiceImplTest {
	@Resource
	private StoreService storeService;
	@Test
    public void testgetStore(){
		Shop shop=new Shop(5);
      List<Store> slist=storeService.getStorebySid(5);
      System.out.println(slist.get(0).getAdress());
      System.out.println(storeService.getCountbyShop(shop));
	}
}
