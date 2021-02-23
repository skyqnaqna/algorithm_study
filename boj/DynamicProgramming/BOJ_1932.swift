// 백준 1932 정수 삼각형
// 21.02.24

import Foundation

let n = Int(readLine()!)!
var tri: [[Int]] = []
tri.append(readLine()!.split(separator: " ").map { Int(String($0))! })

for i in stride(from: 1, to: n, by: 1) {
  tri.append(readLine()!.split(separator: " ").map { Int(String($0))! })
  
  for j in stride(from: 0, through: i, by: 1) {
    if j == 0 { tri[i][j] += tri[i-1][0] }
    else if j == i { tri[i][j] += tri[i-1][j-1] }
    else { tri[i][j] += max(tri[i-1][j-1], tri[i-1][j]) }
  }
}

print(tri[n-1].max()!)
