/*
 백준 2643 색종이 올려 놓기
 22.06.30
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var papers = [(Int, Int)]()

for _ in 0 ..< n {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: >)
  
  papers.append((input[0], input[1]))
}

// MARK: - 3번 풀이

papers.append((0, 0))
papers.sort(by: {
  if $0.0 == $1.0 { return $0.1 < $1.1 }
  else { return $0.0 < $1.0 }
})

var dp = [Int](repeating: 0, count: n + 1)

func solution(_ idx: Int) -> Int {
  if dp[idx] > 0 { return dp[idx] }
  if idx == n { return 1 }
  
  dp[idx] = 1
  
  for i in idx + 1 ... n {
    if papers[idx].0 <= papers[i].0 && papers[idx].1 <= papers[i].1 {
      dp[idx] = max(dp[idx], solution(i) + 1)
    }
  }
  
  return dp[idx]
}

print(solution(0) - 1)

// MARK: - 2번 풀이

//papers.sort(by: {
//  if $0.0 == $1.0 { return $0.1 < $1.1 }
//  else { return $0.0 < $1.0 }
//})
//
//var result = [(Int, Int)]()
//
//func lowerBound(_ target: (Int, Int)) -> Int {
//  var l = 0, r = result.count
//
//  while l <= r {
//    let m = (l + r) / 2
//
//    if result[m].0 <= target.0 && result[m].1 <= target.1 {
//      l = m + 1
//    } else {
//      r = m - 1
//    }
//  }
//
//  return l
//}
//
//result.append(papers[0])
//
//for i in 1 ..< n {
//  let top = result.last!
//
//  if top.0 <= papers[i].0 && top.1 <= papers[i].1 {
//    result.append(papers[i])
//  } else {
//    let pos = lowerBound(papers[i])
//
//    result[pos] = papers[i]
//  }
//}
//
//print(result.count)

// MARK: - 1번 풀이

//papers.sort(by: {
//  if $0.0 == $1.0 { return $0.1 > $1.1 }
//  else { return $0.0 > $1.0 }
//})
//
//var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
//
//dp[0][0] = 0
//dp[0][1] = 1
//
//for i in 1 ..< n {
//  dp[i][0] = dp[i - 1].max()!
//
//  var maxCnt = 0
//  for j in 0 ..< i {
//    if papers[i].0 <= papers[j].0 &&
//        papers[i].1 <= papers[j].1 &&
//        maxCnt < dp[j][1]
//    {
//      maxCnt = dp[j][1]
//    }
//  }
//
//  dp[i][1] = maxCnt + 1
//}
//
//print(dp[n - 1].max()!)
