package tree;

import tree.BinaryTree.Node;

/**
 * Morris inorder/preorder traversals
 *
 * Time complexity O(n)
 * Space complexity O(1)
 */

public class MorrisTraversal {

	public static class Node {
		private int data;
		private Node left, right;

		public Node(int item) {
			data = item;
			left = right = null;
		}
	}
    public void inorder(Node root) {
    Node current = root;
    while(current != null) {
        //left is null then print the node and go to right
        if (current.left == null) {
            System.out.print(current.data + " ");
            current = current.right;
        }
        else {
            //find the predecessor.
            Node predecessor = current.left;
            //To find predecessor keep going right till right node is not null or right node is not current.
            while(predecessor.right != current && predecessor.right != null){
                predecessor = predecessor.right;
            }
            //if right node is null then go left after establishing link from predecessor to current.
            if(predecessor.right == null){
                predecessor.right = current;
                current = current.left;
            }else{ //left is already visit. Go rigth after visiting current.
                predecessor.right = null;
                System.out.print(current.data + " ");
                current = current.right;
            }
        }
    }
}

public void preorder(Node root) {
    Node current = root;
    while (current != null) {
        if(current.left == null) {
            System.out.print(current.data + " ");
            current = current.right;
        }
        else {
            Node predecessor = current.left;
            while(predecessor.right != current && predecessor.right != null) {
                predecessor = predecessor.right;
            }
            if(predecessor.right == null){
                predecessor.right = current;
                System.out.print(current.data + " ");
                current = current.left;
            }else{
                predecessor.right = null;
                current = current.right;
            }
        }
    }
}

public static Node createBinaryTree() {
	Node root = new Node(40);
	Node node10 = new Node(10);
	Node node20 = new Node(20);
	Node node30 = new Node(30);
	Node node50 = new Node(50);
	Node node60 = new Node(60);
	Node node70 = new Node(70);

	root.left = node20;
	root.right = node60;

	node20.left = node10;
	node20.right = node30;

	node60.left = node50;
	node60.right = node70;

	return root;

}

public static void main(String args[]) {
    BinaryTree bt = new BinaryTree();
   /* Node root = null;
    root = bt.addNode(10, root);
    root = bt.addNode(50, root);
    root = bt.addNode(-10, root);
    root = bt.addNode(7, root);
    root = bt.addNode(9, root);
    root = bt.addNode(-20, root);
    root = bt.addNode(30, root);*/
    
    Node root = createBinaryTree();
    MorrisTraversal mt = new MorrisTraversal();
    mt.inorder(root);
    System.out.println();
    mt.preorder(root);
}
}
