package io.openfaas.function

object TestFunction2 {

  def main(args: Array[String]): Unit = {
    println(readStdIn())
  }
}
