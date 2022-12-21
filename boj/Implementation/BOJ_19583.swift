/*
 백준 19583 싸이버개강총회
 22.12.21
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { String($0) }

func convertTime(_ strTime: String) -> Int {
  let t = strTime.split(separator: ":").map { String($0) }
  let h = Int(t[0])! * 60
  let m = Int(t[1])!

  return h + m
}

let s = convertTime(input[0]),
e = convertTime(input[1]),
q = convertTime(input[2])

var answer = 0
var enter = Set<String>()
var leave = Set<String>()

while let chat = readLine() {
  let record = chat.split(separator: " ").map { String($0) }

  let time = convertTime(record[0])
  let name = record[1]

  if time <= s {
    enter.insert(name)
  } else if e <= time && time <= q {
    if enter.contains(name) {
      leave.insert(name)
    }
  }
}

print(leave.count)
