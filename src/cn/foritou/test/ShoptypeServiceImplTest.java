package cn.foritou.test;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.foritou.model.Shoptype;
import cn.foritou.service.ShoptypeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class ShoptypeServiceImplTest {
	@Resource
	private ShoptypeService shoptypeService;
	@Test
	public void testquery() {
      List<Shoptype> stlist=shoptypeService.query();
      for(Shoptype st:stlist){
    	  System.out.println("----------"+st.getTypename());
  
      }
	}

}
