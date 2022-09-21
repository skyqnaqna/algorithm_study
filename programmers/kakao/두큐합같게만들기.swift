/*
 프로그래머스 두 큐 합 같게 만들기
 22.09.22
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    if (sum1 + sum2) % 2 != 0 { return -1 }

    var answer = 0
    var i1 = 0, i2 = 0
    var q1 = queue1, q2 = queue2

    for _ in 0 ..< queue1.count * 3 {
        if sum1 == sum2 { break }
        else if sum1 > sum2 {
            sum1 -= q1[i1]
            sum2 += q1[i1]
            q2.append(q1[i1])
            i1 += 1
        } else {
            sum2 -= q2[i2]
            sum1 += q2[i2]
            q1.append(q2[i2])
            i2 += 1
        }

        answer += 1
    }

    return sum1 == sum2 ? answer : -1
}
