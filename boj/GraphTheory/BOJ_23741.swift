/*
 백준 23741 야바위 게임
 22.06.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1], x = input[2], y = input[3]

var graph = [[Int]](repeating: [Int](), count: n + 1)
var dist = [[Int]](repeating: [Int](repeating: -1, count: 2), count: n + 1)

for _ in 0 ..< m {
  let e = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  graph[e[0]].append(e[1])
  graph[e[1]].append(e[0])
}

var q = [(Int, Int)](), front = 0

dist[x][0] = 0
q.append((x, 0))

var answer = [Int]()

// 이동 거리가 홀수인지 짝수인지 따로 구한다
// y가 홀수인지 짝수인지에 따라 후보가 될 수 있음
while front < q.count {
  let (now, cnt) = q[front]
  front += 1
  
  let i = (cnt + 1) % 2
  
  for next in graph[now] {
    if dist[next][i] > -1 { continue }
    
    dist[next][i] = cnt + 1
    q.append((next, cnt + 1))
  }
}

let j = y % 2
for i in 1 ... n {
  if dist[i][j] > -1 && dist[i][j] <= y {
    answer.append(i)
  }
}

if graph[x].isEmpty || answer.isEmpty { print(-1) }
else { print(answer.map { String($0) }.joined(separator: " "))}
