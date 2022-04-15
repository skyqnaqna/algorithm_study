/*
 프로그래머스 셔틀버스
 22.04.15
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var heap = [Int](repeating: 0, count: 2000)
var size = 0

func heapPush(_ x: Int) {
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

func heapPop() -> Int {
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
    
    heap.swapAt(cur, child)
    cur = child
  }
  
  return res
}

func convertTime(_ time: String) -> Int {
  let t = time.split(separator: ":")
  let hour = Int(t[0])! * 60
  let minute = Int(t[1])!
  
  return hour + minute
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
  
  for time in timetable {
    heapPush(convertTime(time))
  }
  
  var now = 540
  var answer = 0
  
  for i in 0 ..< n {
    var min = size == 0 ? now : heap[0]
    var max = min
    var cnt = 0
    while size > 0 && cnt < m {
      if heap[0] > now { break }
      if heap[0] < min { min = heap[0] }
      if heap[0] > max { max = heap[0] }
      _ = heapPop()
      cnt += 1
    }
    
    if i == n - 1 {
      if cnt == m {
        answer = min == max ? min - 1 : max - 1
      } else {
        answer = now
      }
    }
    
    now += t
  }
  
  let res = String(format: "%02d:%02d", answer / 60, answer % 60)
  
  return res
}

print(solution(1, 10, 3, ["08:55", "08:55", "08:59"]))
