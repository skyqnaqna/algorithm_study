/*
 백준 15724 주지수
 21.09.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var prefixSum = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)

for i in 0 ..< n {
    graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }

    prefixSum[i + 1][1] = graph[i][0]
    for j in stride(from: 2, through: m, by: 1) {
        prefixSum[i + 1][j] += graph[i][j - 1] + prefixSum[i + 1][j - 1]
    }
}

if n > 1 {
    for j in stride(from: 1, through: m, by: 1) {
        for i in stride(from: 2, through: n, by: 1) {
            prefixSum[i][j] += prefixSum[i - 1][j]
        }
    }
}

var k = Int(readLine()!)!
var answer = ""

while k > 0 {
    k -= 1
    let q = readLine()!.split(separator: " ").map { Int(String($0))! }
    let r1 = q[0], c1 = q[1], r2 = q[2], c2 = q[3]
    
    let ans = prefixSum[r2][c2] - prefixSum[r1 - 1][c2] - prefixSum[r2][c1 - 1] + prefixSum[r1 - 1][c1 - 1]

    answer += "\(ans)\n"
}

print(answer)
