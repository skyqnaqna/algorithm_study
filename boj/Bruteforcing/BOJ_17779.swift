/*
 백준 17779 게리맨더링 2
 22.10.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var graph = [[Int]]()
var isFifth = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var total = 0

for _ in 0 ..< n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    total += graph.last!.reduce(0, +)
}

var answer = total

func fifthArea(_ r: Int, _ c: Int, _ d1: Int, _ d2: Int, _ connect: Bool) {
    for i in 0 ... d1 {
        isFifth[r + i][c - i] = connect
        isFifth[r + d2 + i][c + d2 - i] = connect
    }

    for i in 0 ... d2 {
        isFifth[r + i][c + i] = connect
        isFifth[r + d1 + i][c - d1 + i] = connect
    }
}

func sumArea(_ r: Int, _ c: Int, _ d1: Int, _ d2: Int, _ seq: Int) -> Int {
    var res = 0
    switch seq {
    case 0:
        for i in 0 ..< r + d1 {
            for j in 0 ... c {
                if isFifth[i][j] { break }
                res += graph[i][j]
            }
        }

    case 1:
        for i in 0 ... r + d2 {
            for j in stride(from: n - 1, to: c, by: -1) {
                if isFifth[i][j] { break }
                res += graph[i][j]
            }
        }

    case 2:
        for i in r + d1 ..< n {
            for j in 0 ..< c - d1 + d2 {
                if isFifth[i][j] { break }
                res += graph[i][j]
            }
        }

    case 3:
        for i in r + d2 + 1 ..< n {
            for j in stride(from: n - 1, through: c - d1 + d2, by: -1) {
                if isFifth[i][j] { break }
                res += graph[i][j]
            }
        }

    default:
        return 0
    }

    return res
}

for r in 0 ..< n - 2 {
    for c in 1 ..< n - 1 {
        for d1 in 1 ..< n {
            if r + d1 >= n || c - d1 < 0 { break }
            for d2 in 1 ..< n {
                if r + d1 + d2 >= n || c + d2 >= n { break }

                fifthArea(r, c, d1, d2, true)

                var sumList = [Int]()

                var minVal = total
                var maxVal = 0

                for i in 0 ..< 4 {
                    sumList.append(sumArea(r, c, d1, d2, i))
                    if sumList.last! < minVal {
                        minVal = sumList.last!
                    }
                    if sumList.last! > maxVal {
                        maxVal = sumList.last!
                    }
                }

                let fifth = total - sumList.reduce(0, +)

                if fifth < minVal { minVal = fifth }
                if fifth > maxVal { maxVal = fifth }

                if maxVal - minVal < answer {
                    answer = maxVal - minVal
                }

                fifthArea(r, c, d1, d2, false)
            }
        }
    }
}

print(answer)
