// 프로그래머스 기둥과 보 설치
// 21.04.29

import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
  var result = [[Int]]()
  var verticality = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)
  var horizon = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)
  let d = [(0, -1), (0, 1), (-1, 0), (1, 0), (0, 0)]

  // x:= col, y:= row
  func checkRule(_ x: Int, _ y: Int, _ type: Int) -> Bool {
    if type == 0 {
      if y == 0 {
        return true
      } else if horizon[y][x] || (x-1 >= 0 && horizon[y][x-1]) {
        return true
      } else if y-1 >= 0 && verticality[y-1][x] {
        return true
      }
    } else {
      if y-1 >= 0 && (verticality[y-1][x] || (x+1 <= n && verticality[y-1][x+1])) {
        return true
      } else if (x-1 >= 0 && horizon[y][x-1]) && (x+1 <= n && horizon[y][x+1]) {
        return true
      }
    }

    return false
  }

  func install(_ x: Int, _ y: Int, _ type: Int) {
    if checkRule(x, y, type) {
      if type == 0 {
        verticality[y][x] = true
      } else {
        horizon[y][x] = true
      }
    }
  }

  func delete(_ x: Int, _ y: Int, _ type: Int) {
    if type == 0 {
      verticality[y][x] = false
    } else {
      horizon[y][x] = false
    }

    var deleting = true

    for i in 0...n {
      for j in 0...n {
        if (verticality[i][j] && !checkRule(j, i, 0)) || (horizon[i][j] && !checkRule(j, i, 1)) {
          deleting = false
          break
        }
      }
      if !deleting {
        break
      }
    }

    if !deleting {
      if type == 0{
        verticality[y][x] = true
      } else {
        horizon[y][x] = true
      }
    }
  }

  for frame in build_frame {
    if frame[3] == 1 {
      install(frame[0], frame[1], frame[2])
    } else {
      delete(frame[0], frame[1], frame[2])
    }
  }

  for i in 0...n {
    for j in 0...n {
      if verticality[i][j] {
        result.append([j, i, 0])
      }
      if horizon[i][j] {
        result.append([j, i, 1])
      }
    }
  }

  result.sort(by: {
    if $0[0] == $1[0] {
      if $0[1] == $1[1] {
        return $0[2] < $1[2]
      } else {
        return $0[1] < $1[1]
      }
    } else {
      return $0[0] < $1[0]
    }
  })

  return result
}

print(solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]))
print(solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]]))
