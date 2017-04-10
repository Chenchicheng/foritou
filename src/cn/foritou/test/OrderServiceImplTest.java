package cn.foritou.test;
import javax.annotation.Resource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import cn.foritou.model.Employee;
import cn.foritou.model.Order;
import cn.foritou.service.EmployeeService;
import cn.foritou.service.OrderService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class OrderServiceImplTest {
	@Resource
    private OrderService orderService;

	@Test
    public void testQuery(){
	for(Order e:orderService.query()){
       System.out.println(e.getDiscount());
	}	
	}
	
}
