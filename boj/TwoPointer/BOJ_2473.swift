/*
 백준 2473 세 용액
 21.08.10
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

arr.sort()

var first = 0, second = 0, third = 0, minSum = Int(4e9)

for i in 0 ..< n - 2 {
  var left = i + 1, right = n - 1;

  while left < right {
    let tempSum = arr[i] + arr[left] + arr[right]

    if abs(tempSum) < minSum {
      minSum = abs(tempSum)
      first = i; second = left; third = right
    }

    if tempSum > 0 {
      right -= 1
    } else {
      left += 1
    }
  }
}

print(arr[first], arr[second], arr[third])