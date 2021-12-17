/*
 백준 1806 부분합
 21.12.17
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], s = input[1]

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var l = 0, r = 0, sum = 0, answer = arr.count + 1

while l < n {
  if r == n {
    sum -= arr[l]
    l += 1
  } else if sum < s {
    sum += arr[r]
    r += 1
  } else {
    sum -= arr[l]
    l += 1
  }
  
  if sum >= s && r - l < answer {
    answer =  r - l
  }
}

if answer == arr.count + 1 {
  print(0)
} else {
  print(answer)
}
