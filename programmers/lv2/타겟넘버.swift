// 프로그래머스 타겟 넘버
// 21.04.23

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
  
  func dfs(_ i: Int, _ sum: Int) -> Int {
    if i == numbers.count - 1 {
      if sum == target {
        return 1
      } else {
        return 0
      }
    }
    return dfs(i + 1, sum + numbers[i + 1]) + dfs(i + 1, sum - numbers[i + 1])
  }
  
  return dfs(0, numbers[0]) + dfs(0, -numbers[0])
}
