/*
 백준 3709 Laserbox
 23.02.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]
let t = Int(readLine()!)!

var answer = ""

for _ in 0 ..< t {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let n = input[0], m = input[1]

  func inBound(_ r: Int, _ c: Int) -> Bool {
    return 1 ... n ~= r && 1 ... n ~= c
  }

  var graph = [[Bool]](repeating: [Bool](repeating: false, count: n + 2), count: n + 2)
  var isVisited = [[[Bool]]](repeating:
                              [[Bool]](repeating:
                                                  [Bool](repeating: false, count: n + 2),
                                       count: n + 2),
                             count: 4)

  for _ in 0 ..< m {
    let i = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[i[0]][i[1]] = true
  }

  let start = readLine()!.split(separator: " ").map { Int(String($0))! }
  var dir: Int {
    if start[0] == n + 1 { return 0 }
    else if start[1] == 0 { return 1 }
    else if start[0] == 0 { return 2 }
    else { return 3 }
  }

  var res = (0, 0)
  var q = [(Int, Int, Int)](), front = 0
  q.append((start[0], start[1], dir))
  isVisited[dir][start[0]][start[1]] = true

  while front < q.count {
    var (r, c, d) = q[front]
    front += 1

    if graph[r][c] {
      d = (d + 1) % 4
    }

    let nr = r + direction[d].0
    let nc = c + direction[d].1

    if !inBound(nr, nc) {
      res = (nr, nc)
      break
    }

    if isVisited[d][nr][nc] { break }

    isVisited[d][nr][nc] = true
    q.append((nr, nc, d))
  }

  answer += "\(res.0) \(res.1)\n"
}

print(answer)
