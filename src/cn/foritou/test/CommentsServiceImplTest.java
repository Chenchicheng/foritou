package cn.foritou.test;
import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.foritou.model.Comments;
import cn.foritou.model.Discount;
import cn.foritou.model.Shop;
import cn.foritou.model.Size;
import cn.foritou.service.CommentsService;
import cn.foritou.service.DiscountService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class CommentsServiceImplTest {

	@Resource
	private CommentsService commentsService;

	@Test
	public void testqueryJoinSIZE(){
		for(Comments d:commentsService.getBysid(5)){
		System.out.println(d.getComment());
		}
	}
	
    
}
