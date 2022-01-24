/*
 백준 10104 Party Invitation
 22.01.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

public class Node<Value> {
  var value: Value
  var next: Node?
  
  init(_ val: Value, _ _next: Node? = nil) {
    self.value = val
    self.next = _next
  }
  
  public func alloc(_ val: Value, _ _next: Node? = nil) {
    self.value = val
    self.next = _next
  }
}

let k = Int(readLine()!)!
let m = Int(readLine()!)!

//var node = [Node<Int>](repeating: Node<Int>(-1), count: 100)
var nodeCnt = 0
var head = Node<Int>(-1), tail = Node<Int>(-1)

func initNode() {
  nodeCnt = 0
  head.next = tail
  var ptr = head
  for i in 1 ... k {
//    node[nodeCnt].alloc(i, ptr.next)
    ptr.next = Node<Int>(i, ptr.next)
//    nodeCnt += 1
    ptr = ptr.next!
  }
}

initNode()

for _ in 0 ..< m {
  let n = Int(readLine()!)!
  var ptr = head
  var idx = 1
  
  while ptr.next?.value != -1 {
    if idx % n == 0 {
      ptr.next = ptr.next?.next
      idx += 1
    }
    
    if let next = ptr.next {
      ptr = next
      idx += 1
    } else { break }
  }
}

var ptr = head
var answer = ""
while ptr.next?.value != -1 {
  answer += "\(ptr.next!.value)\n"
  ptr = ptr.next!
}

print(answer)
