/*
 백준 2931 가스관
 22.07.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[String]]()

// MARK: - solution 2

for _ in 0 ..< n {
  graph.append(readLine()!.map { String($0) })
}

func top(_ r: Int, _ c: Int) -> Bool {
  return 0 < r && (graph[r - 1][c] == "|" || graph[r - 1][c] == "+" ||
                   graph[r - 1][c] == "1" || graph[r - 1][c] == "4")
}

func left(_ r: Int, _ c: Int) -> Bool {
  return 0 < c && (graph[r][c - 1] == "-" || graph[r][c - 1] == "+" ||
                   graph[r][c - 1] == "1" || graph[r][c - 1] == "2")
}

func right(_ r: Int, _ c: Int) -> Bool {
  return c < m - 1 && (graph[r][c + 1] == "-" || graph[r][c + 1] == "+" ||
                       graph[r][c + 1] == "3" || graph[r][c + 1] == "4")
}

func bottom(_ r: Int, _ c: Int) -> Bool {
  return r < n - 1 && (graph[r + 1][c] == "|" || graph[r + 1][c] == "+" ||
                       graph[r + 1][c] == "2" || graph[r + 1][c] == "3")
}

for i in 0 ..< n {
  for j in 0 ..< m {
    if graph[i][j] != "." { continue }
    
    let t = top(i, j)
    let b = bottom(i, j)
    let l = left(i, j)
    let r = right(i, j)
    
    if t && b && l && r {
      print(i + 1, j + 1, "+")
      break
    } else if t && b {
      print(i + 1, j + 1, "|")
      break
    } else if l && r {
      print(i + 1, j + 1, "-")
      break
    } else if b && r {
      print(i + 1, j + 1, "1")
      break
    } else if t && r {
      print(i + 1, j + 1, "2")
      break
    } else if l && t {
      print(i + 1, j + 1, "3")
      break
    } else if l && b {
      print(i + 1, j + 1, "4")
      break
    }
  }
}


// MARK: - solution 1
//var sr = 0, sc = 0
//let pipes = ["|", "-", "+", "1", "2", "3", "4"]
//let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]
//
//func inBound(_ r: Int, _ c: Int) -> Bool {
//  return 0 <= r && r < n && 0 <= c && c < m
//}
//
//func convertNextDir(_ dir: Int, _ pipe: String) -> Int {
//  var res = dir
//
//  switch pipe {
//  case "|":
//    if dir == 1 || dir == 3 { res = -1 }
//  case "-":
//    if dir == 0 || dir == 2 { res = -1 }
//  case "1":
//    if dir == 1 || dir == 2 { res = -1}
//    else {
//      res = dir == 0 ? 1 : 2
//    }
//  case "2":
//    if dir == 0 || dir == 1 { res = -1 }
//    else {
//      res = dir == 2 ? 1 : 0
//    }
//  case "3":
//    if dir == 0 || dir == 3 { res = -1 }
//    else {
//      res = dir == 1 ? 0 : 3
//    }
//  case "4":
//    if dir == 2 || dir == 3 { res = -1 }
//    else {
//      res = dir == 0 ? 3 : 2
//    }
//  default:
//    res = dir
//  }
//
//  return res
//}
//
//for i in 0 ..< n {
//  graph.append(readLine()!.map { String($0) })
//
//  for j in 0 ..< m {
//    if graph[i][j] == "M" {
//      sr = i
//      sc = j
//    }
//  }
//}
//
//var valid = false
//var row = 0, col = 0, pipe = ""
//var isVisited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 2), count: m), count: n)
//
//func travel(_ r: Int, _ c: Int, _ dir: Int, _ block: String) {
//  if valid { return }
//  if convertNextDir(dir, block) == -1 { return }
//  if block == "Z" {
//    valid = true
//    return
//  }
//
//  if block == "." {
//    for i in pipes.indices {
//      if valid { return }
//      let nextDir = convertNextDir(dir, pipes[i])
//
//      if nextDir == -1 { continue }
//
//      let nr = r + direction[nextDir].0
//      let nc = c + direction[nextDir].1
//
//      if !inBound(nr, nc) || graph[nr][nc] == "M" || graph[nr][nc] == "." || isVisited[nr][nc][nextDir % 2] { continue }
//
//      row = r
//      col = c
//      pipe = pipes[i]
//      graph[r][c] = pipes[i]
//      isVisited[nr][nc][nextDir % 2] = true
//      travel(nr, nc, nextDir, graph[nr][nc])
//      isVisited[nr][nc][nextDir % 2] = false
//      graph[r][c] = "."
//    }
//  } else {
//    let nextDir = convertNextDir(dir, block)
//
//    let nr = r + direction[nextDir].0
//    let nc = c + direction[nextDir].1
//
//    if !inBound(nr, nc) || graph[nr][nc] == "M" || isVisited[nr][nc][nextDir % 2] { return }
//
//    isVisited[nr][nc][nextDir % 2] = true
//    travel(nr, nc, nextDir, graph[nr][nc])
//    isVisited[nr][nc][nextDir % 2] = false
//  }
//}
//
//for (i, (dy, dx)) in direction.enumerated() {
//  if valid { break }
//  let r = sr + dy
//  let c = sc + dx
//
//  if !inBound(r, c) || graph[r][c] == "." || graph[r][c] == "Z" { continue }
//
//  isVisited[r][c][i % 2] = true
//  travel(r, c, i, graph[r][c])
//  isVisited[r][c][i % 2] = false
//}
//
//print(row + 1, col + 1, pipe)
