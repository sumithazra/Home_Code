package tree;

public class LevelOrderTraversing {

	class Node {
		int data;
		Node left, right;

		Node(int value) {
			this.data = value;
			left = right = null;
		}
	}

	class BinaryTree {

		Node root;

		BinaryTree() {
			root = null;
		}

		public void printlevelOrderTraversing() {
			int h = height(root);
			int i;
			for (i = 0; i < h; i++) {
				printGivenLevel(root, i);
			}
		}

		void printGivenLevel(Node root, int level) {

			if (root == null) {
				return;
			}
			if (level == 0) {
				System.out.println(root.data);
			}
			if (level > 0) {
				printGivenLevel(root.left, level - 1);
				printGivenLevel(root.right, level - 1);
			}
		}

		/*
		 * Compute the "height" of a tree -- the number of nodes along the
		 * longest path from the root node down to the farthest leaf node.
		 */
		int height(Node root) {
			if (root == null)
				return 0;
			else {
				/* compute height of each subtree */
				int lheight = height(root.left);
				int rheight = height(root.right);

				/* use the larger one */
				if (lheight > rheight)
					return (lheight + 1);
				else
					return (rheight + 1);
			}
		}
	}

	/* Driver program to test above functions */
	public static void main(String args[]) {
		LevelOrderTraversing LOT = new LevelOrderTraversing();
		BinaryTree tree = LOT.new BinaryTree();
		tree.root = LOT.new Node(1);
		tree.root.left = LOT.new Node(2);
		tree.root.right = LOT.new Node(3);
		tree.root.left.left = LOT.new Node(4);
		tree.root.left.right = LOT.new Node(5);

		System.out.println("Level order traversal of binary tree is ");
		tree.printlevelOrderTraversing();
	}
}
