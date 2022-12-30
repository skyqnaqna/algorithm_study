/*
 백준 20364 부동산 다툼
 22.12.29
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], q = input[1]

var nodes = [Int](repeating: 0, count: n + 1)

func markNode(_ idx: Int, _ num: Int) {
  if idx > n { return }

  nodes[idx] = num

  markNode(idx << 1, num)
  markNode((idx << 1) + 1, num)
}

var answer = ""

for _ in 0 ..< q {
  let target = Int(readLine()!)!

  answer += "\(nodes[target])\n"

  if nodes[target] == 0 {
    nodes[target] = target

    markNode(target, target)
  }
}

print(answer)
