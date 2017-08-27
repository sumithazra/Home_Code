package graph;

import java.util.*;

class GraphUsingHashMap {

	HashMap<Integer, List<Integer>> adj;

	GraphUsingHashMap() {

		adj = new HashMap<Integer, List<Integer>>();
	}

	/*
	 * This method defines edges in a Directed Graph
	 */
	void setEdge(int org, int dest) {

		if (adj.containsKey(org)) {

			List<Integer> list = adj.get(org);
			list.add(dest);
			adj.put(org, list);
		}

		else {

			ArrayList<Integer> list = new ArrayList<Integer>();
			list.add(dest);
			adj.put(org, list);
		}
	}

	boolean isNeighbour(int org, int dest) {

		if (!adj.containsKey(org)) {
			return false;
		}

		for (Integer i : adj.get(org)) {

			if (i == dest) {
				return true;
			}
		}

		return false;
	}

	void removeEdge(int org, int dest) {

		if (!adj.containsKey(org)) {
			System.out.println("Error.Enter a valid vertex");
		}

		else {

			Iterator<Integer> it = adj.get(org).iterator();
			while (it.hasNext()) {
				int ele = it.next();
				if (ele == dest) {
					it.remove();
				}
			}
		}
	}

	void printGraph() {
		for (Integer i : adj.keySet()) {
			List<Integer> list = adj.get(i);
			System.out.println("Key - " + i + "---> " + list);
		}
	}

	public void DFS(int vertex) {
		HashSet<Integer> hs = new HashSet<Integer>();
		DFS(vertex, hs);
		Iterator<Integer> itr = hs.iterator();
		System.out.println("After DFS traversal ::");
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
	}

	private void DFS(int vertex, HashSet<Integer> visited) {
		if (visited.contains(vertex))
			return;

		visited.add(vertex);
		Iterator<Integer> it = adj.get(vertex).iterator();
		while (it.hasNext()) {
			int ele = it.next();
			DFS(ele, visited);
		}
	}

	public void BFS(int vertex) {
		HashSet<Integer> hs = new HashSet<Integer>();
		BFS(vertex, hs);
		System.out.println("After BFS traversal ::");
		Iterator<Integer> itr = hs.iterator();
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}

	}

	private void BFS(int vertex, HashSet<Integer> visited) {
		Queue<Integer> q = new LinkedList<Integer>();
		visited.add(vertex);
		q.add(vertex);
		while (!q.isEmpty()) {
			int u = q.poll();
			Iterator<Integer> it = adj.get(u).iterator();
			while (it.hasNext()) {
				int ele = it.next();
				if (!visited.contains(ele)) {
					q.add(ele);
					visited.add(ele);
				}
			}
		}
	}

	public static void main(String args[]) {

		GraphUsingHashMap g = new GraphUsingHashMap();
		g.setEdge(0, 1);
		g.setEdge(0, 2);
		g.setEdge(0, 3);
		g.setEdge(1, 2);
		g.setEdge(1, 0);
		g.setEdge(2, 0);
		g.setEdge(2, 1);
		g.setEdge(3, 0);
		g.setEdge(3, 4);
		g.setEdge(4, 3);

		g.printGraph();

		System.out.println("-------------------");

		g.DFS(0);

		System.out.println("-------------------");

		g.BFS(0);

		/*
		 * g.removeEdge(0, 2); g.printGraph(); System.out.println(g.isNeighbour(0, 2));
		 */
	}

}