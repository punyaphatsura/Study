package homework

import scala.annotation.tailrec

object Q1 {

  def swapPair(l:List[Int]): List[Int] = {
    @tailrec
    def sp(l: List[Int], tmp: List[Int], ans: List[Int]): List[Int] = {
      if(l.isEmpty){
        return ans ++ tmp
      }else{
        if(tmp.isEmpty){
          return sp(l.tail, List(l.head), ans)
        }else{
          return sp(l.tail, List(), ans ++ List(l.head) ++ tmp)
        }
      }
    }
    return sp(l,List(),List())
  }

  def main(args: Array[String]): Unit ={
    val list3 = List(1 ,2, 3 ,4)
    val list4 = List(1, 2, 3, 4,5)
    println(swapPair(list3))
    println(swapPair(list4))
    println(swapPair(List(1)))
  }

}
