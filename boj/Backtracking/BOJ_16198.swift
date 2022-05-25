/*
 백준 16198 에너지 모으기
 22.05.25
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var arrs = readLine()!.split(separator: " ").map { Int(String($0))! }
var visited = [Bool](repeating: false, count: n)

var answer = 0

func recursive(_ arr: [Int], _ energy: Int) {
    if arr.count < 3 {
        answer = max(answer, energy)
        return
    }

    for i in arr.indices {
        if i == 0 || i == arr.count - 1 { continue }

        let left = Array(arr[..<i])
        let right = Array(arr[(i+1)...])
        recursive(left + right, energy + arr[i - 1] * arr[i + 1])
    }
}

recursive(arrs, 0)

print(answer)
