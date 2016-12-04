package javabrain;
import javax.annotation.*;
import org.springframework.beans.*;
import org.springframework.beans.factory.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.*;

public class Hello implements DisposableBean,BeanNameAware,
BeanFactoryAware,ApplicationContextAware{
	
	int x;
	String str;
	String msg;
	String bname;
	
	@Autowired
	A aobj;
	B bobj;
	
	ApplicationContext ctx1;
	BeanFactory factory1;
	
	@Autowired
	ApplicationContext ctx2;
	@Autowired
	BeanFactory factory2;
	static{
		System.out.println("Hello-S.B");
	}
	public Hello(int x){
		System.out.println("Hello-(int x)");
		this.x=x;
	}
	public void setStr(String str){
		System.out.println("Hello-setStr()");
		System.out.println(aobj);
		System.out.println(bobj);
	    this.str=str;
	}
	public void setBobj(B bobj){
		System.out.println("Hell setbobj()");
		this.bobj=bobj;
	}
	
	@PostConstruct
	public void init1(){
		System.out.println("Hello init1()");
		msg="Welcome to jlc";
		if(str==null){
			str="Hai Guys";
		}
		}
		@PostConstruct
		public void init2(){
			System.out.println("Hello init2()");
			msg="Welcome to jlc";
			if(str==null){
				str="Hai Guys";
			}
	}
	public void afterPropertySet() throws Exception{
		System.out.println("Hello- afterPropertiesSet()");
		msg="Welcome to jlc";
		if(str==null){
			str="Hai Guys";
		
		}
	}
	public void myInit(){
		System.out.println("Hello-myInit()");
		msg="Welcome to jlc";
		if(str==null){
			str="Hai Guys";
			
		}
		
	}
	public void setBeanName(String bname){
		System.out.println("Hello setBeanName()");
		this.bname=bname;
	}
	public void setBeanFactory(BeanFactory factory1){
		System.out.println("Hello-setBeanFactory()");
		this.factory1=factory1;
		
	}
	public void setApplicationContext(ApplicationContext ctx1){
		System.out.println("Hello-setApplocationContext()");
		this.ctx1=ctx1;
		
	}
	@PreDestroy
	public void cleanup(){
		System.out.println("hello-cleanup");
		
	}
	public void destroy() throws Exception{
		System.out.println("hello- destroy()");
	}
	public void mycleanup(){
		System.out.println("hello-mycleanup()");
	}
	
	public void show(){
		System.out.println("hello=show()");
		System.out.println(x);
		System.out.println(str);
		System.out.println(msg);
		System.out.println("Bean name is "+bname);
		System.out.println(factory1);
		System.out.println(ctx1);
		System.out.println(factory2);
		System.out.println(ctx2);
		System.out.println(ctx1=ctx2);
		System.out.println(factory1=factory2);
		
		
	}
	
	
}