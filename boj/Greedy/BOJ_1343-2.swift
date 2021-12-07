/*
 백준 1343 폴리오미노
 21.12.07
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var str = readLine()!

str = str.replacingOccurrences(of: "XXXX", with: "AAAA")
str = str.replacingOccurrences(of: "XX", with: "BB")

if str.contains("X") {
  print(-1)
} else {
  print(str)
}
