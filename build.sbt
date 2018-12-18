name := "openfaas-scala-sample"

version := "0.1"

scalaVersion := "2.12.8"

enablePlugins(PackPlugin)
packMain := Map("testFunction2" -> "io.openfaas.function.TestFunction2")
