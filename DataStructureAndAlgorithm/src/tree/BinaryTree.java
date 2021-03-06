package tree;

import java.util.*;

public class BinaryTree {

	Node root;

	public static class Node {
		private int data;
		private Node left, right;

		public Node(int item) {
			data = item;
			left = right = null;
		}
	}

	public BinaryTree() {
		root = null;
	}

	public void inOrderIT(Node root) {
		if (root == null)
			return;

		Stack<Node> s = new Stack<Node>();
		Node n = root;
		while (true) {
			while (n != null) {
				s.push(n);
				n = n.left;

			}
			if (s.isEmpty())
				break;
			n = s.pop();
			System.out.print(n.data);
			System.out.print(" ");
			n = n.right;

		}

	}

	/* Level order traversal from top to bottom */
	public void levelOrder(Node root) {
		if (root == null)
			return;
		Node n = root;
		Queue<Node> Q = new LinkedList<Node>();
		Q.add(n);
		int count=1;
		while (!Q.isEmpty()) {
			Node temp = Q.poll();
			count--;
			System.out.print(temp.data + " ");
			if (temp.left != null) {
				Q.add(temp.left);
			}
			if (temp.right != null) {
				Q.add(temp.right);
			}
			if(count ==0){
			count = Q.size();	
			System.out.println("");
			}
		}

	}

	/* Level order traversal from bottom to top */
	public void levelOrderTraversalInReverse(Node root) {
		if (root == null)
			return;
		Node n = root;
		Stack<Node> S = new Stack<Node>();
		Queue<Node> Q = new LinkedList<Node>();

		Q.add(n);
		while (!Q.isEmpty()) {
			Node temp = Q.poll();
			if (temp.left != null) {
				Q.add(temp.left);
			}
			if (temp.right != null) {
				Q.add(temp.right);
			}

			S.push(temp);
		}
		while (!S.isEmpty()) {
			System.out.print(S.pop().data + " ");
		}

	}

	public int hightOfBinaryTree(Node root) {

		int lefthight, righthight;
		if (root == null)
			return 0;
		else {
			lefthight = hightOfBinaryTree(root.left);
			righthight = hightOfBinaryTree(root.right);

			if (lefthight > righthight) {
				return (lefthight + 1);

			} else {
				return (righthight + 1);
			}

		}

	}

	
	void mirror()
    {
        root = mirror(root);
    }
 
    Node mirror(Node node)
    {
        if (node == null)
            return node;
 
        /* do the subtrees */
        Node left = mirror(node.left);
        Node right = mirror(node.right);
 
        /* swap the left and right pointers */
        node.left = right;
        node.right = left;
 
        return node;
    }

	public static void main(String[] args) {
		BinaryTree bt = new BinaryTree();
		Node root = createBinaryTree();
		/*
		 * Let us create following BST 40 / \ 20 60 / \ / \ 10 30 50 70
		 */
		System.out.print("inOder Iterator traversal ::");
		bt.inOrderIT(root);
		System.out.println("\n"
				+ "***********************************************");
		System.out.print("levelOder traversal ::");
		bt.levelOrder(root);
		System.out.println("\n"
				+ "***********************************************");
		System.out
				.print("LevelOrder traversal in reverse order Iterator traversal ::");
		bt.levelOrderTraversalInReverse(root);
		System.out.println("\n"
				+ "***********************************************");
		System.out.print("Hight of BinaryTree ::");
		System.out.println(bt.hightOfBinaryTree(root));
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
}
