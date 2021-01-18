# 럭키 스트레이트

n = input()
length = len(n)
sumN = 0

for i in range(length//2):
    sumN += int(n[i])

for i in range(length//2, length):
    sumN -= int(n[i])

if sumN == 0:
    print("LUCKY")
else:
    print("READY")