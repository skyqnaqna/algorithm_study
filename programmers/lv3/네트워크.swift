// 프로그래머스 네트워크
// 21.04.23

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
  var visited = [Bool](repeating: false, count: n)

  func dfs(_ u: Int) {
    for v in 0..<n {
      if computers[u][v] == 1 && !visited[v] {
        visited[v] = true
        dfs(v)
      }
    }
  }
  
  var ans = 0
  for i in 0..<n {
    if !visited[i] {
      visited[i] = true
      dfs(i)
      ans += 1
    }
  }
  
  return ans
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]))
