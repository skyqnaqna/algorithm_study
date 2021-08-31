/*
 백준 19566 수열의 구간 평균
 21.08.31
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]

var arr = readLine()!.split(separator: " ").map { Int(String($0))! - k }

var dic = [Int: Int]()

for i in 1 ..< n {
  arr[i] += arr[i - 1]
}

var ans = 0

for i in arr.indices {
  if arr[i] == 0 {
    ans += 1
  }

  if let val = dic[arr[i]] {
    ans += val
  }

  dic[arr[i], default: 0] += 1
}

print(ans)