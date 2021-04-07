import UIKit

func solution(_ program:String, _ flag_rules:[String], _ commands:[String]) -> [Bool] {
    var toReturn = [Bool]()
    var rules =  [String: String]()
    for rule in flag_rules {
        let tokens = rule.components(separatedBy: " ")
        if tokens[1] == "ALIAS" {
            continue
        }
        rules[tokens[0]] = tokens[1]
    }
    for rule in flag_rules {
        let tokens = rule.components(separatedBy: " ")
        if tokens[1] != "ALIAS" {
            continue
        }
        rules[tokens[0]] = tokens[2]
    }
    for command in commands {
        let tokens = command.components(separatedBy: " ")
        if tokens[0] != program {
            toReturn.append(false)
            continue
        }
        var i = 1
        var temp = true
        var usedFlags = Set<String>()
        while i < tokens.count {
            if !rules.keys.contains(where: {$0 == tokens[i]}) {
                temp = false
                break
            }
            var flag = tokens[i]
            if Array(rules[flag]!)[0] == "-" {
                flag = rules[flag]!
            }
            if usedFlags.contains(flag) {
                temp = false
                break
            }
            usedFlags.insert(flag)
            switch rules[flag] {
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

let rules = ["-s STRING", "-num NUMBER", "-e NULL", "-n ALIAS -num"]
let comms = ["line -n 100 -s hi -e", "line -n 100 -e -num 150"]

print(solution("line", rules, comms))

