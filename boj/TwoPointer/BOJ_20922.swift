/*
 21.10.03
 백준 20922 겹치는 건 싫어
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

// 해당 수의 가장 왼쪽 인덱스
var nextIndex = [Int: Int]()
// 해당 수의 빈도수
var frequency = [Int: Int]()

var left = 0, right = 0, ans = 0

while right < n {
  let cnt = frequency[arr[right], default: 0]
  
  if cnt == k {
    ans = max(ans, right - left)
    
    // right에 있는 수가 이미 k개 등장했으면 길이 구해주고 가장 왼쪽 인덱스 + 1 을 left로 시작
    if let idx = nextIndex[arr[right]] {
      left = idx + 1
      right = left
    } else {
      left = right
    }
    
    frequency.removeAll()
    nextIndex.removeAll()
  } else {
    frequency[arr[right], default: 0] += 1
    
    if nextIndex[arr[right]] == nil {
      nextIndex[arr[right]] = right
    }
    
    right += 1
  }
}

ans = max(ans, right - left)

print(ans)
