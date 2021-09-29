/*
 21.09.29
 백준 4446 ROT13
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let consonants = "aiyeou".map { String($0) }, vowels = "bkxznhdcwgpvjqtsrlmf".map { String($0) }

var consonant = [String: Int](), vowel = [String: Int]()

// 배열에 저장된 모음, 자음 인덱스번호 딕셔너리에 저장
for (idx, char) in consonants.enumerated() {
  consonant[char] = idx
}

for (idx, char) in vowels.enumerated() {
  vowel[char] = idx
}

func convert(_ target: String) -> String {
  let ascii = Int(Character(target).asciiValue!)
  
  // 알파벳 아니면 바로 리턴
  if ascii < 65 || (ascii > 90 && ascii < 97) || ascii > 122 {
    return target
  }
  
  let lowercase = (ascii >= 97 && ascii <= 122) ? true : false
  
  var nextIdx: Int, res = ""
  
  if let idx = consonant[target.lowercased()] {
    nextIdx = (idx + 3) % consonants.count
    res = consonants[nextIdx]
  } else if let idx = vowel[target.lowercased()] {
    nextIdx = (idx + 10) % vowels.count
    res = vowels[nextIdx]
  }
  
  if lowercase {
    return res
  } else {
    return res.uppercased()
  }
}

while let input = readLine()?.map { String($0) } {
  var answer = ""
  
  for str in input {
    answer += convert(str)
  }
  
  print(answer)
}

