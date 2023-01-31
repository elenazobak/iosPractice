func calculator (n1: Int, n2: Int, operation: (Int, Int))-> Int {
    return operation(n1, n2)
}

let result = calculator(n1: 2, n2:3) {$0 * $1}


//

let array = [3,4,6,2,8]
array.map(addOne)
func addOne(n1: Int) -> Int {
    return n1 + 1
}  // turn to closure \ ->

     {(n1: Int) -> Int 
      in  return n1 + 1
      }  /


array.map{$0 + 1}
