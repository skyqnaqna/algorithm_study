// LeetCode Add Two Numbers
// 21.05.31

import Foundation

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var pos1 = l1
    var pos2 = l2
    var answer = ListNode()
    var now = answer
    var carry = 0

    while pos1 != nil || pos2 != nil {
      let num1 = pos1 != nil ? pos1!.val : 0
      let num2 = pos2 != nil ? pos2!.val : 0

      let sum = num1 + num2 + carry

      now.next = ListNode(sum % 10)
      carry = sum / 10
      now = now.next!

      if pos1 != nil {
        pos1 = pos1!.next
      }

      if pos2 != nil {
        pos2 = pos2!.next
      }
    }

    if carry > 0 {
      now.next = ListNode(carry)
    }

    return answer.next
  }
}