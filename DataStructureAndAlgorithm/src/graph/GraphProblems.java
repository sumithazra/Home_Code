package graph;

import java.util.*;


class GraphProblems{

	public static void main(String[] args) {
		
		int V = 5;

		Graph graph = new Graph(V);
		graph.addEdge(0, 1);
	    graph.addEdge(0, 4);
	    graph.addEdge(1, 2);
	    graph.addEdge(1, 3);
	    graph.addEdge(1, 4);
	    graph.addEdge(2, 3);
	    graph.addEdge(3, 4);

	    graph.printGraph();
	}
	
}

class AdjNode{
	public int data;
	public AdjNode nextNode;
}

class Graph{

	public int V;
	public AdjNode[] adjList;

	public Graph(int V){
		this.V = V;
		this.adjList = new AdjNode[V];
	}

	public void addEdge(int u, int v)
	{
		// update Adjlist

		AdjNode node = new AdjNode();
		node.data = v;
		node.nextNode = adjList[u];
		adjList[u] = node;

		AdjNode node_v = new AdjNode();
		node_v.data = u;
		node_v.nextNode = adjList[v];
		adjList[v] = node_v;
	}

	public void printGraph()
	{
		System.out.println("---------------------------------------------------------");
		System.out.println("adjList : ");

		for (int i=0; i<V ; i++) {

			AdjNode temp = adjList[i];
			System.out.print(i);
			System.out.print(" -> ");
			while(temp!=null)
			{
				System.out.print(temp.data);
				System.out.print(" -> ");
				temp = temp.nextNode;
			}
			System.out.println("null");	
		}
	}
}