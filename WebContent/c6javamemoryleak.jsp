<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

GC removed objects which are no more referenced or objects are no longer being used by 
the application but if the application develops a code  such that 
objects are no longer being used by the application but 
but the Garbage Collector is unable to remove them from working memory since  they are still being referenced.  
If such objects are more in your application and using up memory over a peirod of application runtime then
your project will run out of memeory at one point for creating new objects. 

This is nothing but memory lekage. 

Symptoms of a Memory Leak
Severe performance degradation when the application is continuously running for a long time
OutOfMemoryError heap error in the application
Spontaneous and strange application crashes
The application is occasionally running out of connection objects


Detecting memory leaks can be difficult. A number of tools perform static analysis to 
determine potential leaks they are not 100% accurate . So lets undersand how to prevent 
such leaks in your application. 



If the Java code being developed is meant to run on a server 24 hours a day, then memory leaks become much more significant 
than in the case of our configuration utility. Even the smallest leak in some code that is meant to be continuously run will 
eventually result in the JVM exhausting all of the memory available.

Memory Leak Through static Fields

The first scenario that can cause a potential memory leak is heavy use of static variables.
In Java, static fields have a life that usually matches the entire lifetime of the running application (unless ClassLoader becomes eligible for garbage collection).
Let’s create a simple Java program that populates a static List:


public class StaticTest {
    public static List<Double> list = new ArrayList<>();
 
    public void populateList() {
        for (int i = 0; i < 10000000; i++) {
            list.add(Math.random());
        }
        Log.info("Debug Point 2");
    }
 
    public static void main(String[] args) {
        Log.info("Debug Point 1");
        new StaticTest().populateList();
        Log.info("Debug Point 3");
    }
}


 Now if we analyze the Heap memory during this program execution, then we’ll see that between debug points 1 and 2, as expected, the heap memory increased.
But when we leave the populateList() method at the debug point 3, the heap memory isn’t yet garbage collected

However, in the above program, in line number 2, if we just drop the keyword static, then it will bring a drastic change to the memory usage, this Visual VM response shows:


How to Prevent It?
Minimize the use of static variables
When using singletons, rely upon an implementation that lazily loads the object instead of eagerly loading

Improper equals() and hashCode() Implementations
When defining new classes, a very common oversight is not writing proper overridden methods for equals() and hashCode() methods.
HashSet and HashMap use these methods in many operations, and if they’re not overridden correctly, then they can become a source for potential memory leak problems.
Let’s take an example of a trivial Person class and use it as a key in a HashMap:
1
2
3
4
5
6
7
public class Person {
    public String name;
     
    public Person(String name) {
        this.name = name;
    }
}
Now we’ll insert duplicate Person objects into a Map that uses this key.
Remember that a Map cannot contain duplicate keys:
1
2
3
4
5
6
7
8
@Test
public void givenMap_whenEqualsAndHashCodeNotOverridden_thenMemoryLeak() {
    Map<Person, Integer> map = new HashMap<>();
    for(int i=0; i<100; i++) {
        map.put(new Person("jon"), 1);
    }
    Assert.assertFalse(map.size() == 1);
}
Here we’re using Person as a key. Since Map doesn’t allow duplicate keys, the numerous duplicate Person objects that we’ve inserted as a key shouldn’t increase the memory.
But since we haven’t defined proper equals() method, the duplicate objects pile up and increase the memory

However, if we had overridden the equals() and hashCode() methods properly, then there would only exist one Person object in this Map.
Let’s take a look at proper implementations of equals() and hashCode() for our Person class:
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
public class Person {
    public String name;
     
    public Person(String name) {
        this.name = name;
    }
     
    @Override
    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof Person)) {
            return false;
        }
        Person person = (Person) o;
        return person.name.equals(name);
    }
     
    @Override
    public int hashCode() {
        int result = 17;
        result = 31 * result + name.hashCode();
        return result;
    }
}
And in this case, the following assertions would be true:
1
2
3
4
5
6
7
8
@Test
public void givenMap_whenEqualsAndHashCodeNotOverridden_thenMemoryLeak() {
    Map<Person, Integer> map = new HashMap<>();
    for(int i=0; i<2; i++) {
        map.put(new Person("jon"), 1);
    }
    Assert.assertTrue(map.size() == 1);
}

Another example is of using an ORM tool like Hibernate, which uses equals() and hashCode() methods to analyze the objects and saves them in the cache.
The chances of memory leak are quite high if these methods are not overridden because Hibernate then wouldn’t be able to compare objects and would fill its cache with duplicate objects.
How to Prevent It?
As a rule of thumb, when defining new entities, always override equals() and hashCode() methods
It’s not just enough to override, but these methods must be overridden in an optimal way as well

