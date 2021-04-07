import UIKit

var str = "Hello, playground"

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var result = -1
    var sorted = coins.sorted(by: {$0 > $1})
    print("sorted: \(sorted)")
    
    return 0
}

func recursive(_ coins: inout [Int], _ amount: Int, _ count: inout Int) -> Int {
    if amount == coins.first! {
        coins = [Int]()
        return 1
    }
    else if amount < coins.last! {
        coins.remove(at: 0)
        return 0
    }
    
    return 0
}

let coinArray = [5,2,3,1]
let amount = 11
print(coinChange(coinArray, amount))
