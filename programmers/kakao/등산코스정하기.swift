/*
 프로그래머스 등산코스 정하기
 22.09.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct Heap {
    var arr = [(Int, Int)]()
    var size = 0
    var isEmtpy: Bool { size == 0 }

    mutating func push(_ target: (Int, Int)) {
        arr.append(target)
        var cur = size

        while cur > 0 && arr[cur].1 < arr[(cur - 1) / 2].1 {
            let temp = arr[(cur - 1) / 2]
            arr[(cur - 1) / 2] = arr[cur]
            arr[cur] = temp
            cur = (cur - 1) / 2
        }

        size += 1
    }

    mutating func pop() -> (Int, Int) {
        let res = arr[0]
        size -= 1
        if size > 0 {
            arr[0] = arr.removeLast()
        } else {
            arr.removeLast()
        }
        var cur = 0

        while cur * 2 + 1 < size {
            var child = 0, left = cur * 2 + 1, right = cur * 2 + 2

            if right == size {
                child = left
            } else {
                child = arr[left].1 < arr[right].1 ? left : right
            }

            if arr[cur].1 < arr[child].1 { break }

            let temp = arr[child]
            arr[child] = arr[cur]
            arr[cur] = temp
            cur = child
        }

        return res
    }
}

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {

    let INF = 11111111
    var intensity = [Int](repeating: INF, count: n + 1)
    var graph = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)
    var answer = [0, INF]
    var isSummit = [Bool](repeating: false, count: n + 1)

    for path in paths {
        graph[path[0]].append((path[1], path[2]))
        graph[path[1]].append((path[0], path[2]))
    }

    var pq = Heap()

    for gate in gates {
        pq.push((gate, 0))
        intensity[gate] = 0
    }

    for summit in summits { isSummit[summit] = true }

    while !pq.isEmtpy {
        let now = pq.pop()

        if intensity[now.0] < now.1 { continue }

        for (next, w) in graph[now.0] {
            if max(intensity[now.0], w) < intensity[next] {
                intensity[next] = max(intensity[now.0], w)
                if isSummit[next] { continue }
                pq.push((next, intensity[next]))
            }
        }
    }

    for summit in summits.sorted(by: <) {
        if intensity[summit] < answer[1] {
            answer = [summit, intensity[summit]]
        }
    }

    return answer
}

print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]]    ,[1, 3]    ,[5]    ))
