/*
 백준 11000 강의실 배정
 22.07.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct Heap {
  var arr = [(Int, Int)](repeating: (0, 0), count: 200000)
  var size = 0
  var isEmpty: Bool { return size == 0 }
  var top: (Int, Int) { return arr[0] }
  
  mutating func heapPush(_ time: (Int, Int)) {
    arr[size] = time
    var cur = size
    while cur > 0 && arr[cur].1 <= arr[(cur - 1) / 2].1 {
      if arr[cur].1 == arr[(cur - 1) / 2].1 &&
          arr[cur].0 > arr[(cur - 1) / 2].1 { break }
      
      let temp = arr[(cur - 1) / 2]
      arr[(cur - 1) / 2] = arr[cur]
      arr[cur] = temp
      cur = (cur - 1) / 2
    }
    
    size += 1
  }
  
  mutating func heapPop() {
    size -= 1
    arr[0] = arr[size]
    var cur = 0
    
    while cur * 2 + 1 < size {
      var child = 0, left = cur * 2 + 1, right = cur * 2 + 2
      if right == size {
        child = left
      } else {
        if arr[left].1 == arr[right].1 {
          child = arr[left].0 < arr[right].0 ? left : right
        } else {
          child = arr[left].1 < arr[right].1 ? left : right
        }
      }
      
      if arr[cur].1 < arr[child].1 { break }
      if arr[cur].1 == arr[child].1 &&
          arr[cur].0 < arr[child].0 { break }
      
      let temp = arr[child]
      arr[child] = arr[cur]
      arr[cur] = temp
      cur = child
    }
  }
}

let n = Int(readLine()!)!

var lessons = [(Int, Int)]()

for _ in 0 ..< n {
  let time = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  lessons.append((time[0], time[1]))
}

lessons.sort(by: <)

var heap = Heap(), answer = 0

var i = 0
while i < n {
  while !heap.isEmpty && heap.top.1 <= lessons[i].0 {
    heap.heapPop()
  }
  heap.heapPush(lessons[i])
  i += 1
  
  if answer < heap.size { answer = heap.size }
}

print(answer)
