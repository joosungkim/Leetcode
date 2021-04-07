import UIKit

func splitIntoFibonacci(_ S: String) -> [Int] {
    var toReturn = [Int]()
    var string = S
    split(&string, &toReturn)
    return toReturn
}

func split(_ S: inout String, _ array: inout [Int]) {
    let count = array.count
    if Int(S) == array[count - 1] + array[count - 2] {
        array.append(Int(S)!)
        return
    }
    
    
    
    if S.count == 0 { //when all the string is sliced
        return
    }
}


let input = "123456579"
splitIntoFibonacci(input)

