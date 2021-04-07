import UIKit

func solution(_ people:[Int]) -> [Int] {
    var answer = [Int]()
    var customers = [Int: Int]()
    for order in people {
        if customers[order] == nil {
            customers[order] = 1
        } else if customers[order]! < 3 {
            customers[order]! += 1
        } else if customers[order] == 3 {
            customers[order] = nil
            answer.append(order)
        }
    }
    if answer.count == 0 {
        return [-1]
    }
    return answer
}
let array = [1,3,3,2,4,3,3,2,4,2,2,4]
//print(solution(array))

//func solution(_ n:Int) -> String {
//    if n == 0 { return "0" }
//    if n == 1 { return "1" }
//    var first = 0
//    var second = 1
//    if n > 1 {
//        for i in 2...n {
//            var temp = first + second
//            first = second
//            second = temp
//        }
//        return String(second)
//    }
//    for i in (n ... -1).reversed() { // n < 0
//        var temp = second - first
//        second = first
//        first = temp
//    }
//    return String(first)
//}

func postfix( _ p:[String]) -> Int64 {
    var stack = [Int64]()
    for token in p {
        print("stack: \(stack)")
        if Int64(token) == nil {
            let first = stack.popLast()!
            print("first: \(first)")
            let second = stack.popLast()!
            print("second: \(second)")
            if token == "+"{
                stack.append(first + second)
            } else if token == "-" {
                stack.append(second - first)
            } else if token == "/" {
                stack.append(first / second)
            } else if token == "*" {
                stack.append(first * second)
            }
        } else {
            stack.append(Int64(token)!)
        }
    }
    return stack[0]
}

let nums = ["12","2","5","+","*","9","3","/","-"]
//print(postfix(nums))

func solution(_ maps:[[Int]]) -> Int{
    var answer = 0
    for i in 0...maps.count - 1 {
        for j in 0...maps[i].count - 1 {
            if maps[i][j] == 1 {
                answer += check(i - 1, j, maps)
                answer += check(i + 1, j, maps)
                answer += check(i, j - 1, maps)
                answer += check(i, j + 1, maps)
            }
        }
    }
    
    return answer
}

func check(_ i: Int, _ j: Int, _ maps: [[Int]]) -> Int {
    if i < 0 || i >= maps.count || j < 0 || j >= maps[i].count || maps[i][j] == 0 {
        return 1
    }
    return 0
}
