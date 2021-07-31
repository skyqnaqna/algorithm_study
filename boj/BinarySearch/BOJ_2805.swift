/*
 백준 2805 나무 자르기
 21.07.31
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0], m = input[1]
let trees = readLine()!.split(separator: " ").map{ Int(String($0))! }

var l = 0, r = trees.max()!, mid = 0, ans = 0

while l <= r {
  mid = (l + r) / 2

  var sum = 0
  for tree in trees {
    if tree < mid { continue }
    sum += tree - mid
  }

  if sum >= m {
    ans = max(ans, mid)
    l = mid + 1
  } else {
    r = mid - 1
  }
}

print(ans)