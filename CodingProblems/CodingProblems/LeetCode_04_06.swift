//
//  LeetCode_04_06.swift
//  CodingProblems
//
//  Created by JS Kim on 2021/04/06.
//

import UIKit

class LeetCode_04_06: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let inst = "LLGRL"
        print(solution_1041(inst))
    }
    
    func solution_1041(_ instructions: String) -> Bool {
        var currDirection = Direction.north
        var currPos:(Int, Int) = (0, 0)
        for char in instructions {
            switch char {
                case "G":
                    currPos.0 += currDirection.getDirection.0
                    currPos.1 += currDirection.getDirection.1
                case "L":
                    switch currDirection {
                    case .north:
                        currDirection = .west
                    case .east:
                        currDirection = .north
                    case .west:
                        currDirection = .south
                    case .south:
                        currDirection = .east
                    }
                case "R":
                    switch currDirection {
                    case .north:
                        currDirection = .east
                    case .east:
                        currDirection = .south
                    case .west:
                        currDirection = .south
                    case .south:
                        currDirection = .east
                    }
                default:
                    break
            }
        }

        print("currDir: \(currDirection)")
        switch currDirection {
        case .north:
            if currPos == (0,0) {
                return true
            }
            return false
        default: return true
        }
    }
    
    enum Direction {
        case north
        case east
        case west
        case south
        
        var getDirection: (Int, Int) {
            switch self {
            case .north: return (0, 1)
            case .east: return (1, 0)
            case .west: return (-1, 0)
            case .south: return (0, -1)
            }
        }
    }
}
