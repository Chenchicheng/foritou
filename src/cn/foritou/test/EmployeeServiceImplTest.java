package cn.foritou.test;
import javax.annotation.Resource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import cn.foritou.model.Employee;
import cn.foritou.service.EmployeeService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class EmployeeServiceImplTest {
	@Resource
    private EmployeeService employeeService;

	@Test
    public void testQuery(){
	for(Employee e:employeeService.query()){
		System.out.println(e.getNickname());	
		System.out.println(e.getCompany());
		System.out.println(e.getCompany().getCompanytype().getName());
	}	
	}
	
}
