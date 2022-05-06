/*
 프로그래머스 표 편집
 22.05.06
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

class Node {
  var prev: Node?
  var next: Node?
  var num: Int
  
  init(_ num: Int) {
    self.num = num
  }
  
  func add(_ ptr: Node) {
    ptr.next = self.next
    ptr.prev = self
    self.next?.prev = ptr
    self.next = ptr
  }
  
  func delete() -> Node {
    self.next?.prev = self.prev
    self.prev?.next = self.next
    
    return self
  }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
  var isValid = [Bool](repeating: false, count: n)
  let head = Node(-1), tail = Node(-1)
  head.next = tail
  tail.prev = head
  
  var cur = head
  var start = head
  
  for i in 0 ..< n {
    let node = Node(i)
    
    if i == k { start = node }
    
    cur.add(node)
    cur = cur.next!
  }
  
  cur = start
  
  var stack = [Node]()
  
  for str in cmd {
    let c = str.split(separator: " ").map { String($0) }
    
    switch c[0] {
    case "U":
      for _ in 0 ..< Int(c[1])! {
        if cur.prev?.num == -1 { break }
        
        cur = cur.prev!
      }
    case "D":
      for _ in 0 ..< Int(c[1])! {
        if cur.next?.num == -1 { break }
        
        cur = cur.next!
      }
    case "C":
      let target = cur
      if cur.next?.num == -1 {
        cur = cur.prev!
      } else {
        cur = cur.next!
      }
      
      stack.append(target.delete())
    case "Z":
      if stack.isEmpty { break }
      
      let target = stack.removeLast()
      
      target.prev?.add(target)
    default:
      break
    }
  }
  
  cur = head
  
  while cur.next! !== tail {
    isValid[cur.next!.num] = true
    cur = cur.next!
  }
  
  var answer = ""
  
  for i in 0 ..< n {
    answer += isValid[i] ? "O" : "X"
  }
  
  return answer
}


print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]  ))
