package io.openfaas.function

import scala.util.Try

object TestFunction extends App {

  Try {
    val input=readStdIn()
    println(input)
  }

}
