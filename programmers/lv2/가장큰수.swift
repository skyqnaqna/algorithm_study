// 프로그래머스 가장 큰 수
// 21.04.18

import Foundation

func solution(_ numbers:[Int]) -> String {
  var ans = ""
  
  let nums = numbers.sorted(by: {
    String($0) + String($1) > String($1) + String($0)
  })

  if nums[0] == 0 { ans = "0" }
  else {
    for i in nums { ans += String(i) }
  }
  
  return ans
}

print(solution([1, 10, 100]))
