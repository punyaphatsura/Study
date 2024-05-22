package homework

import scala.annotation.tailrec

object Question10 {

  def alternate(f1: (Int, Int) => Int, f2: (Int, Int) => Int, list: List[Int]): Int = {
    @tailrec
    def cal(f1: (Int, Int) => Int, f2: (Int, Int) => Int, list: List[Int], state: Int, ans:Int, count:Int): Int = {
      if(list.isEmpty) ans
      else if(count == 0) cal(f1, f2, list.tail, 0, list.head,1)
      else {
        if (state == 0) {
          cal(f1, f2, list.tail, 1, f1(ans,list.head),1)
        }
        else {
          cal(f1, f2, list.tail, 0, f2(ans,list.head),1)
        }
      }
  }
    if(list.isEmpty) 0
    else{
      cal(f1, f2, list,0,0,0)
    }
  }

  def plus(x:Int,y:Int): Int={
    x + y
  }

  def minus(x: Int, y: Int): Int = {
    x - y
  }

    def main(args: Array[String]): Unit = {
      println(alternate(plus,minus,List()))
      println(alternate(plus, minus, List(55)))
      println(alternate(plus, minus, List(1,2)))
      println(alternate(plus, minus, List(1,2,3)))
      println(alternate(plus, minus, List(1,2,3,4)))
  }

}
