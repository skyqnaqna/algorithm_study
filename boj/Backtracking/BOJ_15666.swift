/*
 21.09.30
 백준 15666 N과 M (12)
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var seq = Set<String>()

var list = [Int](), answer = ""

func recursive(_ idx: Int) {
  if list.count == m {
    let temp = list.map { String($0) }.joined(separator: " ")
    
    if !seq.contains(temp) {
      answer += temp + "\n"
      seq.insert(temp)
    }
    
    return
  }
  
  for i in idx ..< n {
    list.append(arr[i])
    recursive(i)
    list.removeLast()
  }
}

recursive(0)
print(answer)
