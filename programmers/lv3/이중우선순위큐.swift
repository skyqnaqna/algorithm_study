/*
 프로그래머스 이중우선순위큐
 22.03.25
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let MAX = 1000001

var numDict = [Int: Int]()
var minHeap = [Int](repeating: 0, count: MAX)
var maxHeap = [Int](repeating: 0, count: MAX)
var minSize = 0, maxSize = 0

func heapPush(_ num: Int) {
  minHeap[minSize] = num
  var cur = minSize
  
  while cur > 0 && minHeap[cur] < minHeap[(cur - 1) / 2] {
    let temp = minHeap[(cur - 1) / 2]
    minHeap[(cur - 1) / 2] = minHeap[cur]
    minHeap[cur] = temp
    cur = (cur - 1) / 2
  }
  
  minSize += 1
  
  maxHeap[maxSize] = num
  cur = maxSize
  
  while cur > 0 && maxHeap[cur] > maxHeap[(cur - 1) / 2] {
    let temp = maxHeap[(cur - 1) / 2]
    maxHeap[(cur - 1) / 2] = maxHeap[cur]
    maxHeap[cur] = temp
    cur = (cur - 1) / 2
  }
  
  maxSize += 1
}

func heapPop(_ isMin: Bool) -> Int {
  var res = 0
  if isMin {
    res = minHeap[0]
    minSize -= 1
    minHeap[0] = minHeap[minSize]
    var cur = 0
    
    while cur * 2 + 1 < minSize {
      var child = 0
      let left = cur * 2 + 1, right = cur * 2 + 2
      
      if right == minSize {
        child = left
      } else {
        child = minHeap[left] < minHeap[right] ? left : right
      }
      
      if minHeap[cur] < minHeap[child] { break }
      
      let temp = minHeap[child]
      minHeap[child] = minHeap[cur]
      minHeap[cur] = temp
      cur = child
    }
  } else {
    res = maxHeap[0]
    maxSize -= 1
    maxHeap[0] = maxHeap[maxSize]
    var cur = 0
    
    while cur * 2 + 1 < maxSize {
      var child = 0
      let left = cur * 2 + 1, right = cur * 2 + 2
      
      if right == maxSize {
        child = left
      } else {
        child = maxHeap[left] > maxHeap[right] ? left : right
      }
      
      if maxHeap[cur] > maxHeap[child] { break }
      
      let temp = maxHeap[child]
      maxHeap[child] = maxHeap[cur]
      maxHeap[cur] = temp
      cur = child
    }
  }
  
  return res
}

func solution(_ operations:[String]) -> [Int] {
  for oper in operations {
    let op = oper.split(separator: " ").map { String($0) }
    
    if op[0] == "I" {
      heapPush(Int(op[1])!)
      numDict[Int(op[1])!, default: 0] += 1
    } else if op[1] == "1" {
      while maxSize > 0 && (numDict[maxHeap[0]] == nil || numDict[maxHeap[0]] == 0) {
        _ = heapPop(false)
      }
      
      if maxSize > 0 {
        let val = heapPop(false)
        numDict[val]! -= 1
      }
    } else {
      while minSize > 0 && (numDict[minHeap[0]] == nil || numDict[minHeap[0]] == 0) {
        _ = heapPop(true)
      }
      
      if minSize > 0 {
        let val = heapPop(true)
        numDict[val]! -= 1
      }
    }
  }
  
  var minVal = 0, maxVal = 0
  while maxSize > 0 && (numDict[maxHeap[0]] == nil || numDict[maxHeap[0]] == 0) {
    _ = heapPop(false)
  }
  while minSize > 0 && (numDict[minHeap[0]] == nil || numDict[minHeap[0]] == 0) {
    _ = heapPop(true)
  }
  
  
  if maxSize > 0 {
    maxVal = maxHeap[0]
  }
  
  if minSize > 0 {
    minVal = minHeap[0]
  }
  
  return [maxVal, minVal]
}

print(solution(["I 16","D 1"]  ))
print(solution(["I 7","I 5","I -5","D -1"]  ))
