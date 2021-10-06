/*
 21.10.07
 백준 2629 양팔저울
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

// 추 입력
let n = Int(readLine()!)!
let weight = readLine()!.split(separator: " ").map { Int(String($0))! }

var allWeights = Set<Int>() // 추의 무게 조합들

// 구슬 입력
let m = Int(readLine()!)!
let beads = readLine()!.split(separator: " ").map { Int(String($0))! }

var ans = [Bool](repeating: false, count: m)

// 가능한 모든 추의 무게를 구하기
for w in weight {
  if !allWeights.isEmpty {
    // 현재시점까지의 집합을 배열로 변환
    let weightSet = allWeights.map { $0 }
    for aw in weightSet {
      allWeights.insert(w + aw)
    }
  }
  
  // 단일 추 무게를 마지막에 추가해야 자기자신을 더하지 않음
  allWeights.insert(w)
}

// [구슬 == 추] or [구슬 + 추 == 추] 인 경우가 존재하는지 확인
for i in beads.indices {
  if allWeights.contains(beads[i]) {
    ans[i] = true
  } else {
    for w in allWeights {
      if allWeights.contains(beads[i] + w) {
        ans[i] = true
        break
      }
    }
  }
}

var answer = ""
for isTrue in ans {
  if isTrue {
    answer += "Y "
  } else {
    answer += "N "
  }
}

print(answer)
