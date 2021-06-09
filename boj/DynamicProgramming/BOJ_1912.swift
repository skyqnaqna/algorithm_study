/*
 백준 1912 연속합
 21.06.09
 https://github.com/skyqnaqna/algorithm_study
 */

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = [Int](repeating: 0, count: n)
dp[0] = numbers[0]

var answer = dp[0]

for i in 1..<n {
  dp[i] = max(dp[i - 1] + numbers[i], numbers[i])
  if dp[i] > answer {
    answer = dp[i]
  }
}

print(answer)