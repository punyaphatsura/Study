package homework

object Question02 {
  def insertInOrder(x:Int, list:List[Int]):List[Int] = {
    if(list.isEmpty) List(x)
    else if(list.head>=x) List(x)++list
    else List(list.head) ++ insertInOrder(x,list.tail)
  }

  var list:List[Int] = List(1,2,3,5,6)

  def main(args: Array[String]):Unit = {
    println(insertInOrder(4,list))
  }

}
