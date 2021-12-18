/*
 백준 10885 수열의 장인
 21.12.18
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var t = Int(readLine()!)!
var answer = ""
let MOD = Int(1e9) + 7

while t > 0 {
  t -= 1
  
  let n = Int(readLine()!)!
  let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  var maxCnt = 0, twoCnt = 0, negativeCnt = 0, ans = 0
  
  for i in 0 ..< n {
    if arr[i] == 0 {
      twoCnt = 0
      negativeCnt = 0
      continue
    } else if arr[i] < 0 {
      negativeCnt += 1
      
      if arr[i] == -2 {
        twoCnt += 1
      }
    } else if arr[i] == 2 {
      twoCnt += 1
    }
    
    if negativeCnt % 2 == 0 {
      maxCnt = max(maxCnt, twoCnt)
      ans = 1
    }
  }
  
  twoCnt = 0
  negativeCnt = 0
  for i in stride(from: n - 1, through: 0, by: -1) {
    if arr[i] == 0 {
      twoCnt = 0
      negativeCnt = 0
      continue
    } else if arr[i] < 0 {
      negativeCnt += 1
      
      if arr[i] == -2 {
        twoCnt += 1
      }
    } else if arr[i] == 2 {
      twoCnt += 1
    }
    
    if negativeCnt % 2 == 0 {
      maxCnt = max(maxCnt, twoCnt)
      ans = 1
    }
  }
  
  while maxCnt > 0 {
    ans = (ans << 1) % MOD
    maxCnt -= 1
  }
  
  answer += "\(ans)\n"
}

print(answer)
