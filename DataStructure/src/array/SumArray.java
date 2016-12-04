package array;

public class SumArray {
public static void main(String[] args) {
	
	int arr1[]={1,3,4, 5, 6};
	int arr2[]={2,4,5,6,7,8};
	
	int arr3[]=new int[13];
	int l1=arr1.length;
	int l2=arr2.length;

	
	int k = 0;
    for (int i = 0; i < arr1.length; i++) {
        int sum = arr1[i] +arr2[i];
        int a =sum;
        if(a>9)
        {
           String s = Integer.toString(a);
            System.out.println(s);
            for (int j = 0; j < s.length(); j++) {
                
                arr3[k]  = Integer.parseInt(s.substring(j, j+1));
                System.out.println(arr3[k]);
                k++;
            }
        }
        else
        {
            arr3[k] = sum;
            System.out.println("runing else");
            System.out.println(arr3[k]);
            k++;
        }
    }
    System.out.println("final output");
    for (int i = 0; i <k; i++) {
        System.out.print("{" +arr3[i]+ "}");
    }
}
	

}
