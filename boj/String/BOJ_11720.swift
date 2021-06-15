/*
 백준 11720 숫자의 합
 21.06.15
 https://github.com/skyqnaqna/algorithm_study
 */

readLine()
print(readLine()!.map{ Int(String($0))! }.reduce(0, +))
