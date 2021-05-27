// 백준 14501 퇴사
// 21.05.26

import Foundation

let n = Int(readLine()!)!
var schedule = [[Int]](repeating: [Int](), count: n)

for i in 0..<n {
  schedule[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func getProfit(_ today: Int, _ cost: Int, _ schedule: [[Int]]) -> Int {
  if today > n {
    return 0
  } else if today == n {
    return cost
  } else {
    return max(getProfit(today + schedule[today][0], cost + schedule[today][1], schedule), getProfit(today + 1, cost, schedule))
  }
}

print(getProfit(0, 0, schedule))