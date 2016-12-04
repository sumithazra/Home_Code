

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

/**
 * Created by ARPITHA RAO on 04-02-2016.
 */
public class BinaryTree {
    public static class Node {
        int data;
        Node left;
        Node right;

        Node(int data) {
            this.data = data;
        }
    }

        public Node recursivePreOrder(Node root){
            if(root!= null){
                System.out.print(root.data + " ");
                recursivePreOrder(root.left);
                recursivePreOrder(root.right);

            }
           return root;
        }

        public void PreOrderIter(Node root){

            if(root== null) return;

            Stack<Node> newStack = new Stack<>();

            if(root!= null) newStack.push(root);

            while(!newStack.empty()){

                Node n = newStack.pop();
                System.out.print(n.data + " ");

                if(n.right!= null) newStack.push(n.right);

                if(n.left != null) newStack.push(n.left);

            }

        }

    public static Node postOrderrecursive(Node root){
        Stack<Node> newStack = new Stack<>();
        if(root!= null)
            if(root!= null) newStack.push(root);

            while(!newStack.empty()){
                Node n = newStack.pop();
            if(n.left != null) postOrderrecursive(root.left);
            if(n.right!= null) postOrderrecursive(root.right);
                System.out.print(n.data + " ");

        }
        return root;
    }

    public static void PostOrderIter(Node root){

      if(root==null) return;

        Stack<Node> s = new Stack<>();
        Node current = root;

        while(true){
            if(current != null){
                if(current.right != null)
                    s.push(current.right);
                s.push(current);
                current = current.left;
                continue;

            }
            if(s.isEmpty()) return;
                current = s.pop();
            if(current.right!= null && !s.isEmpty() && current.right == s.peek() ){
                s.pop();
                s.push(current);
                current = current.right;

            }  else {
                System.out.print(current.data+" ");
                current=null;
            }
        }
    }

    public static Node InOrderRecursive(Node root){
        if(root == null) return null;

        InOrderRecursive(root.left);
        System.out.print(root.data+" ");
        InOrderRecursive(root.right);

        return root;

    }

    public static void InOrderIter(Node root){
        if(root== null) return;

        Stack<Node> s = new Stack<>();
        Node current = root;

        while(!s.isEmpty() || current!= null){
            if(current!= null) {
                s.push(current);
                current = current.left;
            }
            else {
                Node n = s.pop();
                System.out.printf("%d ",n.data);
                current = n.right;
            }
        }

    }

    public static void LevelOrderTraversal(Node startNode){
        Queue<Node> queue = new LinkedList<>();
        queue.add(startNode);

        while (!queue.isEmpty()){
            Node temp = queue.poll();
            System.out.print(temp.data+" ");
            if(temp.left!= null) queue.add(temp.left);
            if(temp.right!= null) queue.add(temp.right);

        }
    }

    public static void SpiralOrZigzagTravrsal(Node root) {
        if (root == null) return;
        Stack<Node> s = new Stack<>();
        s.push(root);
        boolean directionflag = false;

        while (!s.isEmpty()) {
            Stack<Node> temp = new Stack<>();

            while (!s.isEmpty()) {
                Node n = s.pop();
                System.out.print(n.data+" ");

                if (!directionflag) {
                    if (n.left != null) {
                        temp.push(n.left);
                    }
                    if (n.right != null) {
                        temp.push(n.right);
                    }

                } else {

                    if (n.right != null) {
                        temp.push(n.right);
                    }
                    if (n.left != null) {
                        temp.push(n.left);
                    }
                }
            }
            directionflag = !directionflag;
            s = temp;
        }
    }

    public static void PrintLeafNodes(Node root){
        if(root == null) return;
        if(root.right == null && root.left == null){
            System.out.print(root.data+" ");
        }
        PrintLeafNodes(root.left);
        PrintLeafNodes(root.right);
    }

    public static int getLeafCountofBinaryTree(Node node){
        if(node == null)
            return 0;
        if(node.left ==null && node.right==null)
            return 1;
        else
            return getLeafCountofBinaryTree(node.left)+ getLeafCountofBinaryTree(node.right);

    }

