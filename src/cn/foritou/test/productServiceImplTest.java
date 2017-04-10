package cn.foritou.test;
import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.foritou.model.Company;
import cn.foritou.model.Product;
import cn.foritou.service.CompanyService;
import cn.foritou.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class productServiceImplTest {
	@Resource
	private ProductService productService;
	@Test
	public void testSave() {
	   Product product=productService.getbysid(5);
	   System.out.println(product.getPic());
	
	}

}
