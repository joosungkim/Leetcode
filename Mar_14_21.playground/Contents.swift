import UIKit

var str = "Hello, playground"


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


    
func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard var temp: ListNode = head else { return nil }
    var list = [Int]()
    repeat {
        list.append(temp.val)
        temp = temp.next!
    } while temp.next != nil
    print(list)
    list.swapAt(k, list.count - (1 + k))
    print(list)
    if list.count < 2 {
        return ListNode(list.first!)
    } else {
        let head = ListNode(list.first!)
        var curr = head
        for i in 0...list.count - 2 {
            var second = ListNode(list[i+1])
            curr.next = second
            curr = second
        }
    }
    return head
}
    
swapNodes(, <#T##k: Int##Int#>)

let nums = [1,2,3,4,5]


