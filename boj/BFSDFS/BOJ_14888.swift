// 백준 14888 연산자 끼워넣기
// 21.05.13

import Foundation

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int(String($0))! }
var operators = readLine()!.split(separator: " ").map { Int(String($0))! }
var max = -Int(1e9)
var min = Int(1e9)

func dfs(_ indexOfA: Int, _ sum: Int) {
  if indexOfA == n - 1 {
    if sum > max {
      max = sum
    }
    if sum < min {
      min = sum
    }
    return
  }

  for i in 0..<4 {
    if operators[i] > 0 {
      operators[i] -= 1
      let nextIndex = indexOfA + 1
      switch i {
      case 0: dfs(nextIndex, sum + a[nextIndex])
      case 1: dfs(nextIndex, sum - a[nextIndex])
      case 2: dfs(nextIndex, sum * a[nextIndex])
      case 3: dfs(nextIndex, sum / a[nextIndex])
      default: break
      }
      operators[i] += 1
    }
  }
}

dfs(0, a[0])

print(max, min, separator: "\n")