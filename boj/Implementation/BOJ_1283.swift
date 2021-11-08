/*
 백준 1283 단축키 지정
 21.11.08
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var shortCut = Set<String>()
var answer = ""

for _ in 0 ..< n {
  let line = readLine()!
  let option = line.split(separator: " ").map { String($0) }
  var set = false // 단축키 지정한 경우 true
  var temp = ""
  
  // 1번 조건 수행
  for str in option {
    if set {
      temp += str + " "
      continue
    }
    
    let alphabet = str.map { String($0) }
    
    if !shortCut.contains(alphabet[0]) {
      shortCut.insert(alphabet[0].lowercased())
      shortCut.insert(alphabet[0].uppercased())
      temp += "[\(alphabet[0])]" + alphabet[1..<alphabet.count].joined() + " "
      set = true
    } else {
      temp += str + " "
    }
  }
  
  if set {
    answer += temp + "\n"
    continue
  }
  
  // 2번 조건 수행
  let arr = line.map { String($0) }
  temp = ""
  for i in arr.indices {
    if arr[i] == " " || shortCut.contains(arr[i]) { continue }
    
    temp += arr[0..<i].joined() + "[\(arr[i])]" + arr[i+1..<arr.count].joined()
    shortCut.insert(arr[i].lowercased())
    shortCut.insert(arr[i].uppercased())
    break
  }
  
  // 3번 조건
  if temp.isEmpty {
    answer += line + "\n"
  } else {
    answer += temp + "\n"
  }
}

print(answer)
