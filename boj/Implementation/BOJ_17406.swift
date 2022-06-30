/*
 백준 17406 배열 돌리기 4
 22.06.30
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], k = input[2]

var graph = [[Int]]()

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func rotateRight(_ row: Int, _ col: Int, _ s: Int, _ arr: inout [[Int]]) {
  var r1 = row - s, c1 = col - s
  var r2 = row + s, c2 = col + s
  
  while r1 < r2 {
    let len = r2 - r1 + 1
    
    let temp = arr[r1][c1]
    
    for i in 0 ..< len - 1 {
      arr[r1 + i][c1] = arr[r1 + i + 1][c1]
    }
    
    for i in 0 ..< len - 1 {
      arr[r2][c1 + i] = arr[r2][c1 + i + 1]
    }
    
    for i in 0 ..< len - 1 {
      arr[r2 - i][c2] = arr[r2 - i - 1][c2]
    }
    
    for i in 0 ..< len - 1 {
      arr[r1][c2 - i] = arr[r1][c2 - i - 1]
    }
    
    arr[r1][c1 + 1] = temp
    
    r1 += 1
    c1 += 1
    r2 -= 1
    c2 -= 1
  }
}

var query = [(Int, Int, Int)]()
var isUsed = [Bool](repeating: false, count: k)

for _ in 0 ..< k {
  let info = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  query.append((info[0] - 1, info[1] - 1, info[2]))
}

var answer = Int.max
var seq = [Int]()

func getPermutation(_ cnt: Int) {
  if cnt == k {
    var temp = graph
    
    for idx in seq {
      let (r, c, s) = query[idx]
      rotateRight(r, c, s, &temp)
    }
    
    answer = min(answer, temp.map { $0.reduce(0, +) }.min()!)
  }
  
  for i in 0 ..< k {
    if isUsed[i] { continue }
    
    seq.append(i)
    isUsed[i] = true
    getPermutation(cnt + 1)
    seq.removeLast()
    isUsed[i] = false
  }
}

getPermutation(0)

print(answer)
