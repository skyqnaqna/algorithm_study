/*
 백준 20438 출석체크
 21.09.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0] + 2, k = input[1], q = input[2], m = input[3]

// true : 출석코드 받음
var students = [Bool](repeating: false, count: n + 1)
// 코드를 받지 못한 학생수 누적
var prefixSum = [Int](repeating: 0, count: n + 1)
// 조는 학생의 입장 번호
var sleeping = Set<Int>()

let sleepArr = readLine()!.split(separator: " ").map { Int(String($0))! }
let code = readLine()!.split(separator: " ").map { Int(String($0))! }

for i in sleepArr {
  sleeping.insert(i)
}

for i in code {
  if sleeping.contains(i) { continue }
  var j = 1
  while i * j <= n {
    if !sleeping.contains(i * j) {
      students[i * j] = true
    }
    j += 1
  }
}

for i in 3 ... n {
  prefixSum[i] += prefixSum[i - 1]
  if !students[i] {
    prefixSum[i] += 1
  }
}

var ans = ""
for _ in 0 ..< m {
  let range = readLine()!.split(separator: " ").map { Int(String($0))! }
  ans += "\(prefixSum[range[1]] - prefixSum[range[0] - 1])\n"
}

print(ans)