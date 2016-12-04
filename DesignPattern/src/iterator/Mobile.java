package iterator;

import java.util.*;

public class Mobile{

	MobileOSType os_type;
	String ram;
	
	public Mobile(MobileOSType os_type,String ram) {
		this.os_type=os_type;
		this.ram=ram;
				
	}
	
	public String toString()
	{
		return "Mobile OS Type:"+ os_type + "RAM :"+ram;
		
	}
	
}
