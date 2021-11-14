/*
 백준 14499 주사위 굴리기
 21.11.12
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

class Dice {
  var top = 0, bottom = 0, left = 0, right = 0, above = 0, under = 0
  
  public init() {}
  
  public func getTop() -> Int {
    return self.top
  }
  
  public func setBottom(_ x: Int) {
    self.bottom = x
  }
  
  public func getBottom() -> Int {
    return self.bottom
  }
  
  public func move(_ direction: Int) {
    switch direction {
    case 1:
      let temp = self.right
      right = top
      top = left
      left = bottom
      bottom = temp
    case 2:
      let temp = left
      left = top
      top = right
      right = bottom
      bottom = temp
    case 3:
      let temp = above
      above = top
      top = under
      under = bottom
      bottom = temp
    case 4:
      let temp = bottom
      bottom = under
      under = top
      top = above
      above = temp
    default:
      break
    }
  }
}

let direction = [(0, 1), (0, -1), (-1, 0), (1, 0)]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], x = input[2], y = input[3]
var graph = [[Int]](repeating: [Int](), count: n)
var answer = ""

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

let command = readLine()!.split(separator: " ").map { Int(String($0))! }

var dice = Dice()
var row = x, col = y

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

for cmd in command {
  let nr = row + direction[cmd - 1].0
  let nc = col + direction[cmd - 1].1
  
  if !inBound(nr, nc) { continue }
  
  dice.move(cmd)
  if graph[nr][nc] == 0 {
    graph[nr][nc] = dice.getBottom()
  } else {
    dice.setBottom(graph[nr][nc])
    graph[nr][nc] = 0
  }
  
  answer += "\(dice.getTop())\n"
  row = nr
  col = nc
}

print(answer)
