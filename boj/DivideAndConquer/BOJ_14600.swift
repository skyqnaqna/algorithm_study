/*
 백준 14600 샤워실 바닥 깔기 (Small)
 22.01.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let k = Int(readLine()!)!
let n = 1 << k

let input = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
let row = input[0], col = input[1]

var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
graph[row][col] = -1
var num = 0

func checkFill(_ size: Int, _ r: Int, _ c: Int) -> Bool {
  for i in 0 ..< size {
    for j in 0 ..< size {
      if graph[r + i][c + j] != 0 { return false }
    }
  }
  return true
}

func tromino(_ size: Int, _ r: Int, _ c: Int) {
  
  num += 1
  let half = size / 2
  
  if checkFill(half, r, c) { graph[r + half - 1][c + half - 1] = num }
  if checkFill(half, r, c + half) { graph[r + half - 1][c + half] = num }
  if checkFill(half, r + half, c) { graph[r + half][c + half - 1] = num }
  if checkFill(half, r + half, c + half) { graph[r + half][c + half] = num }
  
  if size == 2 { return }
  
  tromino(half, r , c)
  tromino(half, r, c + half)
  tromino(half, r + half, c)
  tromino(half, r + half, c + half)
}

tromino(n, 0, 0)

for j in stride(from: n - 1, through: 0, by: -1) {
  for i in 0 ..< n {
    print(graph[i][j], terminator: " ")
  }
  print()
}
