/*
 백준 1826 연료 채우기
 22.09.09
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct Heap {
  var arr = [Int]()
  var size = 0
  var isEmpty: Bool { return arr.isEmpty }

  mutating func heapPush(_ element: Int) {
    arr.append(element)
    var cur = size

    while cur > 0 && arr[(cur - 1) / 2] < arr[cur] {
      let temp = arr[(cur - 1) / 2]
      arr[(cur - 1) / 2] = arr[cur]
      arr[cur] = temp
      cur = (cur - 1) / 2
    }

    size += 1
  }

  mutating func heapPop() -> Int {
    let res = arr[0]
    size -= 1
    arr[0] = arr[size]
    arr.removeLast()

    var cur = 0
    while cur * 2 + 1 < size {
      var child = 0, left = cur * 2 + 1, right = cur * 2 + 2
      if right == size {
        child = left
      } else {
        child = arr[left] > arr[right] ? left : right
      }

      if arr[child] < arr[cur] { break }

      let temp = arr[child]
      arr[child] = arr[cur]
      arr[cur] = temp
      cur = child
    }

    return res
  }
}

let n = Int(readLine()!)!

var gasStations = [(Int, Int)]()

for _ in 0 ..< n {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  gasStations.append((input[0], input[1]))
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

gasStations.sort(by: <)

let l = input[0], p = input[1]

var pq = Heap(), now = p, idx = 0, answer = 0

while now < l {
  while idx < n && gasStations[idx].0 <= now {
    pq.heapPush(gasStations[idx].1)
    idx += 1
  }

  if pq.isEmpty {
    answer = -1
    break
  }

  now += pq.heapPop()
  answer += 1
}

print(answer)
