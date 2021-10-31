/*
 21.10.31
 백준 17609 회문
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var t = Int(readLine()!)!
var answer = ""

while t > 0 {
  t -= 1
  
  let arr = readLine()!.map { String($0) }
  let str = arr.joined()
  
  var checkPalindrome = false
  
  func recursive(_ left: Int, _ right: Int, _ cnt: Int) {
    if checkPalindrome || cnt >= 2 { return }
    
    if left >= right {
      checkPalindrome = cnt < 2
      return
    }
    
    if arr[left] == arr[right] {
      recursive(left + 1, right - 1, cnt)
    } else {
      if arr[left + 1] == arr[right] {
        recursive(left + 1, right, cnt + 1)
      }
      
      if arr[left] == arr[right - 1] {
        recursive(left, right - 1, cnt + 1)
      }
    }
  }
  
  if str == String(str.reversed()) {
    answer += "0\n"
    continue
  }
  
  recursive(0, arr.count - 1, 0)
  
  if checkPalindrome {
    answer += "1\n"
  } else {
    answer += "2\n"
  }
}

print(answer)
