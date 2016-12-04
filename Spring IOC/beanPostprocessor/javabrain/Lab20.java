package javabrain;
import org.springframework.context.support.*;

public class Lab20 {
public static void main(String[] args){
AbstractApplicationContext ctx=	new ClassPathXmlApplicationContext("application-context.xml");
System.out.println("Spring container is Ready");
System.out.println("----------");
Hello hello=(Hello)ctx.getBean("HELLO");
hello.show();
System.out.println("-----------");
System.out.println("Spring Container is going to ShoutDown..");
ctx.registerShutdownHook();
}}


	 

