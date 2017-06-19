package tree;

import java.io.*;

//A Java program for in-place conversion of Binary Tree to DLL

//A binary tree node has data, left pointers and right pointers
class NewNode 
{
int data;
NewNode left, right;

public NewNode(int data) 
{
   this.data = data;
   left = right = null;
}
}

public class MyTreeToCDLL 
{
NewNode root;
 
// head --> Pointer to head node of created doubly linked list
NewNode head;
NewNode tail;

 
// Initialize previously visited node as NULL. This is
// static so that the same value is accessible in all recursive
// calls
static NewNode prev = null;

// A simple recursive function to convert a given Binary tree 
// to Doubly Linked List
// root --> Root of Binary Tree
void BinaryTree2DoubleLinkedList(NewNode root) 
{
   // Base case
   if (root == null)
       return;

   // Recursively convert left subtree
   BinaryTree2DoubleLinkedList(root.left);

   // Now convert this node
   if (prev == null) 
       head = root;
   else
   {
       root.left = prev;
       prev.right = root;
   }
   prev = root;

   // Finally convert right subtree
   BinaryTree2DoubleLinkedList(root.right);
   
   if (root != null && root.right==null) 
       tail = root;
}


void printCDLL(NewNode node)
{
	 NewNode head=node;
  do
   {
       System.out.print(node.data + " ");
        node = node.right;
   }while (node.data != head.data) ;
}

// Driver program to test above functions
public static void main(String[] args) 
{
   // Let us create the tree as shown in above diagram
   MyTreeToCDLL tree = new MyTreeToCDLL();
   tree.root = new NewNode(10);
   tree.root.left = new NewNode(12);
   tree.root.right = new NewNode(15);
   tree.root.left.left = new NewNode(25);
   tree.root.left.right = new NewNode(30);
   tree.root.right.left = new NewNode(36);

   // convert to DLL
   tree.BinaryTree2DoubleLinkedList(tree.root);
     
   
   tree.tail.right=tree.head;
   tree.head.left=tree.tail;
   
   // Print the converted List
   tree.printCDLL(tree.head);
   

}
}