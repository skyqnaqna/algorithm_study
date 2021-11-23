/*
 백준 1208 부분수열의 합 2
 21.11.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], s = input[1]

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

// 수열을 반으로 나눠 최대 2^20번 두번 구하면 됨
var left = [Int](), right = [Int]()

for i in 0 ..< arr.count / 2 {
  left.append(arr[i])
}

for i in arr.count / 2 ..< arr.count {
  right.append(arr[i])
}

var leftDic = [Int: Int](), rightDic = [Int: Int]()
leftDic[0] = 1
rightDic[0] = 1

var len = 1 << left.count

for i in 1 ..< len {
  var bit = 0, sum = 0
  
  while bit < left.count {
    if (i & (1 << bit)) != 0 {
      sum += left[bit]
    }
    bit += 1
  }
  
  leftDic[sum, default: 0] += 1
}

len = 1 << right.count

for i in 1 ..< len {
  var bit = 0, sum = 0
  
  while bit < right.count {
    if (i & (1 << bit)) != 0 {
      sum += right[bit]
    }
    bit += 1
  }
  
  rightDic[sum, default: 0] += 1
}

var answer = 0

for (key, val) in leftDic {
  let w = s - key
  
  if let cnt = rightDic[w] {
    answer += val * cnt
  }
}

// S가 0인 경우 공집합 빼기
if s == 0 { answer -= 1 }
print(answer)
