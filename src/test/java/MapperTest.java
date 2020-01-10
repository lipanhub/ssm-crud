import com.frog.bean.Employee;
import com.frog.dao.EmployeeMapper;
import com.github.pagehelper.PageHelper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("classpath:applicationContext.xml")
public class MapperTest {

   // @Autowired


    //@Autowired


   // @Test
    public void testCRUD(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");

        EmployeeMapper  employeeMapper = (EmployeeMapper) context.getBean("employeeMapper");


        PageHelper.startPage(1,10);

        List<Employee> list = employeeMapper.selectByExample(null);

        //PageInfo pageInfo = new PageInfo(list,1);

        System.out.println(list.size());

    }

    public static void main(String[] args) {
        new MapperTest().testCRUD();
    }
}
