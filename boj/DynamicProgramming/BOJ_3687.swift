/*
 21.10.02
 백준 3687 성냥개비
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

// 성냥 2개부터 8개까지 최소 숫자 초기화
let minStick = [2: "1", 3: "7", 4: "4", 5: "2", 6: "6", 7: "8", 8: "10"]

var t = Int(readLine()!)!

var dp = [[String]](repeating: [String](repeating: "", count: 2), count: 101)

// 0: min, 1: max
dp[2][0] = "1"
dp[2][1] = "1"

dp[3][0] = "7"
dp[3][1] = "7"

for i in 4 ... 100 {
  // 4 <= i <= 8 까지 수행
  if let cnt = minStick[i] {
    dp[i][0] = cnt
    
  } else {
    // 성냥 100개일 1로는 50자리 수가 나오지만 최소인 경우는 (대충) 8로 14.~ 이므로 long long 범위 내에서 구함
    var minVal: Int64 = 0
    
    // 2 ~ i - 2 까지의 조합으로 문자열을 앞뒤로 붙여서 작은 수를 구할 것
    for j in 2 ... i / 2 {
      var tempMin: Int64, tempA: Int64?, tempB: Int64?
      
      // minStick에서 6개를 사용해서 만드는 최소 수는 6이지만 첫번째 자릿수를 제외하면 0이 최소임
      if j == 6 {
        tempA = Int64(dp[i-j][0] + "0")
      }
      if i-j == 6 {
        tempB = Int64(dp[j][0] + "0")
      }
      
      // tempA와 tempB가 있는 경우 즉, 6개를 사용하는 경우를 판별해서 최소 수를 구함
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
  
  // max값은 2번째 전 수에서 1을 이어붙이는 수임
  dp[i][1] = dp[i-2][1] + dp[2][1]
}

var ans = ""
while t > 0 {
  t -= 1
  
  let n = Int(readLine()!)!
  
  ans.append(dp[n].joined(separator: " ") + "\n")
}

print(ans)

