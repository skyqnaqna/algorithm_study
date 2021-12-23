/*
 백준 1430 공격
 21.12.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Double(String($0))! }

let n = Int(input[0]), r = input[1], d = input[2], x = input[3], y = input[4]

var graph = [(Double, Double)]()
var dist = [Int](repeating: -1, count: n + 1)

graph.append((x, y))
for _ in 0 ..< n {
  let e = readLine()!.split(separator: " ").map { Double(String($0))! }
  graph.append((e[0], e[1]))
}

func getDist(_ from: Int, _ to: Int) -> Double {
  let res = sqrt(pow(graph[from].0 - graph[to].0, 2) + pow(graph[from].1 - graph[to].1, 2))
  
  return res
}

func getDamage(_ cnt: Int) -> Double {
  var energy = d
  for _ in 0 ..< cnt - 1 {
    energy /= 2.0
  }
  return energy
}

var q = [(Int, Int)](), front = 0
q.append((0, 0))
dist[0] = 0

while front < q.count {
  let (now, w) = q[front]
  front += 1
  
  for i in 1 ... n {
    if dist[i] == -1 && getDist(now, i) <= r {
      dist[i] = w + 1
      q.append((i, w + 1))
    }
  }
}

var answer = 0.0
for i in 1 ... n {
  if dist[i] != -1 {
    answer += getDamage(dist[i])
  }
}

print(answer)
