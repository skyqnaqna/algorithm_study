/*
 프로그래머스 풍선 터트리기
 22.06.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ a:[Int]) -> Int {
  let n = a.count
  var left = [Bool](repeating: false, count: n)
  var right = [Bool](repeating: false, count: n)
  
  var l = 1, minVal = a[0]
  while l < n {
    if minVal < a[l] {
      left[l] = true
    } else if minVal > a[l] {
      minVal = a[l]
    }
    
    l += 1
  }
  
  var r = n - 2
  minVal = a[n - 1]
  while r >= 0 {
    if minVal < a[r] {
      right[r] = true
    } else if minVal > a[r] {
      minVal = a[r]
    }
    
    r -= 1
  }
  
  var answer = 0
  for i in 0 ..< n {
    if left[i] && right[i] { continue }
    answer += 1
  }
  
  return answer
}
