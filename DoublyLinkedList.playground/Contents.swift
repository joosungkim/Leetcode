import Foundation

func solution(_ operations:[String]) -> [Int] {
  return []
}

class DoublyLinkedList {
  var list: Set<Node>
  var head: Node?
  var tail: Node?
  init() {
    self.list = Set<Node>()
  }
  
  func insert(value: Int) {
    if
      }
  
  func removeHead() {
    
  }
  
  func removeTail() {
    
  }
}

class Node: Hashable {
  static func == (lhs: Node, rhs: Node) -> Bool {
    return lhs.getValue() == rhs.getValue()
  }
  
  func hash(into hasher: inout Hasher) {
    
  }
  
  var prev: Node?
  var next: Node?
  var value: Int
  init(value: Int, prev: Node? = nil, next: Node? = nil) {
    self.value = value
    self.prev = prev
    self.next = next
  }
  
  func setPrev(node: Node) {
    self.prev = node
  }
  
  func setNext(node: Node) {
    self.next = node
  }
  
  func getValue() -> Int {
    return self.value
  }
}
