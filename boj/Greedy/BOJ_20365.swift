/*
 백준 20365 블로그2
 22.10.17
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let str = readLine()!.map { String($0) }

var cnt = [Int](repeating: 0, count: 2)
var prev = str[0]

func countColor(_ x: String) {
    if x == "B" {
        cnt[0] += 1
    } else {
        cnt[1] += 1
    }
}

countColor(prev)

for i in 1 ..< n {
    if str[i] != prev {
        countColor(str[i])
        prev = str[i]
    }
}

print(cnt.min()! + 1)
