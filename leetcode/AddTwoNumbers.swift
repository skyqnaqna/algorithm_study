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
    var answer: ListNode
    var pos1 = l1
    var pos2 = l2
    var num1 = pos1!.val
    var num2 = pos2!.val
    var flag = false

    answer = ListNode((num1 + num2) % 10)
    var now = answer

    if num1 + num2 > 9 {
      flag = true
    }

    pos1 = pos1!.next
    pos2 = pos2!.next

     while pos1 != nil && pos2 != nil {

      num1 = pos1!.val
      num2 = pos2!.val

      if flag {
        now.next = ListNode((num1 + num2 + 1) % 10)
        if num1 + num2 + 1 < 10 {
          flag = false
        }
      } else {
        now.next = ListNode((num1 + num2) % 10)
        if num1 + num2 > 9 {
          flag = true
        }
      }

      now = now.next!
      pos1 = pos1!.next
      pos2 = pos2!.next
    }

    if pos1 == nil {
      while pos2 != nil {
        if flag {
          now.next = ListNode((pos2!.val + 1) % 10)
          if pos2!.val + 1 < 10 {
            flag = false
          }
        } else {
          now.next = pos2
        }
        now = now.next!
        pos2 = pos2!.next
      }
    }

    if pos2 == nil {
      while pos1 != nil {
        if flag {
          now.next = ListNode((pos1!.val + 1) % 10)
          if pos1!.val + 1 < 10 {
            flag = false
          }
        } else {
          now.next = pos1
        }
        now = now.next!
        pos1 = pos1!.next
      }
    }

    if flag {
      now.next = ListNode(1)
    }

    return answer
  }
}