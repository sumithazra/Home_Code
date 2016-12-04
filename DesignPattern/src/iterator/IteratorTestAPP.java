package iterator;

public class IteratorTestAPP {

	public static void main(String[] args) {
		Mobile micromax=new Mobile(MobileOSType.ANDROID,"2 GB");
		Mobile lumia930= new Mobile(MobileOSType.WINDOWS,"1 GB");
		Mobile iphone6=new Mobile(MobileOSType.IOS,"1 GB");
		
		MobileCollectionImpl mocll=new MobileCollectionImpl();
		mocll.add(micromax);
		mocll.add(lumia930);
		mocll.add(iphone6);
		
		MobileIterator it=mocll.iterator();
		
		//System.out.println(it.getClass().getName());
		
		while(it.hasNext())
		{
			System.out.println(it.next());
		}
		
	}
	
}
