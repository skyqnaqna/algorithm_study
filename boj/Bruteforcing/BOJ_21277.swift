/*
 백준 21277 짠돌이 호석
 21.11.25
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var answer = Int(1e9)

var graph = [[Int]](repeating: [Int](repeating: 0, count: 151), count: 151)

var input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n1 = input[0], m1 = input[1]

// 첫번째 퍼즐을 (50, 50)에 위치시킴
for i in 0 ..< n1 {
  let p = readLine()!.map { Int(String($0))! }
  
  for j in 0 ..< m1 {
    graph[i + 50][j + 50] = p[j]
  }
}

input = readLine()!.split(separator: " ").map { Int(String($0))! }

var n2 = input[0], m2 = input[1]
var puzzle = [[Int]](repeating: [Int](), count: n2)

for i in 0 ..< n2 {
  puzzle[i] = readLine()!.map { Int(String($0))! }
}

// rotate right
func rotate() -> [[Int]] {
  var rotated = [[Int]](repeating: [Int](), count: puzzle[0].count)
  
  for j in 0 ..< puzzle[0].count {
    var temp = [Int]()
    for i in (0 ..< puzzle.count).reversed() {
      temp.append(puzzle[i][j])
    }
    rotated[j] = temp
  }
  
  return rotated
}

func solution() {
  // (r1, c1)을 시작점으로 puzzle을 graph에 겹칠 수 있는지 확인
  // 50 - n2 <= r1 <= 50 + n1
  // 50 - m2 <= c1 <= 50 + m1
  let r1 = 50 - n2, c1 = 50 - m2
  
  for i in r1 ... 50 + n1 {
    for j in c1 ... 50 + m1 {
      let r2 = i + n2 - 1
      let c2 = j + m2 - 1
      var valid = true
      
      for r in 0 ..< n2 {
        if !valid { break }
        for c in 0 ..< m2 {
          if graph[i + r][j + c] + puzzle[r][c] > 1 {
            valid = false
            break
          }
        }
      }
      
      if valid {
        let lenOfRow = max(c2, 50 + m1 - 1) - min(j, 50) + 1
        let lenOfCol = max(r2, 50 + n1 - 1) - min(i, 50) + 1
        
        answer = min(answer, lenOfRow * lenOfCol)
      }
    }
  }
}

for _ in 0 ..< 4 {
  solution()
  puzzle = rotate()
  swap(&n2, &m2)
}

print(answer)
