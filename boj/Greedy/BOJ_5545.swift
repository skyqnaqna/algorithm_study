/*
 백준 5545 최고의 피자
 22.11.15
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let a = input[0], b = input[1]
let c = Int(readLine()!)!

var topping = [Int]()

for _ in 0 ..< n { topping.append(Int(readLine()!)!) }

topping.sort(by: >)

var calories = c
var price = a
var answer = c / price

for i in 0 ..< n {
  calories += topping[i]
  price += b

  let caloriesPerWon = calories / price

  if answer <= caloriesPerWon {
    answer = caloriesPerWon
  } else {
    break
  }
}

print(answer)
