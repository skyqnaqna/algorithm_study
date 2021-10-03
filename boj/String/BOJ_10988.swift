/*
 21.10.03
 백준 10988 팰린드롬인지 확인하기
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let word = readLine()!

if word == String(word.reversed()) {
  print(1)
} else {
  print(0)
}
