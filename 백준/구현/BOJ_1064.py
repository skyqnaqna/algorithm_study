# 백준 1064 평행사변형
# 21.01.17
import math
INF = 2147483647

xy = list(map(int, input().split()))
# point1 = (xy[0], xy[1])
# point2 = (xy[2], xy[3])
# point3 = (xy[4], xy[5])
# 기울기 구해서 점들이 직선상에 있는지 확인
dx1 = xy[0] - xy[2]
dy1 = xy[1] - xy[3]
dx2 = xy[2] - xy[4]
dy2 = xy[3] - xy[5]

slope1 = 0
slope2 = 0

if dx1 == 0: slope1 = INF
else:
    slope1 = dy1 / dx1
if dx2 == 0: slope2 = INF
else:
    slope2 = dy2 / dx2

if slope1 == slope2:
    print(-1)
else:
    # 세 변 길이 구하기
    a = math.sqrt((xy[0] - xy[2]) ** 2 + (xy[1] - xy[3]) ** 2)
    b = math.sqrt((xy[0] - xy[4]) ** 2 + (xy[1] - xy[5]) ** 2)
    c = math.sqrt((xy[2] - xy[4]) ** 2 + (xy[3] - xy[5]) ** 2)

    sq1 = 2 * a + 2 * b
    sq2 = 2 * a + 2 * c
    sq3 = 2 * b + 2 * c

    maxLen = max(sq1, sq2, sq3)
    minLen = min(sq1, sq2, sq3)

    print(maxLen - minLen)