import UIKit

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var days = [Int]()
    var toReturn = [Int]()
    let count = progresses.count - 1
    var temp = 0
    for index in 0...count {
        temp = ((100 - progresses[index]) / speeds[index])
        if (100 - progresses[index]) % speeds[index] != 0 { temp += 1 }
        days.append(temp)
    }
    print(days)
    temp = days[0]
    var counter = 0
    for index in 0...count {
        if days[index] > temp {
            temp = days[index]
            toReturn.append(counter)
            counter = 1
        } else {
            counter += 1
        }
    }
    toReturn.append(counter)
    return toReturn
}

var progresses = [95, 90, 99, 99, 80, 99]
var speeds = [1, 1, 1, 1, 1, 1]

//print(solution(progresses, speeds))

func solution2(_ priorities:[Int], _ location:Int) -> Int {
    let intendedValue = priorities[location]
    var sameStack = [Int]()
    var counter = 0
    var lastIndex = 0
    for index in 0...priorities.count - 1 {
        if priorities[index] == intendedValue {
            sameStack.append(index)
        } else if priorities[index] > intendedValue {
            lastIndex = index
            counter += 1
        }
    }
    for number in sameStack {
        if number < lastIndex {
            sameStack.append(sameStack.remove(at: 0))
        }
    }
    return sameStack.firstIndex(of: location)! + counter + 1
}

//func solution3(_ priorities:[Int], _ location:Int) -> Int {
//    var original = [(Int, Int)]()
//    for (index, priority) in priorities.enumerated() {
//        original.append((index, priority))
//    }
//    var copy = original
//    for (index, (index, priority))) in original.enumerated() {
//
//    }
//    return 0
//}

var priorities = [1, 1, 9, 1, 1, 1]

//solution3(priorities, 3)
//print(solution2(priorities, 3))
var result = 0

func solution4(_ numbers:[Int], _ target:Int) -> Int {
    bfs(numbers, target, 0 , 0)
    return result
}

func bfs(_ numbers:[Int], _ target:Int, _ currentSum: Int, _ currentIndex: Int) {
    if currentIndex == numbers.count {
        if currentSum == target {
            result += 1
            return
        } else {
            return
        }
    }
    bfs(numbers, target, currentSum - numbers[currentIndex], currentIndex + 1)
    bfs(numbers, target, currentSum + numbers[currentIndex], currentIndex + 1)
    return
}
let numbers = [1, 1, 1, 1, 1]


func searchTarget(number: [Int], depth: Int, target: Int, value: Int, answer: inout Int) {

    // MARK: - 사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.
    if depth >= number.count {
        if target == value { answer = answer + 1 }
        return
    }

    // MARK: - 이 수를 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다.
    searchTarget(number: number, depth: depth + 1, target: target, value: value + number[depth], answer: &answer)
    searchTarget(number: number, depth: depth + 1, target: target, value: value - number[depth], answer: &answer)
}

func solution5(_ numbers:[Int], _ target:Int) -> Int {

    var answer = 0
    searchTarget(number: numbers, depth: 0, target: target, value: 0, answer: &answer)

    return answer
}


func solution6(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = [Int]()
    var networks = 0
    for i in 0...n - 1 {
        if visited.contains(i) {
            continue
        }
        var currentNetwork = [i]
        getCurrentNetwork(n, computers, i, &currentNetwork)
        for index in currentNetwork {
            visited.append(index)
            print("netowrk: \(networks), index: \(index)")
        }
        networks += 1
    }
    return networks
}

func getCurrentNetwork(_ n:Int, _ computers:[[Int]], _ currentRow: Int, _ currentNetwork: inout [Int]) {
    var row = computers[currentRow]
    for i in 0...n-1 {
        if !currentNetwork.contains(i) && row[i] == 1 {
            currentNetwork.append(i)
            getCurrentNetwork(n, computers, i, &currentNetwork)
        }
    }
}

let computers = [[1, 1, 0], [1, 1, 0], [0, 0, 1]]
//print(solution6(3, computers))

func solution7(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    var min = words.count
//    findWay(words, &min)
    
    return 0
}

func findWay(_ words: [String], _ target: String, _ min: inout Int) {
    
}

let words: [String] = ["hot", "dot", "dog", "lot", "log", "cog"]
print(solution7("hit", "cog", words))
