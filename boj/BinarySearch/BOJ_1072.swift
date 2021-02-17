//  백준 1072 게임
//  21.02.17

import Foundation
let INF: Int = 2147000000

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let x = input[0]
let y = input[1]
let z = (100 * y) / x

var l = 0
var r = 1000000000
var m = (l + r) / 2
var ans = INF

if z >= 99 { print(-1) }
else {
  while l <= r {
  let temp = (100 * (y + m)) / (x + m)
    
    if temp > z {
      ans = min(ans, m)
      r = m - 1
    } else {
      l = m + 1
    }
    m = (l + r) / 2
  }
  print(ans)
}
