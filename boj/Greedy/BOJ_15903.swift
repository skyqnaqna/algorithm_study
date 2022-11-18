/*
 백준 15903 카드 합체 놀이
 22.11.18
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

var heap = [Int]()
var size = 0

func heapPush(_ item: Int) {
  heap.append(item)
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
  heap.swapAt(0, size - 1)
  heap.removeLast()
  size -= 1

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

let nums = readLine()!.split(separator: " ").map { Int(String($0))! }

nums.forEach { heapPush($0) }

for _ in 0 ..< m {
  let a = heapPop()
  let b = heapPop()

  heapPush(a + b)
  heapPush(a + b)
}

var answer = 0

while size > 0 {
  answer += heapPop()
}

print(answer)
