package homework

import scala.annotation.tailrec

object Question04 {

  @tailrec
  def split(l1: List[Int], l2: List[Int]): List[List[Int]] = {
    if (l1.length == l2.length || l1.length - 1 == l2.length) List(l1, l2)
    else split(l1 ++ List(l2.head), l2.tail)
  }

  def merge(left: List[Int], right: List[Int]): List[Int] = {
    if (left.isEmpty) right
    else if (right.isEmpty) left
    else if (left.head < right.head) left.head :: merge(left.tail, right)
    else right.head :: merge(left, right.tail)
  }

  def mergesort(list: List[Int]): List[Int] = {
    if (list.isEmpty || list.length == 1) list
    else {
      val splitLists = split(List(), list)
      val left = mergesort(splitLists.head)
      val right = mergesort(splitLists.last)
      merge(left, right)
    }
  }

  val list: List[Int] = List(3, 5, 2, 6, 8, 1, 0, 4, 7)

  def main(args: Array[String]):Unit ={
    println(mergesort(list))
  }
}
