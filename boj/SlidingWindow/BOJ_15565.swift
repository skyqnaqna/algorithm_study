/*
 백준 15565 귀여운 라이언
 22.11.25
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], k = input[1]

let arr = readLine()!.split(separator: " ").map { abs(Int(String($0))! - 2) }
var pos = [Int](repeating: 0, count: n + 1)

var answer = n + 1
var sum = 0
var cur = 0

while cur < n {
  sum += arr[cur]
  pos[sum] = cur

  if sum >= k {
    if cur - pos[sum - k] < answer {
      answer = cur - pos[sum - k]
    }
  }

  cur += 1
}

if answer == n + 1 {
  print(-1)
} else {
  print(answer)
}
