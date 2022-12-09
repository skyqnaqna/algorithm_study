/*
 백준 17265 나의 인생에는 수학과 함께
 22.12.09
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let n = Int(readLine()!)!

var graph = [[String]]()

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map { String($0) })
}

var maxVal = -Int(1e9)
var minVal = Int(1e9)

func isNumber(_ str: String) -> Bool {
  if str == "+" || str == "-" || str == "*" {
    return false
  }

  return true
}

func calculate(_ n1: Int, _ n2: Int, _ op: String) -> Int {
  if op == "+" {
    return n1 + n2
  } else if op == "-" {
    return n1 - n2
  } else {
    return n1 * n2
  }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < n
}

func recursive(_ r: Int, _ c: Int, _ val: Int, _ op: String) {
  if r == n - 1 && c == n - 1 {
    maxVal = max(maxVal, val)
    minVal = min(minVal, val)

    return
  }

  if inBound(r + 1, c) {
    if isNumber(graph[r + 1][c]) {
      recursive(r + 1, c, calculate(val, Int(graph[r + 1][c])!, op), "")
    } else {
      recursive(r + 1, c, val, graph[r + 1][c])
    }
  }

  if inBound(r, c + 1) {
    if isNumber(graph[r][c + 1]) {
      recursive(r, c + 1, calculate(val, Int(graph[r][c + 1])!, op), "")
    } else {
      recursive(r, c + 1, val, graph[r][c + 1])
    }
  }
}

recursive(0, 0, Int(graph[0][0])!, "")

print(maxVal, minVal, separator: " ")
