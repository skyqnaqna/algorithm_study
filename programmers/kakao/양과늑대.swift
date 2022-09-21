/*
 프로그래머스 두 큐 합 같게 만들기
 22.09.22
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [Int](), count: 17)
    var isVisited = [Bool](repeating: false, count: 17)

    for edge in edges { graph[edge[0]].append(edge[1]) }

    var answer = 1

    func dfs(_ sheep: Int, _ wolf: Int, _ nextNodes: [Int]) {

        if answer < sheep { answer = sheep }

        for nextNode in nextNodes {
            if isVisited[nextNode] { continue }
            if info[nextNode] == 1 && wolf + 1 < sheep {
                isVisited[nextNode] = true
                dfs(sheep, wolf + 1, nextNodes + graph[nextNode])
                isVisited[nextNode] = false
            } else if info[nextNode] == 0 {
                isVisited[nextNode] = true
                dfs(sheep + 1, wolf, nextNodes + graph[nextNode])
                isVisited[nextNode] = false
            }
        }
    }

    dfs(1, 0, graph[0])

    return answer
}
