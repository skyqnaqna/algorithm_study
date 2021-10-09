/*
 21.10.09
 백준 15787 기차가 어둠을 헤치고 은하수를
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var trains = [[String]](repeating: [String](repeating: "x", count: 20), count: n)
var states = Set<String>()

func push(_ i: Int, _ x: Int) {
  if trains[i][x] == "x" {
    trains[i][x] = "o"
  }
}

func pop(_ i: Int, _ x: Int) {
  if trains[i][x] == "o" {
    trains[i][x] = "x"
  }
}

func rotateRight(_ i: Int) {
  for j in stride(from: 19, to: 0, by: -1) {
    trains[i][j] = trains[i][j-1]
  }
  trains[i][0] = "x"
}

func rotateLeft(_ i: Int) {
  for j in 0 ..< 19 {
    trains[i][j] = trains[i][j+1]
  }
  trains[i][19] = "x"
}

for _ in 0 ..< m {
  let q = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  let i = q[1] - 1
  
  switch q[0] {
  case 1:
    let x = q[2] - 1
    push(i, x)
  case 2:
    let x = q[2] - 1
    pop(i, x)
  case 3:
    rotateRight(i)
  case 4:
    rotateLeft(i)
  default:
    break
  }
}

var answer = 0
for i in 0 ..< n {
  let state = trains[i].joined()
  
  if !states.contains(state) {
    states.insert(state)
    answer += 1
  }
}

print(answer)
