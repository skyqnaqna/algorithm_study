/*
 백준 10159 저울
 22.09.29
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var connected = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for _ in 0 ..< m {
    let e = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }

    connected[e[0]][e[1]] = true
}

for i in 0 ..< n { connected[i][i] = true }

for k in 0 ..< n {
    for i in 0 ..< n {
        if !connected[i][k] { continue }
        
        for j in 0 ..< n {
            if i == j { continue }
            if !connected[k][j] { continue }

            connected[i][j] = true
        }
    }
}

var cnt = [Int](repeating: 0, count: n)

for i in 0 ..< n - 1 {
    for j in i ..< n {
        if connected[i][j] || connected[j][i] { continue }
        cnt[i] += 1
        cnt[j] += 1
    }
}

print(cnt.map { String($0) }.joined(separator: "\n"))
