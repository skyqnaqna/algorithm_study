// 백준 18428 감시 피하기
// 21.05.14

import Foundation

func combination<T>(_ array: [T], _ r: Int) -> [[T]] {
  guard !array.isEmpty else { return [] }
  let N = array.count
  var temp = [T]()
  var result = [[T]]()
  var visited = [Bool](repeating: false, count: N)

  func dfs(_ index: Int, _ count: Int) {
    if count == r {
      result.append(temp)
    } else {
      for i in stride(from: index, to: N, by: 1) {
        if !visited[i] {
          visited[i] = true
          temp.append(array[i])
          dfs(i + 1, count + 1)
          visited[i] = false
          temp.removeLast()
        }
      }
    }
  }

  dfs(0, 0)
  return result
}

let n = Int(readLine()!)!
var teachers = [(Int, Int)]()
var emptySpaces = [(Int, Int)]()
var graph = [[String]](repeating: [String](), count: n)

for i in 0..<n {
  graph[i] = readLine()!.split(separator: " ").map { String($0) }

  for j in 0..<n {
    if graph[i][j] == "T" {
      teachers.append((i, j))
    } else if graph[i][j] == "X" {
      emptySpaces.append((i, j))
    }
  }
}

func find(_ preRow: Int, _ preCol: Int, _ arr: inout [[String]]) -> Bool {
  // up
  var row = preRow - 1
  while row >= 0 {
    if arr[row][preCol] == "S" {
      return true
    } else if arr[row][preCol] == "O" {
      break
    }
    row -= 1
  }

  // down
  row = preRow + 1
  while row < n {
    if arr[row][preCol] == "S" {
      return true
    } else if arr[row][preCol] == "O" {
      break
    }
    row += 1
  }

  // left
  var col = preCol - 1
  while col >= 0 {
    if arr[preRow][col] == "S" {
      return true
    } else if arr[preRow][col] == "O" {
      break
    }
    col -= 1
  }

  //right
  col = preCol + 1
  while col < n {
    if arr[preRow][col] == "S" {
      return true
    } else if arr[preRow][col] == "O" {
      break
    }
    col += 1
  }
  
  return false
}

let candidateWall = combination(emptySpaces, 3)
var answer = false

for walls in candidateWall {
  var tempGraph = graph

  for (row, col) in walls {
    tempGraph[row][col] = "O"
  }

  var notSafe = false
  for (teacherRow, teacherCol) in teachers {
    notSafe = find(teacherRow, teacherCol, &tempGraph)
    if notSafe { break }
  }

  if !notSafe {
    answer = !notSafe
    break
  }
}

if answer {
  print("YES")
} else {
  print("NO")
}
