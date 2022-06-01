/*
 백준 23843 콘센트
 22.06.01
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var heap = [UInt64](repeating: 0, count: 10)
var size = 0

func heapPush(_ x: UInt64) {
  heap[size] = x
  var cur = size
  
  while cur > 0 && heap[cur] < heap[(cur - 1) / 2] {
    let temp = heap[(cur - 1) / 2]
    heap[(cur - 1) / 2] = heap[cur]
    heap[cur] = temp
    cur = (cur - 1) / 2
  }
  
  size += 1
}

func heapPop() -> UInt64 {
  let res = heap[0]
  size -= 1
  heap[0] = heap[size]
  
  var cur = 0
  while cur * 2 + 1 < size {
    var child = 0, left = cur * 2 + 1, right = cur * 2 + 2
    
    if right == size {
      child = left
    } else {
      child = heap[left] < heap[right] ? left : right
    }
    
    if heap[cur] < heap[child] { break }
    
    let temp = heap[child]
    heap[child] = heap[cur]
    heap[cur] = temp
    cur = child
  }
  
  return res
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var arr = readLine()!.split(separator: " ").map { UInt64(String($0))! }.sorted(by: <)

if m == 1 {
  print(arr.reduce(0, +))
} else if n <= m {
  print(arr.last!)
} else {
  var answer: UInt64 = 0
  
  for _ in 0 ..< m {
    heapPush(arr.removeLast())
  }
  
  // 1. 작은거에서 다음거 더해가면서 구하기
//  for _ in m ..< n {
//    let next = heapPop() + arr.removeLast()
//    heapPush(next)
//  }
  
//  while size > 0 {
//    answer = heapPop()
//  }
  
  // 2. 작은값을 빼면서 구하기
  while size > 0 {
    let min = heapPop()
    answer += min
    var temp = [UInt64]()

    for _ in 0 ..< size {
      var now = heapPop()

      now -= min

      if now > 0 {
        temp.append(now)
      }
    }
    
    while !temp.isEmpty {
      heapPush(temp.removeLast())
    }

    while !arr.isEmpty && size < m {
      heapPush(arr.removeLast())
    }
  }
  
  print(answer)
}
