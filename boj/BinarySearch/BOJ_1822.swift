//  백준 1822 차집합
//  21.02.13

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var a = readLine()!.split(separator: " ").map{ Int(String($0))! }
var b = readLine()!.split(separator: " ").map{ Int(String($0))! }
var c: [Int] = []

func binarySearch (_ target: Int) -> Bool {
  var left = 0
  var right = b.count - 1
  var mid = (left + right) / 2
  
  while left <= right {
    if b[mid] == target { return true }
    
    if b[mid] < target { left = mid + 1 }
    else {right = mid - 1 }
    
    mid = (left + right) / 2
  }
  return false
}

a.sort()
b.sort()

for i in a {
  if !binarySearch(i) { c.append(i) }
}

if c.isEmpty { print(0) }
else {
  print(c.count)
  for i in c {
    print(i, terminator: " ")
  }
  print()
}
