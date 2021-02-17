//  백준 2110 공유기 설치
//  21.02.18

import Foundation
let INF: Int = 2147000000

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], c = input[1]

var house: [Int] = []
for _ in 1...n { house.append(Int(readLine()!)!) }

house.sort()

var l = 0, r = house[house.endIndex - 1] - house[0]
var m = (l + r) / 2
var ans = 0

while l <= r {
  var cnt = 1
  var pre = house[0]
  for next in house {
    if next - pre >= m {
      cnt += 1
      pre = next
    }
  }
  
  if cnt >= c {
    ans = max(ans, m)
    l = m + 1
  } else { r = m - 1 }
  m = (l + r) / 2
}

print(ans)
