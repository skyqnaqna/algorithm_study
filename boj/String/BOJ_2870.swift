/*
 백준 2870 수학숙제
 22.02.19
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var nums = [String]()

func checkZero(_ str: String) -> String {
  if str.first! != "0" { return str }
  let arr = str.map { String($0) }
  var res = "", i = 0
  while i + 1 < arr.count && arr[i] == "0" {
    i += 1
  }
  
  while i < arr.count {
    res += arr[i]
    i += 1
  }
  
  return res
}

for _ in 0 ..< n {
  let str = readLine()!.map { String($0) }
  var temp = ""
  
  for i in str {
    if "0" <= i && i <= "9" {
      temp += i
    } else {
      if !temp.isEmpty {
        nums.append(checkZero(temp))
        temp = ""
      }
    }
  }
  if !temp.isEmpty {
    nums.append(checkZero(temp))
  }
}

nums.sort(by: {
  if $0.count == $1.count {
    return $0 < $1
  } else {
    return $0.count < $1.count
  }
})

for num in nums { print(num) }
