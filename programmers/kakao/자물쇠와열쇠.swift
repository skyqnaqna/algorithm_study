// 프로그래머스 자물쇠와 열쇠
// 21.04.28

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
  var result = false
  let n = lock[0].count
  let m = key[0].count
  var graph = [[Int]](repeating: [Int](repeating: 0, count: n + 2*m), count: n + 2*m)
  var tempKey = key
  
  // N + 2M 크기의 2차원 배열 초기화
  func initGraph() {
    graph.removeAll(keepingCapacity: true)
    
    for _ in stride(from: 0, to: n + 2*m, by: 1) {
      graph.append([Int](repeating: 0, count: n + 2*m))
    }

    for i in stride(from: 0, to: n, by: 1) {
      for j in stride(from: 0, to: n, by: 1) {
        graph[i + m][j + m] = lock[i][j]
      }
    }
  }
  
  // 자물쇠 풀리는지 확인
  func checkUnlock(_ row: Int, _ col: Int, _ tempKey: [[Int]]) -> Bool {
    initGraph()
    
    for i in stride(from: 0, to: m, by: 1) {
      for j in stride(from: 0, to: m, by: 1) {
        graph[i + row][j + col] += tempKey[i][j]
      }
    }
    
    for i in stride(from: 0, to: n, by: 1) {
      for j in stride(from: 0, to: n, by: 1) {
        if graph[i + m][j + m] != 1 {
          return false
        }
      }
    }
    
    return true
  }
  
  // 열쇠 시계 방향으로 90도 회전
  func rotateKey(_ target: [[Int]]) -> [[Int]] {
    var rotated = [[Int]](repeating: [Int](repeating: 0, count: m), count: m)
    
    for i in stride(from: 0, to: m, by: 1) {
      for j in stride(from: 0, to: m, by: 1) {
        rotated[j][m - i - 1] = target[i][j]
      }
    }
    
    return rotated
  }
  
  for _ in stride(from: 0, to: 4, by: 1) {
    for i in stride(from: 1, to: n + m, by: 1) {
      for j in stride(from: 1, to: n + m, by: 1) {
        result = checkUnlock(i, j, tempKey)
        if result {
          return result
        }
      }
    }
    tempKey = rotateKey(tempKey)
  }
  
  return result
}

print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]] , [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))
