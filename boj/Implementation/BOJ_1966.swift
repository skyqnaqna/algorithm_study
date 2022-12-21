/*
 백준 1966 프린터 큐
 22.12.21
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

var t = Int(readLine()!)!
var answer = ""

for _ in 0 ..< t {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let n = input[0], m = input[1]

  let q = readLine()!.split(separator: " ").map { Int(String($0))! }

  var priority = [Int](repeating: 0, count: 10)
  var result = [Int](repeating: 0, count: n)

  for p in q {
    priority[p] += 1
  }

  var now = 9

  while priority[now] == 0 { now -= 1 }

  var pos = 0, seq = 1

  while now > 0 {
    if q[pos] == now {
      result[pos] = seq
      seq += 1
      priority[now] -= 1

      while now > 0 && priority[now] == 0 { now -= 1 }
    }

    pos = (pos + 1) % n
  }

  answer += "\(result[m])\n"
}

print(answer)
