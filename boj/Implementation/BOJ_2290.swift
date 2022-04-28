/*
 백준 2290 LCD Test
 22.04.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { String($0) }
let s = Int(input[0])!
let w = s + 2, h = 2 * s + 3

var answer = [[String]](repeating: [String](), count: h)
let temp = [[String]](repeating: [String](repeating: " ", count: w), count: h)

func makeNumber(_ num: Character) {
  var res = temp
  
  switch num {
  case "0":
    for i in 0 ..< s {
      res[0][1 + i] = "-"
      res[h - 1][1 + i] = "-"
      res[1 + i][0] = "|"
      res[1 + i][w - 1] = "|"
      res[h - 2 - i][0] = "|"
      res[h - 2 - i][w - 1] = "|"
    }
  case "1":
    for i in 0 ..< s {
      res[1 + i][w - 1] = "|"
      res[h - 2 - i][w - 1] = "|"
    }
  case "2":
    for i in 0 ..< s {
      res[0][1 + i] = "-"
      res[1 + s][1 + i] = "-"
      res[h - 1][1 + i] = "-"
      res[1 + i][w - 1] = "|"
      res[h - 2 - i][0] = "|"
    }
  case "3":
    for i in 0 ..< s {
      res[0][1 + i] = "-"
      res[1 + s][1 + i] = "-"
      res[h - 1][1 + i] = "-"
      res[1 + i][w - 1] = "|"
      res[h - 2 - i][w - 1] = "|"
    }
  case "4":
    for i in 0 ..< s {
      res[1 + i][0] = "|"
      res[1 + i][w - 1] = "|"
      res[h - 2 - i][w - 1] = "|"
      res[1 + s][1 + i] = "-"
    }
  case "5":
    for i in 0 ..< s {
      res[0][1 + i] = "-"
      res[1 + s][1 + i] = "-"
      res[h - 1][1 + i] = "-"
      res[1 + i][0] = "|"
      res[h - 2 - i][w - 1] = "|"
    }
    
  case "6":
    for i in 0 ..< s {
      res[0][1 + i] = "-"
      res[1 + s][1 + i] = "-"
      res[h - 1][1 + i] = "-"
      res[1 + i][0] = "|"
      res[h - 2 - i][0] = "|"
      res[h - 2 - i][w - 1] = "|"
    }
    
  case "7":
    for i in 0 ..< s {
      res[0][1 + i] = "-"
      res[1 + i][w - 1] = "|"
      res[h - 2 - i][w - 1] = "|"
    }
    
  case "8":
    for i in 0 ..< s {
      res[0][1 + i] = "-"
      res[1 + s][1 + i] = "-"
      res[h - 1][1 + i] = "-"
      res[1 + i][0] = "|"
      res[1 + i][w - 1] = "|"
      res[h - 2 - i][0] = "|"
      res[h - 2 - i][w - 1] = "|"
    }
    
  default:
    for i in 0 ..< s {
      res[0][1 + i] = "-"
      res[1 + s][1 + i] = "-"
      res[h - 1][1 + i] = "-"
      res[1 + i][0] = "|"
      res[1 + i][w - 1] = "|"
      res[h - 2 - i][w - 1] = "|"
    }
  }
  
  for i in 0 ..< h {
    answer[i] += res[i] + [" "]
  }
}

for digit in input[1] {
  makeNumber(digit)
}

for i in 0 ..< h {
  print(answer[i].joined(separator: ""))
}
