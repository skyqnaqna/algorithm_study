/*
 백준 13023 ABCDE
 21.11.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let INF = Int(2e9)
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](), count: n)

for _ in 0 ..< m {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  graph[i[0]].append(i[1])
  graph[i[1]].append(i[0])
}

func dfs(_ node: Int) -> Bool {
  var res = false
  var visited = [Bool](repeating: false, count: n)
  
  func recursion(_ now: Int, _ depth: Int) {
    if depth == 4 || res {
      res = true
      return
    }
    
    for next in graph[now] {
      if !visited[next] {
        visited[next] = true
        recursion(next, depth + 1)
        visited[next] = false
      }
    }
  }
  
  visited[node] = true
  recursion(node, 0)
  
  return res
}

var answer = 0
for i in 0 ..< n {
  if dfs(i) {
    answer = 1
    break
  }
}

print(answer)
