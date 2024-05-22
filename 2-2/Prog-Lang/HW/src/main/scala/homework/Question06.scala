package homework

object Question06 {

  def myMap(f:Int => Int) (list:List[Int]) :List[Int] = {
    if(list.isEmpty) list
    else if (list.length == 1) List(f(list.head))
    else List(f(list.head)) ++ myMap(f)(list.tail)
  }

  def pow(x:Int):Int = {
    x*x*x*x*x*x*x*x*x*x
  }

  def main(args: Array[String]): Unit ={
    println(myMap(x => x*2)(List(1,2,3,4,5)))
    println(myMap(pow)(List(1, 2, 3, 4, 5)))
  }

}
