/*
 백준 20166 문자열 지옥에 빠진 호석
 22.12.02
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1), (-1, -1), (-1, 1), (1, -1), (1, 1)]

var words = [String: Int]()

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], k = input[2]

var graph = [[String]]()

for _ in 0 ..< n {
  graph.append(readLine()!.map { String($0) })
}

var queries = [String]()

for _ in 0 ..< k {
  queries.append(readLine()!)
}

func bfs(_ row: Int, _ col: Int) {

  var q = [(Int, Int, String)](), front = 0
  q.append((row, col, graph[row][col]))

  while front < q.count {
    let (r, c, str) = q[front]
    front += 1

    words[str, default: 0] += 1

    if str.count == 5 { continue }

    for (dy, dx) in direction {
      let nr = (r + dy + n) % n
      let nc = (c + dx + m) % m

      q.append((nr, nc, str + graph[nr][nc]))
    }
  }
}

for i in 0 ..< n {
  for j in 0 ..< m {
    bfs(i, j)
  }
}

var answer = ""

for query in queries {
  if let cnt = words[query] {
    answer += "\(cnt)\n"
  } else {
    answer += "\(0)\n"
  }
}

print(answer)

