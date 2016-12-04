

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
public static void main(String[] args) {
	
	ApplicationContext ctx=new ClassPathXmlApplicationContext("application-context.xml");
	Student stu=(Student)ctx.getBean("stu");
	System.out.println(stu);
	
	
	
}
}
