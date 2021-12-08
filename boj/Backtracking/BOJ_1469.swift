/*
 백준 1469 숌 사이 수열
 21.12.08
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

var used = [Bool](repeating: false, count: n)
var list = [Int](repeating: -1, count: n * 2)
var answer = ""


func permutation(_ pos: Int) {
  if !answer.isEmpty { return }
  if pos == 2 * n {
    answer = list.map { String($0) }.joined(separator: " ")
    
    return
  }
  
  if list[pos] != -1 { permutation(pos + 1) }
  else {
    for i in 0 ..< n {
      if used[i] { continue }
      if pos + x[i] + 1 < 2 * n && list[pos + x[i] + 1] == -1 {
        used[i] = true
        list[pos] = x[i]
        list[pos + x[i] + 1] = x[i]
        
        permutation(pos + 1)
        
        used[i] = false
        list[pos] = -1
        list[pos + x[i] + 1] = -1
      }
    }
  }
}

func solution() {
  if x.last! > n * 2 - 2 { return }
  
  permutation(0)
}

solution()

if answer.isEmpty {
  print(-1)
} else {
  print(answer)
}
