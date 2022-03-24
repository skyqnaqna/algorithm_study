/*
 프로그래머스 디스크 컨트롤러
 22.03.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var readyQ = [(Int, Int)](repeating: (0, 0), count: 500)
var heapSize = 0
var workingQ = [(Int, Int)]()

func heapPush(_ start: Int, _ times: Int) {
  readyQ[heapSize] = (start, times)
  var cur = heapSize
  while cur > 0 && readyQ[cur].1 <= readyQ[(cur - 1) / 2].1 {
    if readyQ[cur].1 == readyQ[(cur - 1) / 2].1 && readyQ[cur].0 > readyQ[(cur - 1) / 2].0 {
      break
    }
    
    let temp = readyQ[(cur - 1) / 2]
    readyQ[(cur - 1) / 2] = readyQ[cur]
    readyQ[cur] = temp
    cur = (cur - 1) / 2
  }
  
  heapSize += 1
}

func heapPop() -> (Int, Int) {
  let res = readyQ[0]
  heapSize -= 1
  readyQ[0] = readyQ[heapSize]
  var cur = 0
  
  while cur * 2 + 1 < heapSize {
    var child = -1
    if cur * 2 + 2 == heapSize {
      child = cur * 2 + 1
    } else {
      if readyQ[cur * 2 + 1].1 == readyQ[cur * 2 + 2].1 {
        child = readyQ[cur * 2 + 1].0 < readyQ[cur * 2 + 2].0 ? cur * 2 + 1 : cur * 2 + 2
      } else {
        child = readyQ[cur * 2 + 1].1 < readyQ[cur * 2 + 2].1 ? cur * 2 + 1 : cur * 2 + 2
      }
    }
    
    if readyQ[cur].1 < readyQ[child].1 { break }
    if readyQ[cur].1 == readyQ[child].1 && readyQ[cur].0 < readyQ[child].0 { break }
    
    let temp = readyQ[child]
    readyQ[child] = readyQ[cur]
    readyQ[cur] = temp
    cur = child
  }
  
  return res
}

func solution(_ _jobs:[[Int]]) -> Int {
  var jobs = _jobs.sorted(by: { $0[0] > $1[0] })
  var time = 0
  var answer = 0
  
  while true {
    if workingQ.isEmpty && heapSize == 0 && jobs.isEmpty { break }
    
    // 현재 끝나는 작업 있는지 확인
    if !workingQ.isEmpty && workingQ[0].1 == time {
      answer += workingQ[0].1 - workingQ[0].0
      workingQ.removeLast()
    }
    // 대기 큐에 넣을 수 있는 작업 확인
    while !jobs.isEmpty && jobs.last![0] <= time {
      heapPush(jobs.last![0], jobs.last![1])
      jobs.removeLast()
    }
    // 작업 큐가 비어있다면 대기 큐에서 넣기
    if workingQ.isEmpty && heapSize > 0 {
      let (start, times) = heapPop()
      workingQ.append((start, time + times))
    }
    
    time += 1
  }
  
  return answer / _jobs.count
}

print(solution([[0, 3], [1, 9], [2, 6]]  ))
