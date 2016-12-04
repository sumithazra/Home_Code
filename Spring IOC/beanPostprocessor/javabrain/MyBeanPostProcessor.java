package javabrain;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;

public class MyBeanPostProcessor implements BeanPostProcessor{
	public Object postProcessBeforeInitialization(Object obj,String bname)throws BeansException{
		System.out.println("postProcessBeforeInitialization:"+bname);
		return obj;
	}
	public Object postProcessAfterInitialization(Object obj,String bname)throws BeansException{
		System.out.println("postProcessAfterInitialization:"+bname);
		return obj;
		
	}
	
} 
