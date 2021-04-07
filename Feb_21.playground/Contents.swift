import UIKit

var str = "Hello, playground"

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
  var total = truck_weights
  var timeStamp = 0
  var onBridge = [Int]()
  var onBridgeTime = [Int]()
  var onBridgeWeight = 0
  var loopBreak = true
  var temp = total.first!
  repeat {
    while onBridgeWeight + total.first! < weight {
      temp = total.remove(at: 0)
      onBridgeWeight = temp + onBridgeWeight
      onBridge.append(temp)
      onBridge.append(timeStamp)
    }
    while loopBreak {
      guard let temp = onBridgeTime.first else { break }
      if temp + bridge_length >= timeStamp {
        onBridgeTime.remove(at: 0)
        onBridgeWeight = onBridgeWeight - onBridge.remove(at: 0)
      } else {
        loopBreak = false
        break
      }
    }
    timeStamp = timeStamp + 1
  } while total.count >= 0
  return timeStamp
}


//solution(2, 10, [7,4,5,6])

struct Queue {
  var items:[Int] = []
  mutating func enqueue(element: Int) {
    items.append(element)
  }
  
  mutating func dequeue() -> Int? {
    if items.isEmpty {
      return nil
    }
    else {
      let tempElement = items.first
      items.remove(at: 0)
      return tempElement
    }
  }
  
  func peek() -> Int? {
    if items.isEmpty {
      return nil
    } else {
      return items.first
    }
  }
}
