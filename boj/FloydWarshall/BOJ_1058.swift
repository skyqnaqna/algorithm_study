// 백준 1058 친구
// 21.03.27

import Foundation

let n = Int(readLine()!)!

var graph = [[Character]](repeating: [Character](), count: n)

for i in 0..<n {
  let arr = Array(readLine()!)
  
  graph[i] = arr
}

var ans = 0

for i in 0..<n {
  var cnt = 0
  
  for j in 0..<n {
    if i == j { continue }
    
    if graph[i][j] == "Y" {
      cnt += 1
      continue
    }
    
    // i, j가 친구가 아니면 2-친구 관계인지 확인
    for k in 0..<n {
      if graph[i][k] == "Y" && graph[k][j] == "Y" {
        cnt += 1
        break // 2-친구 관계인거 확인했으면 더이상 찾지 않아도 됨
      }
    }
  }
  ans = max(ans, cnt)
}

print(ans)
