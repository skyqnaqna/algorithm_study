# 백준 4256 트리
# 22.01.21
# https://github.com/skyqnaqna/algorithm_study

import sys 
# from collections import deque, defaultdict
rd = sys.stdin.readline
sys.setrecursionlimit(50000)

def postorder(s, e, root):
	for i in range(s, e):
		if preorder[root] == inorder[i]:
			postorder(s, i, root + 1)
			postorder(i + 1, e, root + i - s + 1) # root의 오른쪽 자식 인덱스는 왼쪽 서브트리 노드의 수 + 1
			answer.append(str(preorder[root]))


t = int(rd())
for _ in range(t):
	n = int(rd())
	preorder = list(map(int, rd().split()))
	inorder = list(map(int, rd().split()))
	answer = []
	postorder(0, n, 0)
	print(' '.join(answer))
