/*
 백준 2174 로봇 시뮬레이션
 22.09.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let a = input[0], b = input[1]

input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]
var graph = [[Int]](repeating: [Int](repeating: -1, count: a), count: b)
var result = "OK"

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < b && 0 <= c && c < a
}

// 그래프를 x축 기준으로 뒤집기 때문에 N과 S를 반대로 반환
func directionIndex(_ str: String) -> Int {
  switch str {
  case "N":
    return 2
  case "E":
    return 1
  case "S":
    return 0
  default:
    return 3
  }
}

func turnRobot(_ idx: Int, _ dir: String, _ cnt: Int) {
  let (r, c, d) = robots[idx]

  // 뒤집어진 그래프이므로 왼쪽은 오른쪽으로, 오른쪽은 왼쪽으로 돌려야함
  if dir == "R" {
    robots[idx] = (r, c, (d - cnt + 4) % 4)
  } else {
    robots[idx] = (r, c, (d + cnt) % 4)
  }
}

func moveRobot(_ idx: Int, _ cnt: Int) -> Bool {

  var (r, c, d) = robots[idx]

  for _ in 0 ..< cnt {
    let nr = r + direction[d].0
    let nc = c + direction[d].1

    if !inBound(nr, nc) {
      result = "Robot \(idx + 1) crashes into the wall"
      return true
    }

    if graph[nr][nc] >= 0 {
      result = "Robot \(idx + 1) crashes into robot \(graph[nr][nc] + 1)"
      return true
    }

    graph[r][c] = -1
    r = nr
    c = nc
    graph[r][c] = idx
  }

  // 로봇의 변경된 정보 갱신
  robots[idx] = (r, c, d)

  return false
}

var robots = [(Int, Int, Int)]()

for i in 0 ..< n {
  let j = readLine()!.split(separator: " ").map { String($0) }
  let r = Int(j[1])! - 1, c = Int(j[0])! - 1

  graph[r][c] = i
  robots.append((r, c, directionIndex(j[2])))
}

var error = false
for _ in 0 ..< m {
  let i = readLine()!.split(separator: " ").map { String($0) }

  if error { continue }

  if i[1] == "F" {
    error = moveRobot(Int(i[0])! - 1, Int(i[2])!)
  } else {
    turnRobot(Int(i[0])! - 1, i[1], Int(i[2])! % 4)
  }
}

print(result)
