// 백준 14003 가장 긴 증가하는 부분 수열 5
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
var lis: [Int] = []; var record: [(Int, Int)] = []
lis.append(a[0])

var len = lis.count
record.append((len, a[0]))

for i in stride(from: 1, to: n, by: 1) {
  if lis.last! < a[i] {
    lis.append(a[i])
    len += 1
    record.append((len, a[i]))
  }
  else {
    let pos = _lowerBound(0, len, lis, a[i])
    lis[pos] = a[i]
    record.append((pos + 1, a[i]))
  }
}

print(len)
var stack: [Int] = []

for i in stride(from: record.count - 1, through: 0, by: -1) {
  if record[i].0 == len {
    stack.append(record[i].1)
    len -= 1
  }
}

while !stack.isEmpty {
  print(stack.removeLast(), terminator: " ")
}
