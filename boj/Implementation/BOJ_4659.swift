/*
 21.10.09
 백준 4659 비밀번호 발음하기
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let aeiou: Set<String> = ["a", "e", "i", "o", "u"]

func check1 (_ str: String) -> Bool {
  
  for s in str {
    if aeiou.contains(String(s)) {
      return true
    }
  }
  
  return false
}

func check2 (_ str: String) -> Bool {
  
  if str.count < 3 {
    return true
  }
  
  let arr = str.map { String($0) }
  
  for i in 0 ... arr.count - 3 {
    if aeiou.contains(arr[i]) {
      if aeiou.contains(arr[i+1]) && aeiou.contains(arr[i+2]) {
        return false
      }
    } else {
      if !aeiou.contains(arr[i+1]) && !aeiou.contains(arr[i+2]) {
        return false
      }
    }
  }
  
  return true
}

func check3 (_ str: String) -> Bool {
  
  if str.count < 2 {
    return true
  }
  
  let arr = str.map { String($0) }
  
  for i in 1 ..< arr.count {
    if arr[i] == arr[i-1] {
      if arr[i] != "o" && arr[i] != "e" {
        return false
      }
    }
  }
  
  return true
}

while true {
  let input = readLine()!
  
  if input == "end" { break }
  
  if check1(input) && check2(input) && check3(input) {
    print("<\(input)> is acceptable.")
  } else {
    print("<\(input)> is not acceptable.")
  }
}
