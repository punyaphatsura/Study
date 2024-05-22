package homework

object Question07 {

  def myFilter(f:Int => Boolean) (list:List[Int]) :List[Int] = {
    if(list.isEmpty) List()
    else {
      if (f(list.head)) List(list.head) ++ myFilter(f)(list.tail)
      else myFilter(f)(list.tail)
    }
  }

  def main(args: Array[String]): Unit = {

    println(myFilter(x => x%2==0)(List(1,2,3,4,5)))

  }
}
