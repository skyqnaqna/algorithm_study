/*
 백준 9081 단어 맞추기
 22.06.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

for _ in 0 ..< n {
  let word = readLine()!.map { String($0) }
  
  var pos = -1
  for i in stride(from: word.count - 2, through: 0, by: -1) {
    if word[i] < word[i + 1] {
      pos = i
      break
    }
  }
  
  if pos == -1 {
    print(word.joined())
  } else {
    var answer = ""
    var temp = [String]()
    
    for i in 0 ..< pos {
      answer += word[i]
    }
    
    for i in pos ..< word.count {
      temp.append(word[i])
    }
    
    temp.sort(by: <)
    
    for i in 0 ..< temp.count {
      if word[pos] < temp[i] {
        answer += temp[i]
        temp.remove(at: i)
        break
      }
    }
    
    for w in temp {
      answer += w
    }
    
    print(answer)
  }
}
