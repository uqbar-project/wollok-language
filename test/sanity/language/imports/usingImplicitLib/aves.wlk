package special {
  object pepita {
    method volar() { 
      console.println('abc')
      return new Pair(x = 1, y = 2)
    }
  }
}

object pepona {
  method volar() { 
    return new Pair(x = 1, y = 2)
  }
}

object pepusa {
  method volar() { 
    console.println("pepusa is flying")
    return 10
  }
}
