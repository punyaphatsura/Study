package homework

import scala.annotation.tailrec

object Question08 {

  @tailrec
  def sumFirstPos(list:List[List[Int]], sum:Int, fin:List[List[Int]]) : (Int, List[List[Int]]) = {
    if(list.isEmpty) (sum,fin)
    else{
      if (list.head.isEmpty) sumFirstPos(list.tail, sum, fin)
      else sumFirstPos(list.tail, sum + list.head.head, fin ++ List(list.head.tail))
    }
  }

  def sumAll(lists:List[List[Int]]) :List[Int] = {
    if(lists.isEmpty) List()
    else{
      val (s, l) = sumFirstPos(lists, 0, List())
//      println(l)
      if(lists.tail.isEmpty && lists.head.isEmpty) List()
      else List(s) ++ sumAll(l)
    }
  }

  def main(args: Array[String]) : Unit = {
    println(sumAll(List()))
    println(sumAll(List(List())))
    println(sumAll(List(List(1, 2, 3, 4), List(), List(4, 5), List(1, 2, 3, 4, 5, 6))))
    println(sumAll(List(List(3, 4), List(1, 2, 3, 4, 5, 6), List(1, 2, 3, 4))))
    println(sumAll(List(List(1, 2, 3, 4, 5, 6), List(1, 2, 3, 4), List(1, 2), List(0, 0, 0, 0, 0, 0, 0, 0, 9))))
  }
}
