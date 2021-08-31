/*
 백준 2015 수들의 합 4
 21.08.31
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var dic = [Int: Int]()

for i in 1 ..< n {
  arr[i] += arr[i - 1]
}

var ans = 0

for i in arr.indices {
  if arr[i] == k {
    ans += 1
  }

  if let val = dic[arr[i] - k] {
    ans += val
  }

//  if let val = dic[arr[i]] {
//    dic.updateValue(val + 1, forKey: arr[i])
//  } else {
//    dic[arr[i]] = 1
//  }
  dic[arr[i], default: 0] += 1
}

print(ans)