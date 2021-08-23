/*
 백준 16927 배열 돌리기 2
 21.08.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], r = input[2]
let direction = [(1, 0), (0, 1), (-1, 0), (0, -1)] // (하, 우, 상, 좌) 반시계 방향

var graph = [[Int]]() // 원본 그래프

// graph에서 현재 위치에 해당하는 frame 정보 저장
var frameToGraph = [[(Int, Int)]](repeating: [(Int, Int)](repeating: (0, 0), count: m), count: n)
var frames = [[Int]]() // frame별로 그래프의 값을 저장 (frames[0] -> 가장 바깥 프레임)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 0 ..< min(n, m) / 2 {
  let sizeRow = n - 1 - i
  let sizeCol = m - 1 - i
  if !visited[i][i] {
    getFrame(startRow: i, startCol: i, endRow: sizeRow, endCol: sizeCol)
  } else { break }
}

func getFrame(startRow sr: Int, startCol sc: Int, endRow er: Int, endCol ec: Int) {
  var q = [(Int, Int)]() // graph에서 현재 프레임에 해당하는 좌표들을 담을 큐
  var frame = [Int]() // 프레임에 속한 값들 저장
  var d = 3, front = 0
  visited[sr][sc] = true
  q.append((sr, sc))
  frame.append(graph[sr][sc])
  // frameToGraph[sr][sc] 위치에 매핑되는 프레임은 sr번째 프레임의 front번째 요소임
  frameToGraph[sr][sc] = (sr, front)

  while front < q.count {
    let (r, c) = q[front]
    front += 1

    // 프레임의 모서리면 방향 바꿔주기
    if (r == sr || r == er) && (c == sc || c == ec) {
      d = (d + 1) % 4
    }

    let nr = r + direction[d].0
    let nc = c + direction[d].1

    if !visited[nr][nc] {
      q.append((nr, nc))
      visited[nr][nc] = true
      frameToGraph[nr][nc] = (sr, front)
      frame.append(graph[nr][nc])
    }
  }

  frames.append(frame)
}

// 회전은 count만큼 시작점을 시계방향으로 이동시킴
func move(_ frameIdx: Int, _ count: Int) {
  let size = frames[frameIdx].count
  var pos = -count % size + size

  while pos > 0 {
    pos -= 1
    frames[frameIdx].append(frames[frameIdx].first!)
    frames[frameIdx].removeFirst()
  }
}

func printResult() {
  var ans = ""
  for i in 0 ..< n {
    for j in 0 ..< m {
      let (fi, fj) = frameToGraph[i][j]
      ans += "\(frames[fi][fj]) "
    }
    ans += "\n"
  }

  print(ans)
}

for i in frames.indices {
  move(i, r)
}

printResult()