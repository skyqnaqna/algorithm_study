/*
 백준 17086 아기 상어 2
 22.09.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let dir = [(-1, 0), (0, 1), (1, 0), (0, -1), (-1, -1), (-1, 1), (1, -1), (1, 1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var dist = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)

var q = [(Int, Int)](), front = 0, answer = 0

func inBound(_ r: Int, _ c: Int) -> Bool {
    return 0 <= r && r < n && 0 <= c && c < m
}

for i in 0 ..< n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }

    for j in 0 ..< m {
        if row[j] == 1 {
            q.append((i, j))
            dist[i][j] = 0
        }
    }
}

while front < q.count {
    let (r, c) = q[front]
    front += 1

    for (dy, dx) in dir {
        let nr = r + dy
        let nc = c + dx

        if !inBound(nr, nc) || dist[nr][nc] != -1 { continue }

        q.append((nr, nc))
        dist[nr][nc] = dist[r][c] + 1

        if answer < dist[nr][nc] { answer = dist[nr][nc] }
    }
}

print(answer)
