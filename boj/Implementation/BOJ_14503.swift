/*
 백준 14503 로봇 청소기
 21.08.06
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]
let start = readLine()!.split(separator: " ").map { Int(String($0))! }

var graph = [[Int]](repeating: [Int](), count: n)
var cleared = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var ans = 0

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var now = (r: start[0], c: start[1])
var d = start[2]

while true {
  // 1. 현재 위치 청소
  if !cleared[now.r][now.c] {
    cleared[now.r][now.c] = true
    ans += 1
  }
  var goBack = true

  // 2. 현재 방향에서 왼쪽 방향부터 탐색
  for i in 1 ... 4 {
    let nextDirection = d - i < 0 ? d - i + 4 : d - i
    let next = (r: now.r + direction[nextDirection].0, c: now.c + direction[nextDirection].1)

    // a. 청소하지 않은 곳이면 그 칸으로 이동하고 1번부터 진행
    if graph[next.r][next.c] == 0 && !cleared[next.r][next.c] {
      now = next
      d = nextDirection
      goBack = false
      break
    }
    // b. 청소할 수 없는 칸이면 그 방향으로 회전하고 2번부터 진행
  }
  // c. 네 방향 모두 청소할 수 없으면 방향 유지한 채로 후진하고 2번부터 진행
  if goBack {
    let nr = now.r + direction[(d + 2) % 4].0
    let nc = now.c + direction[(d + 2) % 4].1

    if graph[nr][nc] == 0 {
      now = (nr, nc)
    } else {
      // d. 후진도 할 수 없으면 종료
      break
    }
  }
}

print(ans)