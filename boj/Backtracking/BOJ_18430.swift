/*
 백준 18430 무기 공학
 22.05.25
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]
let shape = [(3, 2), (3, 0), (0, 1), (1, 2)]

var graph = [[Int]](repeating: [Int](), count: n)
var isUsed = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for i in 0 ..< n {
    graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var answer = 0

func inBound(_ r: Int, _ c: Int) -> Bool {
    return 0 <= r && r < n && 0 <= c && c < m
}


func recursive(_ row: Int, _ col: Int, _ sum: Int) {
    if n <= row || m <= col{
        answer = max(answer, sum)

        return
    }

    if !isUsed[row][col] {
        for (l, r) in shape {
        let lr = row + direction[l].0
        let lc = col + direction[l].1
        let rr = row + direction[r].0
        let rc = col + direction[r].1

        if !inBound(lr, lc) || !inBound(rr, rc) || isUsed[lr][lc] || isUsed[rr][rc] { continue }

        isUsed[lr][lc] = true
        isUsed[rr][rc] = true
        isUsed[row][col] = true

        let newSum = sum + graph[lr][lc] + graph[rr][rc] + graph[row][col] * 2

        recursive(col + 1 == m ? row + 1 : row, col + 1 == m ? 0 : col + 1, newSum)

        isUsed[row][col] = false
        isUsed[lr][lc] = false
        isUsed[rr][rc] = false
        }
    }
    recursive(col + 1 == m ? row + 1 : row, col + 1 == m ? 0 : col + 1, sum)
}

recursive(0, 0, 0)

print(answer)



