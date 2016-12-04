package searchingsorting;

public class InsertionSort {

	static void sort(int[] arr) {

		for (int i = 0; i < arr.length; i++) {

			for (int j = i + 1; j < arr.length; j++) {

				if (arr[i] > arr[j]) {
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;

				}

			}

		}

		//return arr;
	}
	
	
	/* A utility function to print array of size n*/
    static void printArray(int arr[])
    {
        int n = arr.length;
        for (int i=0; i<n; ++i)
            System.out.print(arr[i] + " ");
 
        System.out.println();
    }

	public static void main(String[] args) {
		int[] array = { 2, 4, 8, 5, 0, 9 };
		sort(array);
		printArray(array);
	}

}
