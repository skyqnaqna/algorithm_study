/*
 백준 15999 뒤집기
 22.04.22
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let MOD = Int(1e9) + 7
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

func pow(_ a: Int, _ b: Int) -> Int {
  var res = 1
  , base = a
  , x = b
  
  while x > 0 {
    if x & 1 != 0 {
      res = (res * base) % MOD
    }
    base = (base * base) % MOD
    x >>= 1
  }
  
  return res
}

var graph = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for i in 0 ..< n {
  let row = readLine()!.map { String($0) }
  
  for j in 0 ..< m {
    if row[j] == "W" {
      graph[i][j] = true
    }
  }
}

var cnt = 0

for i in 0 ..< n {
  for j in 0 ..< m {
    var isValid = true
    
    for k in 0 ..< 4 {
      let r = i + direction[k].0
      let c = j + direction[k].1
      
      if !inBound(r, c) { continue }
      
      if graph[i][j] != graph[r][c] {
        isValid = false
        break
      }
    }
    
    if isValid {
      cnt += 1
    }
  }
}

print(pow(2, cnt) % MOD)
