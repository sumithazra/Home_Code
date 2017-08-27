package heap;

import java.util.Arrays;

class Node {
    int element; // The element to be stored
    int i; // index of the row from which the element is taken
    int j; // index of the next element to be picked from row
    
	public Node(int element, int i, int j) {
		this.element = element;
		this.i = i;
		this.j = j;
	}
	
	public String toString() 
	{
		return Integer.toString(element);
	}
}
 
class MinHeap {
	int capacity;
	Node arr[];
	int size;
 
	public MinHeap(Node[] arr) {
		this.capacity = arr.length;
		this.size = this.capacity;
		this.arr = arr;
		buildMinHeap();
	}
 
	public String toString () {
		return Arrays.toString(this.arr);
		
	}
	void swap(Node[] arr, int i, int j) {
		Node temp = arr[i];
		arr[i] = arr[j];
		arr[j] = temp;
	}
 
	int parent(int i) {
		return (i-1)/2;
	}
 
	int left(int i) {
		return 2*i + 1;
	}
 
	int right(int i) {
		return 2*i + 2;
	}
 
	Node getMin() {
		if(size <= 0) {
			System.out.println("Heap underflow");
			return null;
		}
		return arr[0];
	}
 
	Node extractMin() {
		if(size <= 0) {
			System.out.println("Heap underflow");
			return null;
		}
		if(size == 1) {
			size--;
			return arr[0];
		}
 
		Node root = arr[0];
		arr[0] = arr[size-1];
		size--;
		minHeapify(0);
 
		return root;
	}
 
	void minHeapify(int i) {
		int l = left(i);
		int r = right(i);
		int smallest = i;
 
		if(l < size && arr[l].element < arr[smallest].element)
			smallest = l;
		if(r < size && arr[r].element < arr[smallest].element)
			smallest = r;
		if(smallest != i) {
			swap(arr,i,smallest);
			minHeapify(smallest);
		}
	}
 
	void buildMinHeap() {
		int n = arr.length;
		for(int i = (n/2)-1;i>=0;i--)
			minHeapify(i);
	}
 
	void replaceMin(Node root) {
		arr[0] = root;
		minHeapify(0);
	}
 
	void printMinHeap() {
		for(int i=0;i<size;i++)
			System.out.print(arr[i].element + " ");
		System.out.println();
	}
}
 
class PrintAllElementsInSortedOrderFromRowAndColumnWiseSortedMatrix {
	static final int N = 4;
 
	static void printAllElementsInSortedOrderFromRowAndColumnWiseSortedMatrix(int[][] arr) {
		int k = arr.length;
		Node[] hArr = new Node[k];
		int resultSize = 0;
 
		for(int i=0;i<arr.length;i++) {
			Node node = new Node(arr[i][0],i,1);
			hArr[i] = node;
			resultSize += arr[i].length;
		}
 
		MinHeap mh = new MinHeap(hArr);
 
		for(int c=0;c<resultSize;c++) {
			Node root = mh.getMin();
 
			System.out.print(root.element + " ");
 
			if(root.j < arr[root.i].length) {
				root.element = arr[root.i][root.j];
				root.j++;
			}
			else
				root.element = Integer.MAX_VALUE;
 
			mh.replaceMin(root);
		}
	}
 
	static void printMatrix(int[][] arr) {
		for(int i=0;i<arr.length;i++) {
			for(int j=0;j<arr[i].length;j++)
				System.out.print(arr[i][j] + " ");
			System.out.println();
		}
	}
 
	public static void main(String[] args) {
		int[][] arr= {{10, 20, 25, 30, 40},
                    {15, 25, 35, 37, 40, 45},
                    {27, 29, 37, 39, 48},
                    {32, 33, 39, 46, 48, 49, 50},};
 
		System.out.println("Matrix:");
		printMatrix(arr);
 
		System.out.println();
		printAllElementsInSortedOrderFromRowAndColumnWiseSortedMatrix(arr);
		System.out.println();
	}
}