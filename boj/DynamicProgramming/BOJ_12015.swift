/*
 백준 12015 가장 긴 증가하는 부분 수열 2
 21.08.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation


let n = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

func lowerBound(_ x: Int, _ a: [Int]) -> Int {
  var m = 0, l = 0, r = a.count

  while l < r {
    m = (l + r) / 2

    if a[m] < x {
      l = m + 1
    } else {
      r = m
    }
  }

  return r
}

var ans = [Int]()
ans.append(arr[0])

for i in 1 ..< arr.count {
  if arr[i] <= ans.last! {
    let pos = lowerBound(arr[i], ans)
    ans[pos] = arr[i]
  } else {
    ans.append(arr[i])
  }
}

print(ans.count)
