import UIKit


func solution(_ program:String, _ flag_rules:[String], _ commands:[String]) -> [Bool] {
    var toReturn = [Bool]()
    var rules =  [String: String]()
    for rule in flag_rules {
        let tokens = rule.components(separatedBy: " ")
        rules[tokens[0]] = tokens[1]
    }
    for command in commands {
        let tokens = command.components(separatedBy: " ")
        if tokens[0] != program {
            toReturn.append(false)
            continue
        }
        var i = 1
        var temp = true
        while i < tokens.count {
            print(tokens[i])
            if !rules.keys.contains(where: {$0 == tokens[i]}) {
                temp = false
                break
            }
            switch rules[tokens[i]] {
            case "NUMBER":
                if i+1 >= tokens.count || Int(tokens[i+1]) == nil {
                    temp = false
                    break
                }
                i += 1
            case "NUMBERS":
                var once = false
                while i + 1 < tokens.count {
                    if Array(tokens[i+1])[0] == "-" {
                        break
                    } else if Int(tokens[i+1]) == nil {
                        temp = false
                        break
                    } else {
                        once = true
                        i += 1
                    }
                }
                if !once {
                    temp = false
                    break
                }
            case "STRING":
                if i+1 >= tokens.count {
                    temp = false
                    break
                }
                i += 1
            case "STRINGS":
                var once = false
                while i + 1 < tokens.count {
                    if Array(tokens[i+1])[0] == "-" {
                        break
                    } else {
                        once = true
                        i += 1
                    }
                }
                if !once {
                    temp = false
                    break
                }
            default: break
            }
            i += 1
        }
        toReturn.append(temp)
    }
    return toReturn
}

func tokenInterator() {
    
}

let rules = ["-s STRING", "-n NUMBER", "-e NULL"]
let comms = ["line -s 123 -n HI", "line fun"]

print(solution("line", rules, comms))

//
//program: string
//1 <= program의 길이 <= 10
//실행할 프로그램의 이름입니다.
//공백처리는 하지 않아도 됩니다.
//flag_rules: [flag_rule]
//1 <= flag_rules의 길이 <= 100
//flag_rule: "<flag_name> <flag_argument_type>"
//flag_name: string
//2 <= flag_name의 길이 <= 10
//flag_name은 '-'(dash)로 시작하고, 영어 대소문자로만 이루어져 있습니다.
//동일한 flag_name에 대한 처리는 하지 않아도 됩니다.
//flag_argument_type: "NULL" | "NUMBER" | "STRING"
//"NULL": flag argument를 받지 않습니다.
//"NUMBER": 0부터 9까지의 숫자로만 이루어진 flag argument를 받습니다.
//"STRING": 알파벳 대소문자로만 이루어진 flag argument를 받습니다.
//commands: [command]
//1 <= commands의 길이 <= 100
//1 <= command의 길이 <= 100
//command는 하나의 program과 여러 flag가 string 형태로 이어져 있고, 이들은 공백으로 구분됩니다.
//연속되는 공백도 공백처리를 하지 않아도 됩니다.
