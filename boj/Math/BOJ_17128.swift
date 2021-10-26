/*
 21.10.26
 백준 17128 소가 정보섬에 올라온 이유
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]

let cows = readLine()!.split(separator: " ").map { Int(String($0))! }
var s = [Int](repeating: 0, count: n)

let query = readLine()!.split(separator: " ").map { Int(String($0))! }

var total = 0
for i in 0 ..< n {
  s[i] = cows[i] * cows[(i+1) % n] * cows[(i+2) % n] * cows[(i+3) % n]
  total += s[i]
}

var answer = ""

for q in query {
  let i = q - 1
  
  s[i] *= -1
  s[(i-1+n) % n] *= -1
  s[(i-2+n) % n] *= -1
  s[(i-3+n) % n] *= -1
  
  total += 2 * (s[i] + s[(i-1+n) % n] + s[(i-2+n) % n] + s[(i-3+n) % n])
  answer += "\(total)\n"
}

print(answer)
