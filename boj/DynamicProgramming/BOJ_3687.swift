/*
 21.10.02
 백준 3687 성냥개비
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

//let stick = [6, 2, 5, 5, 4, 5, 6, 3, 7, 6]
let minStick = [2: "1", 3: "7", 4: "4", 5: "2", 6: "6", 7: "8", 8: "10"]

var t = Int(readLine()!)!

var dp = [[String]](repeating: [String](repeating: "", count: 2), count: 101)

// 0: min, 1: max
dp[2][0] = "1"
dp[2][1] = "1"

dp[3][0] = "7"
dp[3][1] = "7"

for i in 4 ... 100 {
  if let cnt = minStick[i] {
    dp[i][0] = cnt
  } else {
    var minVal: Int64 = 0
    
    for j in 2 ... i / 2 {
      var tempMin: Int64, tempA: Int64?, tempB: Int64?
      
      if j == 6 {
        tempA = Int64(dp[i-j][0] + "0")
      }
      if i-j == 6 {
        tempB = Int64(dp[j][0] + "0")
      }
      
      if tempA != nil && tempB != nil {
        tempMin = min(tempA!, tempB!)
      } else if tempA != nil {
        tempMin = min(tempA!, Int64(dp[j][0] + dp[i-j][0])!)
      } else if tempB != nil {
        tempMin = min(tempB!, Int64(dp[i-j][0] + dp[j][0])!)
      } else {
        tempMin = min(Int64(dp[i-j][0] + dp[j][0])!, Int64(dp[j][0] + dp[i-j][0])!)
      }
      
      if minVal == 0 {
        minVal = tempMin
      } else {
        minVal = min(minVal, tempMin)
      }
    }
    dp[i][0] = "\(minVal)"
  }
  dp[i][1] = dp[i-2][1] + dp[2][1]
}

//for i in 2 ... 100 {
//  print(dp[i][0], dp[i][1])
//}

var ans = ""
while t > 0 {
  t -= 1
  
  let n = Int(readLine()!)!
  
  ans.append(dp[n].joined(separator: " ") + "\n")
}

print(ans)
