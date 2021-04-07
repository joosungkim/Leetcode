//
//  ViewController.swift
//  CodingProblems
//
//  Created by JS Kim on 2021/04/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let gifts = [2,3,4,5,1]
//        let wants = [1, 2, 3, 5, 4]
//        print(solution(gifts, wants))
        let needs = [ [ 1, 0, 0 ], [1, 1, 0], [1, 1, 0], [1, 0, 1], [1, 1, 0], [0, 1, 1] ]
        print(solution2(needs, 2))
        
        let passenger = [1,1,1,1,1,1]
        let train = [[1,2],[1,3],[1,4],[3,5],[3,6]]
        print(solution3(6, passenger, train))

    }

    
    func solution(_ gift_cards:[Int], _ wants:[Int]) -> Int {
        let wantedMap = wants.reduce(into: [:]) { $0[$1, default: 0] += 1  }
        let giftsMap = gift_cards.reduce(into: [:]) { $0[$1, default: 0] += 1  }
        var count = 0
        for key in giftsMap.keys {
            if let wanted = wantedMap[key] {
                count += max(giftsMap[key]! - wanted, 0)
            } else {
                count += giftsMap[key]!
            }
        }
        return count
    }
    
    func solution2(_ needs:[[Int]], _ r:Int) -> Int {
        let numRows = needs.count
        let numParts = needs[0].count
        var newArray = [[Int]](repeating: [Int](), count: needs.count)
        var dict = [Int: Int]()
        var requiredArray = [Int](repeating: 0, count: numParts)
        for i in 0...numRows - 1 {
            for j in 0...numParts - 1 {
                if needs[i][j] == 0 {
                    requiredArray[j] += 1
                    newArray[i].append(j)
                }
            }
        }
        let nums = [0...numParts]
        print(nums)
        let comb = combos(elements: [0...numParts], k: r)
        print(comb)
//        print(newArray)
//        print(requiredArray)
        return 0
    }
    
    func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
        if k == 0 {
            return [[]]
        }

        guard let first = elements.first else {
            return []
        }

        let head = [first]
        let subcombos = combos(elements: elements, k: k - 1)
        var ret = subcombos.map { head + $0 }
        ret += combos(elements: elements.dropFirst(), k: k)

        return ret
    }

    func combos<T>(elements: Array<T>, k: Int) -> [[T]] {
        return combos(elements: ArraySlice(elements), k: k)
    }
   
    
    func solution3(_ n:Int, _ passenger:[Int], _ train:[[Int]]) -> [Int] {
        
        return []
    }
}

