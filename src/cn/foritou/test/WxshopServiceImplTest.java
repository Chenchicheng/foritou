package cn.foritou.test;
import java.sql.Timestamp;

import javax.annotation.Resource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import cn.foritou.model.Employee;
import cn.foritou.model.Wxshop;
import cn.foritou.service.EmployeeService;
import cn.foritou.service.WxshopService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class WxshopServiceImplTest {
	@Resource
    private WxshopService wxshopService;
	@Test
	public void testGetWxshop(){
Timestamp tt = new Timestamp(System.currentTimeMillis());
	for(Wxshop ws:wxshopService.query(5,tt, 1, 6,1)){
		
		System.out.println(ws.getDiscount());
		
	}
	}
	@Test
	public void testGetCount(){
		Timestamp tt = new Timestamp(System.currentTimeMillis());
	
		System.out.println(wxshopService.getWxCount(5, tt, 1));
		
		
		
		
		
	}
	
	
	
	}
	

