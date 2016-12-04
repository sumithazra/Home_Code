package array;

public class ArrayProgram {

	
	static void findMax(int[] arr)
	{
		int max=Integer.MIN_VALUE;
		for (int i = 0; i < arr.length; i++) {
			if(max<arr[i])
			{
				max=arr[i];
				
			}
		}
		
		System.out.println(max);
	}
	
	static void print2Smallest(int arr[])
    {
        int first, second, arr_size = arr.length;
 
        /* There should be atleast two elements */
        if (arr_size < 2)
        {
            System.out.println(" Invalid Input ");
            return;
        }
 
        first = second = Integer.MAX_VALUE;
        for (int i = 0; i < arr_size ; i ++)
        {
            /* If current element is smaller than first
              then update both first and second */
            if (arr[i] < first)
            {
                second = first;
                first = arr[i];
            }
 
            /* If arr[i] is in between first and second
               then update second  */
        //    else if (arr[i] < second && arr[i] != first)
            //    second = arr[i];
        }
        if (second == Integer.MAX_VALUE)
            System.out.println("There is no second" +
                               "smallest element");
        else
            System.out.println("The smallest element is " +
                               first + " and second Smallest" +
                               " element is " + second);
    }
	
	static void findMaxMin(int[] arr)
	{
		
		int max=Integer.MIN_VALUE;
		int min=Integer.MAX_VALUE;
		
		for (int i = 0; i < arr.length; i++) {
			
			if(max<arr[i])
			{
				max=arr[i];
			}
			
			if(min>arr[i])
			{
				min=arr[i];
			}
		}
		
		System.out.printf("Max :%d , Min :%d %n", max, min);
		
	}
	
	
	public static void main(String[] args) {
		
		int[] arr={32,5,81,2,7,18,0,45};
		ArrayProgram.findMax(arr);
		ArrayProgram.findMaxMin(arr);
		ArrayProgram.print2Smallest(arr);
	}
	
}
