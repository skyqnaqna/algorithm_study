/*
 백준 20542 받아쓰기
 21.09.10
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation
/*
 편집 거리 알고리즘
 문제 조건 중 휘갈겨 쓰는
  i := i,j,l
  v := v,w
 경우 확인하기
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

let write = readLine()!.map { String($0) }
let answer = readLine()!.map { String($0) }

// 정답을 행, 받아쓰기를 열
var dist = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)

for i in 0 ..< n + 1 {
  for j in 0 ..< m + 1 {
    if i == 0 {
      dist[i][j] = j
    } else if j == 0 {
      dist[i][j] = i
    } else {
      // 같으면 편집 안해도 되니까 이전 편집거리 가져오기
      if write[i - 1] == answer[j - 1] {
        dist[i][j] = dist[i - 1][j - 1]
      } else if write[i - 1] == "i" && (answer[j - 1] == "j" || answer[j - 1] == "l") {
        dist[i][j] = dist[i - 1][j - 1]
      } else if write[i - 1] == "v" && answer[j - 1] == "w" {
        dist[i][j] = dist[i - 1][j - 1]
      } else {
        // 편집, 추가, 삭제 중 최소 값에 + 1
        dist[i][j] = min(dist[i - 1][j - 1], min(dist[i - 1][j], dist[i][j - 1])) + 1
      }
    }
  }
}

print(dist[n][m])