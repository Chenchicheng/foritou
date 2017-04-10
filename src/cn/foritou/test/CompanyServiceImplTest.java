package cn.foritou.test;
import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.foritou.model.Company;
import cn.foritou.service.CompanyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class CompanyServiceImplTest {
	@Resource
	private CompanyService companyService;
	@Test
	public void testSave() {
		Company c=new Company();
	
	}
	@Test
	public void testlogin(){
		
		Company c=new Company();
		c.setPhone("15779166453");
		c.setPassword("123");
		Company c1=companyService.login(c);
	    System.out.println("c1type:"+c1.getCompanytype().getIndustry());
	}
	@Test
public void testElogin(){

	Company c=new Company();
	c.setInterpassword("210b162652b9ad59ed34ffa3b34eaee9");
	c.setCompanyname("江西福利淘有限公司");
	
  c=	companyService.employeeLogin(c);
  
   System.out.println("c1type:"+c.getCompanytype().getIndustry());
}
	@Test
public void testgetByname(){
System.out.println(companyService.getbyName("江西福利淘有限公司"));
	
}	
}
