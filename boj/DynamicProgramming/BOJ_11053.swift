// 백준 11053 가장 긴 증가하는 부분 수열
// 21.02.24

import Foundation

func _lowerBound(_ start: Int, _ end: Int, _ arr: [Int], _ target: Int) -> Int {
  var l = start
  var r = end
  var mid: Int
  
  while l < r {
    mid = (l + r) / 2
    
    if arr[mid] < target { l = mid + 1 }
    else { r = mid }
  }
  return r
}

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int(String($0))! }
var lis: [Int] = []
lis.append(a[0])

for i in stride(from: 1, to: n, by: 1) {
  if lis.last! < a[i] { lis.append(a[i]) }
  else {
    let pos = _lowerBound(0, lis.count, lis, a[i])
    lis[pos] = a[i]
  }
}

print(lis.count)
