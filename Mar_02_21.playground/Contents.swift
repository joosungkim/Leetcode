import UIKit

var str = "Hello, playground"

func distributeCandies(_ candyType: [Int]) -> Int {
    let mapped = Dictionary.init(candyType.map{ ($0, 1) }, uniquingKeysWith: +)
    return min(candyType.count/2,mapped.count)
}


//let candies = [6,6,6,6]
//print(distributeCandies(candies))

func firstMissingPositive(_ nums: [Int]) -> Int {
//    let set = Set.init(arrayLiteral: nums)
    if nums.isEmpty { return 1 }
    let set = Set.init(nums)
    for i in 1...nums.count {
        if !set.contains(i) { return i}
    }
    return nums.count + 1
}

func commonChars(_ A: [String]) -> [String] {
    var copy = A
    var chars = A[0]
    let first = Dictionary.init(A[0].map{($0, 1)}, uniquingKeysWith: +)
    for string in copy {
        for char in chars {
//            if string.contains(char) { string.remove}
        }
    }
    return [" "]
}

//func removeFirstOccurence(_ inputString: inout String, _ char: Character) -> String? {
//    for cha in inputString {
//        if cha == char { return inputString.remove(at: String.Index.)}
//    }
//    return nil
//}

let array = ["bella","label","roller"]
commonChars(array)


func findErrorNums(_ nums: [Int]) -> [Int] {
    var changesTwice = -1
    var copy = nums
    let count = nums.count - 1
    for i in 0...count {
        let num = nums[i] - 1
        if copy[num] < 0 {
            changesTwice = nums[i]
        } else {
            copy[num] = 0 - copy[num]
        }
    }
    for j in 0...count {
        if copy[j] > 0 {
            return [changesTwice, j+1]
        }
    }
    return [0]
}

let nums = [1,2,2,4]
print(findErrorNums(nums))
