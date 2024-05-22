package homework

import scala.annotation.tailrec

object Question05 {

  @tailrec
  def split(l1: List[Any], l2: List[Any]): List[List[Any]] = {
    if (l1.length == l2.length || l1.length + 1 == l2.length) List(l1, l2)
    else split(l1 ++ List(l2.head), l2.tail)
  }
  
  def reverse(l: List[Any]):List[Any] = {
    if (l.length <= 1) l
    else reverse(l.tail) ++ List(l.head)
  }
  
  def palindrome(list: List[Any]):Boolean ={
    if(list.length%2==0) {
      var ls = split(List(), list)
      ls.head == reverse(ls.tail.head)
    }
    else {
      var ls = split(List(), list)
//      println(reverse(ls.tail.head.tail))
//      println(ls.head)
      ls.head == reverse(ls.tail.head.tail)
    }
  }

  var l: List[Int] = List(6,7,8,9,8,7,6)
  
  def main(args: Array[String]):Unit = {
    println(palindrome(l))
  }

}
