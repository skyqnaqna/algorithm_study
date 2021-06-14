/*
 백준 3029 경고
 21.06.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: ":").map{ Int(String($0))! }
let target = readLine()!.split(separator: ":").map{ Int(String($0))! }

var hh = input[0], mm = input[1], ss = input[2]
var HH = target[0], MM = target[1], SS = target[2]

if hh == HH && mm == MM && ss == SS {
  print("24:00:00")
} else {
  var result = [Int](repeating: 0, count: 3)

  if SS < ss {
    result[2] = SS + 60 - ss
    MM -= 1
  } else {
    result[2] = SS - ss
  }

  if MM < mm {
    result[1] = MM + 60 - mm
    HH -= 1
  } else {
    result[1] = MM - mm
  }

  result[0] = HH < hh ? HH - hh + 24 : HH - hh

  print(result.map{ String(format: "%02d", $0) }.joined(separator: ":"))
}
