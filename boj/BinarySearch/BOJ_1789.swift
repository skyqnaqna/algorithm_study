//  백준 1789 수들의 합
//  21.02.12

import Foundation

let s = Int(readLine()!)!

var left: Int = 1
var right: Int = s
var mid: Int = (left + right) / 2

while left < mid && mid < right {
  if Int(pow(Double(mid), 2)) + mid > 2*s { right = mid }
  else { left = mid }
  
  mid = (left + right) / 2
}

print(mid)
