/*
 백준 23290 마법사 상어와 복제
 23.03.31
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = input[0], s = input[1]

let dirFish = [(0, -1), (-1, -1), (-1, 0), (-1, 1), (0, 1), (1, 1), (1, 0), (1, -1)]
let dir = [(-1, 0), (0, -1), (1, 0), (0, 1)]

var fishes = [[[Int]]](
  repeating: [[Int]](
    repeating: [Int](
      repeating: 0,
      count: 8),
    count: 4),
  count: 4)
var numOfFishes = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
var fishSmell = [[Int]](repeating: [Int](repeating: -2, count: 4), count: 4)

for _ in 0 ..< m {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }
  let r = i[0] - 1,
      c = i[1] - 1,
      d = i[2] - 1

  fishes[r][c][d] += 1
  numOfFishes[r][c] += 1
}

input = readLine()!.split(separator: " ").map { Int(String($0))! }
var shark = (input[0] - 1, input[1] - 1)

var dirShark = [[Int]]()

func getCombination(_ arr: [Int]) {
  if arr.count == 3 {
    dirShark.append(arr)

    return
  }

  for i in 0 ..< 4 {
    getCombination(arr + [i])
  }
}

getCombination([])

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 ..< 4 ~= r && 0 ..< 4 ~= c
}

func moveShark(_ board: inout [[Int]]) -> [(Int, Int)] {
  var maxCnt = -1
  var res = [(Int, Int)]()

  for direction in dirShark {
    var temp = [(Int, Int)]()
    var cnt = 0
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: 4), count: 4)

    var nr = shark.0
    var nc = shark.1

    for i in direction {
      nr += dir[i].0
      nc += dir[i].1

      if !inBound(nr, nc) { break }
      if !isVisited[nr][nc] { cnt += board[nr][nc] }

      isVisited[nr][nc] = true
      temp.append((nr, nc))
    }

    if temp.count < 3 { continue }

    if maxCnt < cnt {
      maxCnt = cnt
      res = temp
    }
  }

  shark = (res[2].0, res[2].1)

  return res
}

for turn in 1 ... s {
  var nextFishes = [[[Int]]](
    repeating: [[Int]](
      repeating: [Int](
        repeating: 0,
        count: 8),
      count: 4),
    count: 4)

  var nextNumOfFishes = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)

  for r in 0 ..< 4 {
    for c in 0 ..< 4 {
      if numOfFishes[r][c] == 0 { continue }

      for d in 0 ..< 8 {
        if fishes[r][c][d] == 0 { continue }
        var isMove = false

        for i in 0 ..< 8 {
          let nr = r + dirFish[(d - i + 8) % 8].0
          let nc = c + dirFish[(d - i + 8) % 8].1

          if !inBound(nr, nc) || turn - fishSmell[nr][nc] <= 2 || (nr, nc) == shark { continue }

          nextFishes[nr][nc][(d - i + 8) % 8] += fishes[r][c][d]
          nextNumOfFishes[nr][nc] += fishes[r][c][d]
          isMove = true

          break
        }

        if !isMove {
          nextFishes[r][c][d] += fishes[r][c][d]
          nextNumOfFishes[r][c] += fishes[r][c][d]
        }
      }
    }
  }


  let route = moveShark(&nextNumOfFishes)

  for (r, c) in route {
    if nextNumOfFishes[r][c] == 0 { continue }

    nextNumOfFishes[r][c] = 0
    fishSmell[r][c] = turn

    (0 ..< 8).forEach { i in
      nextFishes[r][c][i] = 0
    }
  }

  for r in 0 ..< 4 {
    for c in 0 ..< 4 {
      if numOfFishes[r][c] == 0 { continue }

      nextNumOfFishes[r][c] += numOfFishes[r][c]

      (0 ..< 8).forEach { i in
        nextFishes[r][c][i] += fishes[r][c][i]
      }
    }
  }

  fishes = nextFishes
  numOfFishes = nextNumOfFishes
}

print(numOfFishes.map { $0.reduce(0, +) }.reduce(0, +))
