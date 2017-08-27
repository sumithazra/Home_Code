package heap;

class Heap {

    public static void main(String args[])
    {
        print();
    }

    public static void print() 
    {
        int mat[][] ={  {10, 20, 33, 40},
                        {22, 23, 35, 45},
                        {24, 29, 37, 48},
                        {32, 33, 39, 50},
                     };

        kthSmallest(mat, 4);
    }

    public static void kthSmallest(int[][] mat, int n) 
    {
        HeapNode[] nodeArr = new HeapNode[n];
        
        for (int i = 0; i < n; i++) 
        {
            nodeArr[i] = new HeapNode();
            nodeArr[i].data = mat[i][0];
            nodeArr[i].r = i;
            nodeArr[i].c = 0;
        }
        buildHeap(nodeArr, n);

        HeapNode hr = new HeapNode();
        
        for (int i = 0; i < (n*n); i++) 
        {
            hr = new HeapNode(nodeArr[0]);
            int nextVal = (hr.c < (n - 1) ? mat[hr.r][hr.c+1]: Integer.MAX_VALUE);
            nodeArr[0].data = nextVal;
            nodeArr[0].r = hr.r;
            nodeArr[0].c = hr.c + 1;
            
            System.out.println(hr.data + " ");
            minHeapify(nodeArr, 0, n);
        }

    }

    public static void buildHeap(HeapNode[] arr, int n) 
    {
        int i = (n -1)/2;
        while (i >= 0) 
        {
            minHeapify(arr, i, n);
            i--;
        }
    }

    public static void minHeapify(HeapNode arr[], int i, int heap_size) 
    {
        int l = i*2 + 1;
        int r = i*2 + 2;
        int smallest = i;
        
        if (l < heap_size && arr[l].data < arr[i].data)
            smallest = l;
    
        if (r < heap_size && arr[r].data < arr[smallest].data)
            smallest = r;
        
        if (smallest != i ) 
        {
            HeapNode tmp = new HeapNode(arr[i]);
            arr[i] = new HeapNode(arr[smallest]);
            arr[smallest] = new HeapNode(tmp);
            minHeapify(arr, smallest, heap_size);
        }
    }
}

class HeapNode {
    int data, r, c;

    public HeapNode() {
        this.data = data;
        this.r = r;
        this.c = c;
    }

    public HeapNode(HeapNode node) {
        this.data = node.data;
        this.r = node.r;
        this.c = node.c;
    }

    public String toString()
    {
	return String.valueOf(this.data);}
}