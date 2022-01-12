/*
 백준 1976 여행 가자
 22.01.12
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](), count: n)

(0..<n).forEach{ graph[$0] = readLine()!.split(separator: " ").map { Int(String($0))! }}

let plan = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }

for k in 0 ..< n {
  graph[k][k] = 1
  for i in 0 ..< n {
    for j in 0 ..< n {
      if graph[i][k] == 1 && graph[k][j] == 1 {
        graph[i][j] = 1
      }
    }
  }
}

var valid = true
for i in 0 ..< m - 1 {
  let u = plan[i], v = plan[i + 1]
  if graph[u][v] != 1 {
    valid = false
    break
  }
}

if valid {
  print("YES")
} else {
  print("NO")
}
