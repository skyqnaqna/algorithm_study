/*
 백준 2477 참외밭
 23.02.27
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(1, 0), (-1, 0), (0, -1), (0, 1)]

let k = Int(readLine()!)!

var x = 0, y = 0
var xVal = Set<Int>(), yVal = Set<Int>(), xy = [[Int]]()

xVal.insert(0)
yVal.insert(0)
xy.append([x, y])

(0 ..< 6).forEach { _ in
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }
  let d = i[0] - 1, len = i[1]

  x += direction[d].0 * len
  y += direction[d].1 * len
  xVal.insert(x)
  yVal.insert(y)
  xy.append([x, y])
}

let xList = Array(xVal).sorted(by: <)
let yList = Array(yVal).sorted(by: <)
var answer = (xList.max()! - xList.min()!) * (yList.max()! - yList.min()!)

for i in [0, 2] {
  for j in [0, 2] {
    if !xy.contains([xList[i], yList[j]]) {
      answer -= abs(xList[1] - xList[i]) * abs(yList[1] - yList[j])
      break
    }
  }
}

print(answer * k)
