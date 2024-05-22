package homework

object Question09 {

  def turingStep(f:Char => Char,tape:List[Char], n:Int): List[Char] ={
    if (tape.isEmpty || n==0) tape
    else List(f(tape.head)) ++ turingStep(f,tape.tail,n-1)
  }

  val tape: List[Char] = List('C','H','A','R','C','H','A','R')
  def f1(c:Char):Char = {
    c.toLower
  }
  def main(args: Array[String]): Unit = {

    println(turingStep(f1, tape, 2))
    println(turingStep(f1, tape, 3))
    println(turingStep(f1, tape, 0))
    println(turingStep(f1, tape, 5))

  }
}
