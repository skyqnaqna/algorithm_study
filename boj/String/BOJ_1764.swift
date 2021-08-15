/*
 백준 1764 듣보잡
 21.08.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var a = Set<String>(), b = Set<String>()

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

for _ in 0 ..< n {
  a.insert(readLine()!)
}

for _ in 0 ..< m {
  b.insert(readLine()!)
}

let c = a.intersection(b).map { $0 }.sorted()

print(c.count)

for ans in c {
  print(ans)
}