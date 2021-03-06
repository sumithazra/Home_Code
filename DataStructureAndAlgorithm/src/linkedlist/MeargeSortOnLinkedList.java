package linkedlist;

public class MeargeSortOnLinkedList {

	public static void main(String[] args) {

		LinkedListM lm = new LinkedListM();
		lm.insert(14);
		lm.insert(65);
		lm.insert(50);
		lm.insert(40);
		lm.insert(60);

		LinkedListM.Node node=lm.meargeSort(lm.head);
		lm.printList(node);
		
	}
	
	
}

class LinkedListM {

	Node head;
	
	static class Node {

		int data;
		Node next;

		Node(int data) {
			this.data = data;
			next = null;
		}

	}

	void insert(int data) {
		if (head == null) {
			head = new Node(data);

		} else {
			Node temp = new Node(data);
			head.next = temp;

		}
	}

	 Node meargeSort(LinkedListM.Node node) {

		if (node == null || node.next == null) {
			return  node;
		} 

			Node firstOfMiddle = node;
			Node middle = findMiddle(node);
			Node nextOfMiddle = middle.next;
			middle.next = null;

			
			Node first=meargeSort(firstOfMiddle);
			Node second=meargeSort(nextOfMiddle);
			Node sortedList=meargeList(first,second);
		
		return sortedList;

	}

	 Node findMiddle(Node startNode) {
		/*if (node == null || node.next == null) {
			return node;
		} else {
			Node middle = node;
			Node current = node;
			int length = 0;
			while (current.next != null) {
				length++;
				if (length % 2 == 0) {
					middle = middle.next;
				}
				current = current.next;
			}
			if (length % 2 == 1) {
				middle = middle.next;
			}

			return middle;
		}*/
		 
		 if(startNode==null){
			   return startNode;
			  }
			 
			  Node pointer1=startNode;
			  Node pointer2=startNode;
			   
			  while(pointer2!=null && pointer2.next!=null && pointer2.next.next!=null){
			   pointer1 = pointer1.next;
			   pointer2 = pointer2.next.next;
			 
			  }
			  return pointer1;
	}

	Node meargeList(Node leftNode, Node rightNode) {

		if (leftNode == null) {
			return rightNode;
		}
		if (rightNode == null) {
			return leftNode;
		}
		Node temp = null;
		if (leftNode.data < rightNode.data) {
			temp = leftNode;
			temp.next = meargeList(leftNode.next, rightNode);

		} else {
			temp = rightNode;
			temp.next = meargeList(leftNode, rightNode.next);
		}

		return temp;
	}
	void printList(LinkedListM.Node node)
	{
		while(node!=null)
		{
			System.out.println(node.data);
			node=node.next;
		}
	}
	

}