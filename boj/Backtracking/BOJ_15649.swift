/*
 백준 N과 M (1)
 21.06.29
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let n = input[0], m = input[1]
var visited = [Bool](repeating: false, count: n)
var arr = [Int](repeating: 0, count: m)

func getSequence(_ count: Int) {
  if count == m {
    print(arr.map{ String($0) }.joined(separator: " "))
  } else {
    for i in 0 ..< n {
      if !visited[i] {
        visited[i] = true
        arr[count] = i + 1
        getSequence(count + 1)
        visited[i] = false
      }
    }
  }
}

getSequence(0)
