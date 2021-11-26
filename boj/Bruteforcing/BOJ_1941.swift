/*
 백준 1941 소문난 칠공주
 21.11.26
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var graph = [[String]](repeating: [String](), count: 5)
var answer = 0

for i in 0 ..< 5 {
  graph[i] = readLine()!.map { String($0) }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < 5 && 0 <= c && c < 5
}

// a를 이진수로 표현할 때 1의 개수가 7개(7명을 뽑는 경우)인지 확인
func countBit(_ a: Int) -> Bool {
  var cnt = 0, x = a
  
  while x > 0 {
    x &= (x - 1)
    cnt += 1
  }
  
  return cnt == 7
}

/*
 graph[r][c] -> bits[r * 5 + c % 5]
 bits[i] -> graph[i / 5][i % 5]
 */
// 7명을 골랐을 때 서로 인접해있고 다솜파가 4명 이상인지 확인
func checkLinked(_ index: Int, _ state: Int) -> Bool {
  let row = index / 5, col = index % 5
  var cnt = 1, s = 0
  var visited = [Bool](repeating: false, count: 25)
  var q = [(Int, Int)](), front = 0
  
  s += graph[row][col] == "S" ? 1 : 0
  visited[index] = true
  q.append((row, col))
  
  while front < q.count {
    let (r, c) = q[front]
    front += 1
    
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx
      let idx = nr * 5 + nc % 5
      
      if !inBound(nr, nc) || visited[idx] || (state & (1 << idx)) == 0 { continue }
      
      q.append((nr, nc))
      visited[idx] = true
      cnt += 1
      s += graph[nr][nc] == "S" ? 1 : 0
    }
  }
  
  return cnt == 7 && s >= 4
}


// 모든 경우 탐색
for state in 1 ..< (1 << 25) {
  if !countBit(state) { continue }
  
  for i in 0 ..< 25 {
    if (state & (1 << i)) != 0 {
      if checkLinked(i, state) { answer += 1 }
      
      break
    }
  }
}

print(answer)
