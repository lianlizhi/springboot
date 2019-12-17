import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import javax.management.Query;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			/**
			 * Queue<Object> queue =  new LinkedList<>();
				boolean flag = queue.offer(11);
			System.out.println(flag);
			Object poll = queue.poll();
			System.out.println(poll);
			*/

		
		
		List<Object> list = Arrays.asList("a","b","c");
		//List<Object> list = new ArrayList<Object>(Arrays.asList("a","b","c")) ;
		
		
		Iterator<Object> iterator = list.iterator();
		while (iterator.hasNext()) {
			Object object = (Object) iterator.next();
			if(object.equals("a")) {
				iterator.remove();
			}
			
		}
		
		
		System.out.println(list);
		
		
	}

}
