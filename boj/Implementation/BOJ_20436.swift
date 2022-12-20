/*
 백준 20436 ZOAC 3
 22.12.20
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { String($0) }
let text = readLine()!.map { String($0) }

var keyboard = [[String]]()

["qwertyuiop", "asdfghjkl", "zxcvbnm"].forEach {
  keyboard.append($0.map { String($0) })
}

var pos = [String: [Int]]()

for (i, row) in keyboard.enumerated() {
  for (j, key) in row.enumerated() {
    pos[key] = [i, j]
  }
}

let vowel = Set("yuiophjklbnm".map { String($0) })

var l = pos[input[0]]!, r = pos[input[1]]!
var answer = 0

func getDistance(_ lhs: [Int], _ rhs: [Int]) -> Int {
  return abs(lhs[0] - rhs[0]) + abs(lhs[1] - rhs[1])
}

for str in text {
  if vowel.contains(str) {
    answer += getDistance(r, pos[str]!) + 1
    r = pos[str]!
  } else {
    answer += getDistance(l, pos[str]!) + 1
    l = pos[str]!
  }
}

print(answer)
