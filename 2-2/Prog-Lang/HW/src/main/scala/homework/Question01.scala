package homework

object Question01 {

  def insertLast(x:Any, l:List[Any]) : List[Any] ={
    l ++ List(x)
  }

  def main(args: Array[String]): Unit ={
    println(insertLast(4,List(1,2,3)))
  }

}
