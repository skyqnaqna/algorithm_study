/*
 백준 13164 행복 유치원
 23.03.01
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var diff = [Int]()

for i in 1 ..< n {
  diff.append(arr[i] - arr[i - 1])
}

diff.sort()

print(diff[..<(n - k)].reduce(0, +)) // n - 1 - (k - 1) = n - k
