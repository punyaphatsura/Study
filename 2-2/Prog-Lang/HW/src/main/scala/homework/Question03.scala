package homework

import scala.annotation.tailrec

object Question03 {

  @tailrec
  def contain(c:Any, l: List[Any]): Boolean = {
    if(l.isEmpty) false
    else if (c == l.head) true
    else contain(c, l.tail)
  }

  @tailrec
  def subList(l1: List[Any], l2: List[Any]): Boolean = {
    if (l1.isEmpty) true
    else if (l2.isEmpty) false
    else contain(l1.head, l2) && subList(l1.tail,l2)
  }

  var l1:List[Any] = List(1,2,3,4,5,99)
  var l2:List[Any] = List(5,6,8,3,1,4,99,2,6,3,4)

  def main(args: Array[String]): Unit = {
      println(subList(l1, l2))
    }

}
