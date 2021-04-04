// 백준 2002 추월
// 21.04.04

import Foundation

let n: Int = Int(readLine()!) ?? 0

var check = Set<String>()
var inList = [String]()
  , outList = [String]()

for _ in 1...n {
  inList.append(String(readLine()!))
}
for _ in 1...n {
  outList.append(String(readLine()!))
}

inList.reverse()
outList.reverse()
var cnt = 0

while !inList.isEmpty && !outList.isEmpty {
  let inFront = inList.last
  let outFront = outList.last
  
  if check.contains(inFront!) {
    inList.removeLast()
  } else if inFront == outFront {
    check.insert(outFront!)
    inList.removeLast()
    outList.removeLast()
  } else {
    check.insert(outFront!)
    outList.removeLast()
    cnt += 1
  }
}

print(cnt)
