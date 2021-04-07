import UIKit

var str = "Hello, playground"

func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    var best = 0
    var bestJob = ""
    var langMap = [String:Int]()
    for i in 0...languages.count - 1 {
        langMap[languages[i]] = preference[i]
    }
    for row in table {
        var eachRow = row.components(separatedBy: " ")
        var currentScore = 0
        var currentJob = eachRow[0]
        for i in 1...5 {
            if langMap[eachRow[i]] != nil {
                currentScore += langMap[eachRow[i]]! * (6 - i)
            }
        }
        if best < currentScore {
            bestJob = currentJob
            best = currentScore
        } else if best == currentScore {
            if bestJob > currentJob {
                bestJob = currentJob
                best = currentScore
            }
        }
    }
    return bestJob
}


let table = ["SI JAVA JAVASCRIPT SQL PYTHON C#", "CONTENTS JAVASCRIPT JAVA PYTHON SQL C++", "HARDWARE C C++ PYTHON JAVA JAVASCRIPT", "PORTAL JAVA JAVASCRIPT PYTHON KOTLIN PHP", "GAME C++ C# JAVASCRIPT C JAVA"]

let lang = ["PYTHON", "C++", "SQL"]

let pref = [7, 5, 5]

solution(table, lang, pref)



func solution2(_ inp_str:String) -> [Int] {
    var errors = [Int]()
    let array = Array(inp_str)
    let length = inp_str.count
    //error 1
    if length < 8 || length > 15 {
        errors.append(1)
    }
    
    //error 2
    let symbols = "~!@#$%^&*"
    if inp_str.contains(where: {!$0.isUppercase && !$0.isLowercase && !$0.isNumber && !symbols.contains($0)}) {
        errors.append(2)
    }
    
    //error 3
    var count = 0
    if inp_str.contains(where: {$0.isUppercase}) {
        count += 1
    }
    if inp_str.contains(where: {$0.isLowercase}) {
        count += 1
    }
    if inp_str.contains(where: {$0.isNumber}) {
        count += 1
    }
    if inp_str.contains(where: {symbols.contains($0)}) {
        count += 1
    }
    if count < 3 {
        errors.append(3)
    }
    
    //error 4
    if length > 3 {
        for i in 0...length - 4  {
            var temp = true
            for j in 0...3 {
                if array[i] != array[i + j] {
                    temp = false
                    break
                }
            }
            if temp {
                errors.append(4)
                break
            }
        }
    }
    
    //error 5
    var countMap = [Character: Int]()
    for i in 0...length - 1 {
        if countMap[array[i]] == nil {
            countMap[array[i]] = 0
        }
        countMap[array[i]]! += 1
        if countMap[array[i]]! > 4 {
            errors.append(5)
            break
        }
    }
    if errors.count == 0 {
        errors = [0]
    }
    return errors
}
//8 ≤ password 길이 ≤ 15
//password는 아래 4 종류의 문자 그룹을 제외한, 다른 어떤 문자도 포함해서는 안됩니다.
//[1] 알파벳 대문자(A~Z)
//[2] 알파벳 소문자(a~z)
//[3] 숫자(0~9)
//[4] 특수문자(~!@#$%^&*)
//password는 (2.)에서 명시된 4 종류의 문자 그룹 중에서 3 종류 이상을 포함해야 합니다.
//password에 같은 문자가 4개 이상 연속될 수 없습니다.
//password에 같은 문자가 5개 이상 포함될 수 없습니다.
let input = "Aaaaaba"
//solution2(input)

func solution3(_ enter:[Int], _ leave:[Int]) -> [Int] {
    let count = enter.count
    var result = [Int](repeating: 0, count: count + 1)
    var inRoom = [Bool](repeating: false, count: count + 1)
    var i = 0
    var j = 0
    while i < count {
        var currentPerson = enter[i]
        inRoom[enter[i]] = true
        result[enter[i]] = i - j
        for k in 1...count {
            if inRoom[k] && k != enter[i] { result[k] += 1}
        }
        while j < count {
            if inRoom[leave[j]] {
                inRoom[leave[j]] = false
                j += 1
            } else { break }
        }
        i += 1
    }
    result.remove(at: 0)
    return result
}

let enter = [1,4,2,3]
let leave = [2,1,4,3]

solution3(enter, leave)
//
//[1,3,2]    [1,2,3]    [0,1,1]
//[1,4,2,3]    [2,1,3,4]    [2,2,1,3]
//[3,2,1]    [2,1,3]    [1,1,2]
//[3,2,1]    [1,3,2]    [2,2,2]
//[1,4,2,3]    [2,1,4,3]    [2,2,0,2]


//func solution4(_ data:[String], _ word:String) -> [String] {
//    var results = [String]()
//    var nodes = [Node]()
//    for line in data {
//        nodes.append()
//    }
//    return []
//}

struct Node {
    let name: String
    let parentId: Int
    let id: Int
    init(_ id: Int, _ name: String, _ parentId: Int) {
        self.id = id
        self.name = name
        self.parentId = parentId
    }
}

let inputarr = ["1 BROWN 0", "2 CONY 0", "3 DOLL 1", "4 DOLL 2", "5 LARGE-BROWN 3", "6 SMALL-BROWN 3", "7 BLACK-CONY 4", "8 BROWN-CONY 4"]

//solution4(inputarr, "Brown")

//["CONY/DOLL/BROWN-CONY", "BROWN/DOLL/LARGE-BROWN", "BROWN/DOLL/SMALL-BROWN"]
