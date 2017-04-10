package cn.foritou.test;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.foritou.model.Company;
import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Shoptype;
import cn.foritou.service.CompanyService;
import cn.foritou.service.ShopService;
import cn.foritou.service.ShopimageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class ShopimageServiceImplTest {
	@Resource
	private ShopimageService shopimageService;
	@Test
	public void testgetImageList() {
		List<Shopimage> imageList=shopimageService.getImageList(5);
		System.out.println(imageList.get(0).getHref());
		List<Shopimage> imageList2=shopimageService.getImageListbyType("介绍展示", 22);
		System.out.println(imageList2.get(0).getHref());
	}
}
