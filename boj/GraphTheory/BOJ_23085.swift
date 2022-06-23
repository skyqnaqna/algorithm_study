/*
 백준 23085 판치기
 22.06.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]

var dist = [[Int]](repeating: [Int](repeating: -1, count: n + 1), count: n + 1)
var h = 0, t = 0

let coins = readLine()!.map { String($0) }

for coin in coins {
  if coin == "H" {
    h += 1
  } else {
    t += 1
  }
}

dist[h][t] = 0
var q = [(Int, Int)](), front = 0

q.append((h, t))

while front < q.count {
  let (H, T) = q[front]
  front += 1
  
  for nextH in 0 ... k {
    let nextT = k - nextH
    
    if H < nextH || T < nextT { continue }
    
    let nh = H - nextH + nextT
    let nt = T - nextT + nextH
    
    
    if dist[nh][nt] == -1 {
      dist[nh][nt] = dist[H][T] + 1
      q.append((nh, nt))
    }
  }
}

print(dist[0][n])
