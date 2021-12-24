/*
 백준 2671 잠수함식별
 21.12.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let pattern = #"^(100+1+|01)+$"#

let str = readLine()!

if str.range(of: pattern, options: .regularExpression) != nil {
  print("SUBMARINE")
} else {
  print("NOISE")
}