4.1. Enable Profiling
Java profilers are tools that monitor and diagnose the memory leaks through the application. They analyze what’s going on internally in our application — for example, how memory is allocated.


When you are creating a collection in your program if you keep on adding to the list and even when you doing need those objects 
is going to be proablitic. Once you are done you should clear the collection. 


The stack

  Stack memory is responsible for holding references to heap objects and for storing value types (also known in Java as primitive types), which hold the value itself rather than a reference to an object from the heap.

  In addition, variables on the stack have a certain visibility, also called scope. Only objects from the active scope are used. 
For example, assuming that we do not have any global scope variables (fields), and only local variables, if the compiler executes 
a method’s body, it can access only objects from the stack that are within the method’s body. It cannot access other local variables,
 as those are out of scope. Once the method completes and returns, the top of the stack pops out, and the active scope changes.

  Maybe you noticed that in the picture above, there are multiple stack memories displayed. This due to the fact that the stack memory in Java is allocated per Thread. Therefore, each time a Thread is created and started, it has its own stack memory — and cannot access another thread’s stack memory.

The Heap
  This part of memory stores the actual object in memory. Those are referenced by the variables from the stack. For example, let’s analyze what happens in the following line of code:

StringBuilder builder = new StringBuilder();
  The new keyword is responsible for ensuring that there is enough free space on heap, creating an object of the StringBuilder 
type in memory and referring to it via the builder reference, which goes on the stack.

  There is only one heap memory for each running JVM process. Therefore, this is a shared part of memory regardless of how many 
threads are running. Actually, the heap structure is a bit different than it is shown in the picture above. The heap itself is
 divided into a few parts, which facilitates the process of garbage collection.

  The maximum stack and the heap sizes are not predefined — this depends on the running machine. However, later in this article, 
we will look into some JVM configurations that will allow us to specify their size explicitly for a running application.

Reference types
  If you look closely at the Memory Structure picture, you will probably notice that the arrows representing the references
 to the objects from the heap are actually of different types. That is because, in the Java programming language, we have 
 different types of references: strong, weak, soft, and phantom references. The difference between the types of references 
 is that the objects on the heap they refer to are eligible for garbage collecting under the different criteria. 
 Let’s have a closer look at each of them.

1. Strong reference
  These are the most popular reference types that we all are used to. In the example above with the StringBuilder,
 we actually hold a strong reference to an object from the heap. The object on the heap it is not garbage collected while 
 there is a strong reference pointing to it, or if it is strongly reachable through a chain of strong references.

2. Weak reference
  In simple terms, a weak reference to an object from the heap is most likely to not survive after the next garbage collection 
process. A weak reference is created as follows:

WeakReference<StringBuilder> reference = new WeakReference<>(new StringBuilder());

A nice use case for weak references are caching scenarios. Imagine that you retrieve some data, and you want it to be stored 
in memory as well — the same data could be requested again. On the other hand, you are not sure when, or if, this data will be 
requested again. So you can keep a weak reference to it, and in case the garbage collector runs, it could be that it destroys 
your object on the heap. Therefore, after a while, if you want to retrieve the object you refer to, you might suddenly get back a 
null value. A nice implementation for caching scenarios is the collection WeakHashMap<K,V>. If we open the WeakHashMap class in 
Java API, we see that its entries actually extends WeakReference class and uses its ref field as the map’s key:

/**
 * The entries in this hash table extend WeakReference, using its main ref
 * field as the key.
 */
 
private static class Entry<K,V> extends WeakReference<Object> implements Map.Entry<K,V> {
      V value;
  Once a key from the WeakHashMap is garbage collected, the entire entry is removed from the map.

memorytoolmat10.png



3. Soft reference
  These types of references are used for more memory-sensitive scenarios, since those are going to be garbage collected only when 
your application is running low on memory. Therefore, as long as there is no critical need to free up some space, the garbage
 collector will not touch softly reachable objects. Java guarantees that all soft referenced objects are cleaned up before it 
 throws an OutOfMemoryError. The JavaDocs state, “all soft references to softly-reachable objects are guaranteed to have been 
 cleared before the virtual machine throws an OutOfMemoryError”.

  Analogically to weak references, a soft reference is created as follows:

SoftReference<StringBuilder> reference = new SoftReference<>(new StringBuilder());



4.  Phantom reference

xxxxxxxxxxxxxxxxxxxxxxxxxx




https://www.baeldung.com/java-profilers




</body>
</html>