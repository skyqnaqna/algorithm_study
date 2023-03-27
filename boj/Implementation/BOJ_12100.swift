/*
 백준 12100 2048 (Easy)
 23.03.27
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var arr = [[Int]]()
var answer = 0

for _ in 0 ..< n {
  arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

enum Direction: CaseIterable {
  case up, down, left, right
}

func moveBlock(_ dir: Direction, _ board: inout [[Int]]) {
  switch dir {
  case .up:
    for i in 1 ..< n {
      (0 ..< n).forEach { j in
        if board[i][j] == 0 { return }

        var next = i - 1

        while next >= 0 && board[next][j] == 0 {
          next -= 1
        }

        if next + 1 == i { return }

        board[next + 1][j] = board[i][j]
        board[i][j] = 0
      }
    }

  case .down:
    for i in stride(from: n - 2, through: 0, by: -1) {
      (0 ..< n).forEach { j in
        if board[i][j] == 0 { return }

        var next = i + 1

        while next < n && board[next][j] == 0 {
          next += 1
        }

        if next - 1 == i { return }

        board[next - 1][j] = board[i][j]
        board[i][j] = 0

      }
    }

  case .left:
    for j in 1 ..< n {
      (0 ..< n).forEach { i in
        if board[i][j] == 0 { return }

        var next = j - 1

        while next >= 0 && board[i][next] == 0 {
          next -= 1
        }

        if next + 1 == j { return }

        board[i][next + 1] = board[i][j]
        board[i][j] = 0
      }
    }

  case .right:
    for j in stride(from: n - 2, through: 0, by: -1) {
      (0 ..< n).forEach { i in
        if board[i][j] == 0 { return }

        var next = j + 1

        while next < n && board[i][next] == 0 {
          next += 1
        }

        if next - 1 == j { return }

        board[i][next - 1] = board[i][j]
        board[i][j] = 0
      }
    }
  }
}

func mergeBlock(_ dir: Direction, _ board: inout [[Int]]) {
  switch dir {
  case .up:
    for i in 0 ..< n - 1 {
      (0 ..< n).forEach { j in
        if board[i][j] == 0 { return }

        if board[i][j] == board[i + 1][j] {
          board[i][j] <<= 1
          board[i + 1][j] = 0
        }
      }
    }

  case .down:
    for i in stride(from: n - 1, to: 0, by: -1) {
      (0 ..< n).forEach { j in
        if board[i][j] == 0 { return }

        if board[i][j] == board[i - 1][j] {
          board[i][j] <<= 1
          board[i - 1][j] = 0
        }
      }
    }

  case .left:
    for j in 0 ..< n - 1 {
      (0 ..< n).forEach { i in
        if board[i][j] == 0 { return }

        if board[i][j] == board[i][j + 1] {
          board[i][j] <<= 1
          board[i][j + 1] = 0
        }
      }
    }

  case .right:
    for j in stride(from: n - 1, to: 0, by: -1) {
      (0 ..< n).forEach { i in
        if board[i][j] == 0 { return }

        if board[i][j] == board[i][j - 1] {
          board[i][j] <<= 1
          board[i][j - 1] = 0
        }
      }
    }
  }
}

func recursive(_ cnt: Int, _ board: [[Int]]) {
  if cnt == 5 {
    for i in 0 ..< n {
      answer = max(answer, board[i].max()!)
    }

    return
  }

  Direction.allCases.forEach {
    var newBoard = board

    moveBlock($0, &newBoard)
    mergeBlock($0, &newBoard)
    moveBlock($0, &newBoard)

    recursive(cnt + 1, newBoard)
  }
}

recursive(0, arr)

print(answer)
