/*
 백준 16948 데스 나이트
 22.09.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let dir = [(-2, -1), (-2, 1), (0, -2), (0, 2), (2, -1), (2, 1)]

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let r1 = input[0], c1 = input[1], r2 = input[2], c2 = input[3]

var dist = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)

func inBound(_ r: Int, _ c: Int) -> Bool {
    return 0 <= r && r < n && 0 <= c && c < n
}

var q = [(Int, Int)](), front = 0

q.append((r1, c1))
dist[r1][c1] = 0

while front < q.count {
    let (r, c) = q[front]
    front += 1

    for (dy, dx) in dir {
        let nr = r + dy
        let nc = c + dx

        if !inBound(nr, nc) || dist[nr][nc] != -1 { continue }

        dist[nr][nc] = dist[r][c] + 1
        q.append((nr, nc))
    }
}

print(dist[r2][c2])
