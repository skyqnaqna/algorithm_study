// 백준 18353 병사 배치하기
// 21.05.26

import Foundation

func getPos(_ target: Int, _ arr: [Int]) -> Int {
  var left = 0
  var right = arr.count - 1
  var mid = (left + right) / 2

  while left < right {
    if arr[mid] > target {
      left = mid + 1
    } else {
      right = mid
    }

    mid = (left + right) / 2
  }

  return right
}

let n = Int(readLine()!)!
var before = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int]()
dp.append(before[0])

var answer = 0

for i in 1..<n {
  if dp.last! > before[i] {
    dp.append(before[i])
  } else {
    let pos = getPos(before[i], dp)

    dp[pos] = before[i]
    answer += 1
  }
}

print(answer)
