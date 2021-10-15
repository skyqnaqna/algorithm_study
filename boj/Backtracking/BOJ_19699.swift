/*
 21.10.16
 백준 19699 소-난다!
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var prime = [Bool](repeating: true, count: 9001)
prime[0] = false
prime[1] = false

for i in 2 ... 95 {
  if prime[i] {
    var k = 2
    while i * k <= 9000 {
      prime[i * k] = false
      k += 1
    }
  }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

let cows = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = Set<Int>()
var history = ""

func recursive(_ idx: Int, _ sum: Int, _ cnt: Int) {
  history += "\(sum)  "
  if cnt == m, prime[sum] {
    answer.insert(sum)
    return
  }
  
  for i in idx ..< n {
    recursive(i + 1, sum + cows[i], cnt + 1)
  }
}

recursive(0, 0, 0)

if answer.isEmpty {
  print(-1)
} else {
  print(answer.sorted().map { String($0) }.joined(separator: " "))
}

print(history)