    public static void PrintAllPathtoLeaves(Node node, int[] path, int length){
        if(node == null) return;

        path[length] = node.data;
        length++;

        if(node.left== null && node.right == null){
                for (int i = 0; i < length; i++) {
                    System.out.print(" "+path[i]);
                }
                System.out.println();

            }
            PrintAllPathtoLeaves(node.left, path, length);
            PrintAllPathtoLeaves(node.right, path, length);
        }

    public static int LevelofNode(Node node, int key, int level){
        if(node == null) return 0;

        if(node.data == key) return level;
        int result = LevelofNode(node.left, key, level+1);

        if(result != 0) return result;

        result = LevelofNode(node.right, key, level + 1);
        return result;

    }
    static int max_level = 0;

   public static void rightviewofTree(Node root, int level){
       if(root == null) return;
       if(max_level >= level){
           System.out.print(" "+root.data);
           max_level = level;
       }
       rightviewofTree(root.right, level + 1);
       rightviewofTree(root.left, level + 1);

   }




    public static void leftviewofTree(Node root, int level){

        if(root== null) return;
        if(max_level < level){
            System.out.print(" "+root.data);
            max_level = level;
        }
        leftviewofTree(root.left, level + 1);
        leftviewofTree(root.right, level + 1);

    }
        public static void main(String args[]){

            BinaryTree bt = new BinaryTree();
            Node root = createBinaryTree();
            System.out.println("PreOrder Recursive Solution");
            bt.recursivePreOrder(root);
            System.out.println();
            System.out.println("--------------------------------");
            System.out.println("PreOrder Iterative Solution");
            bt.PreOrderIter(root);


            System.out.println();
            System.out.println("--------------------------------");
            System.out.println();


            System.out.println("PostOrder Recursive Solution");
            bt.postOrderrecursive(root);
            System.out.println();
            System.out.println("--------------------------------");
            System.out.println("PostOrder Iterative Solution");
            bt.PostOrderIter(root);

            System.out.println();
            System.out.println("--------------------------------");
            System.out.println();


            System.out.println("InOrder Recursive Solution");
            bt.InOrderRecursive(root);
            System.out.println();
            System.out.println("--------------------------------");
            System.out.println("InOrder Iterative Solution");
            bt.InOrderIter(root);

            System.out.println();
            System.out.println("--------------------------------");
            System.out.println();


            System.out.println("Level Order Traversal");
            bt.LevelOrderTraversal(root);
            System.out.println();

            System.out.println();
            System.out.println("--------------------------------");
            System.out.println();


            System.out.println("Spiral or Zigzag Traversal");
            bt.SpiralOrZigzagTravrsal(root);
            System.out.println();

            System.out.println();
            System.out.println("--------------------------------");
            System.out.println();


            System.out.println("Printing Leaf Nodes");
            bt.PrintLeafNodes(root);
            System.out.println();

            System.out.println();
            System.out.println("--------------------------------");
            System.out.println();

            System.out.println("Number of Nodes in the binary tree "+bt.getLeafCountofBinaryTree(root));


            System.out.println();
            System.out.println("--------------------------------");
            System.out.println();

            System.out.println("All paths to leaves: ");
            bt.PrintAllPathtoLeaves(root, new int[1000], 0);

            System.out.println("Level of Node in the binary tree " + bt.LevelofNode(root, 60, 1));

            leftviewofTree(root, 1);
            rightviewofTree(root, 1);

            }

        public static Node createBinaryTree(){
            Node root = new Node(40);
            Node node10 = new Node(10);
            Node node20 = new Node(20);
            Node node30 = new Node(30);
            Node node50 = new Node(50);
            Node node60 = new Node(60);
            Node node70 = new Node(70);
             node70.equals(node60);
            root.left = node20;
            root.right = node60;

            node20.left = node10;
            node20.right = node30;

            node60.left = node50;
            node60.right = node70;

            return root;

        }
   }