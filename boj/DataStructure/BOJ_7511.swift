/*
 21.10.31
 백준 7511 소셜 네트워킹 어플리케이션
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let t = Int(readLine()!)!

var answer = ""

for i in 1 ... t {
  answer += "Scenario \(i):\n"
  answer += solution()
}

func solution() -> String {
  let n = Int(readLine()!)!
  let k = Int(readLine()!)!
  var result = ""
  
  var parent = [Int](repeating: 0, count: n)
  
  for i in 0 ..< n {
    parent[i] = i
  }
  
  func getParent(_ a: Int) -> Int {
    if parent[a] != a {
      parent[a] = getParent(parent[a])
    }
    
    return parent[a]
  }
  
  func unionParent(_ a: Int, _ b: Int) {
    let x = getParent(a)
    let y = getParent(b)
    
    if x < y {
      parent[y] = x
    } else {
      parent[x] = y
    }
  }
  
  for _ in 0 ..< k {
    let q = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    unionParent(q[0], q[1])
  }
  
  let m = Int(readLine()!)!
  
  for _ in 0 ..< m {
    let q = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    if getParent(q[0]) == getParent(q[1]) {
      result += "1\n"
    } else {
      result += "0\n"
    }
  }
  
  result += "\n"
  return result
}

print(answer)
