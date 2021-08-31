/*
 백준 21318 피아노 체조
 21.08.31
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var mistake = [Int](repeating: 0, count: n)

for i in 1 ..< n {
  if arr[i] < arr[i - 1] {
    mistake[i] = mistake[i - 1] + 1
  } else {
    mistake[i] = mistake[i - 1]
  }
}

var q = Int(readLine()!)!

while q > 0 {
  q -= 1
  let xy = readLine()!.split(separator: " ").map { Int(String($0))! }

  print(mistake[xy[1] - 1] - mistake[xy[0] - 1])
}