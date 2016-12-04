import java.util.*;

public class StackDemo {

   static void showpush(Stack st, int a) {
      st.push(new Integer(a));
      System.out.println("push(" + a + ")");
      System.out.println("stack: " + st);
   }

   static void showpop(Stack st) {
      System.out.print("pop -> ");
      Integer a = (Integer) st.pop();
      System.out.println(a);
      System.out.println("stack: " + st);
   }

   public static void main(String args[]) {
      Stack st = new Stack();
      /*System.out.println("stack: " + st);
      showpush(st, 42);
      showpush(st, 66);
      showpush(st, 99);
      showpop(st);
      showpop(st);
      showpop(st);*/
      
      st.push(7);
      st.push(5);
      st.push(2);
      
      Iterator itr = st.iterator();
      
      while(itr.hasNext())
      {
    	  Integer s = (Integer)itr.next();
    	  System.out.println(s);
      }
      System.out.println(15 >> 1);
      System.out.println("Pop = "+st.pop());
      Collections.sort(st);
      
      itr = st.iterator();
      
      while(itr.hasNext())
      {
    	  Integer s = (Integer)itr.next();
    	  System.out.println(s);
      }
      System.out.println("Pop = "+st.pop());
      /*try {
         showpop(st);
      } catch (EmptyStackException e) {
         System.out.println("empty stack");
      }*/
   }
}