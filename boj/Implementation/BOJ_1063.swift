/*
 백준 1063 킹
 23.02.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let dir = ["R": (0, 1),
           "L": (0, -1),
           "B": (-1, 0),
           "T": (1, 0),
           "RT": (1, 1),
           "LT": (1, -1),
           "RB":(-1, 1),
           "LB": (-1, -1)]

let asciiVal = Int(Character("A").asciiValue!)

let input = readLine()!.split(separator: " ").map { String($0) }
let n = Int(input[2])!

func getPosition(_ str: String) -> (Int, Int) {
  var row = 0, col = 0

  let arr = str.map { String($0) }

  row = Int(arr[1])!
  col = Int(Character(arr[0]).asciiValue!) - asciiVal

  return (row, col)
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 1 ... 8 ~= r && 0 ..< 8 ~= c
}

var king = getPosition(input[0])
var stone = getPosition(input[1])

for _ in 0 ..< n {
  let i = readLine()!

  if let (dy, dx) = dir[i] {
    let nr = king.0 + dy
    let nc = king.1 + dx

    if !inBound(nr, nc) { continue }
    if stone == (nr, nc) {
      let sr = stone.0 + dy
      let sc = stone.1 + dx

      if !inBound(sr, sc) { continue }

      stone = (sr, sc)
    }
    king = (nr, nc)
  }
}

var answer = ""

answer += String(UnicodeScalar(asciiVal + king.1)!) + String(king.0) + "\n"
answer += String(UnicodeScalar(asciiVal + stone.1)!) + String(stone.0)

print(answer)
