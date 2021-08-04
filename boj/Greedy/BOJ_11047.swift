/*
 백준 11047 동전 0
 21.08.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0]
var k = input[1]

var coins = [Int](), ans = 0

for _ in 0 ..< n {
  coins.append(Int(readLine()!)!)
}

while k > 0 {
  if k / coins.last! > 0 {
    let cnt = k / coins.last!
    ans += cnt
    k -= cnt * coins.removeLast()
  } else {
    coins.removeLast()
  }
}

print(ans)