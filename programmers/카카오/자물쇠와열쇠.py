import copy


def solution(key, lock):
    answer = False
    length = len(lock)
    keyLen = len(key)
    graph = [[0] * (length * 3) for _ in range(length * 3)]

    resetGraph(graph, lock, length)

    for _ in range(4):
        for r in range(len(graph) - keyLen):
            for c in range(len(graph) - keyLen):
                for i in range(keyLen):
                    for j in range(keyLen):
                        graph[r+i][c+j] += key[i][j]

                if checkLock(graph, length):
                    return True
                else:
                    resetGraph(graph, lock, length)

        rotateRight(key)

    return answer


def resetGraph(graph, lock, length):
    for i in range(length):
        for j in range(length):
            graph[i + length][j + length] = lock[i][j]



def rotateRight(arr):
    length = len(arr)
    temp = copy.deepcopy(arr)

    for i in range(length):
        for j in range(length):
            arr[j][length - 1 - i] = temp[i][j]


def checkLock(arr, length):
    for i in range(length):
        for j in range(length):
            if arr[i+length][j+length] != 1:
                return False
    return True


print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))