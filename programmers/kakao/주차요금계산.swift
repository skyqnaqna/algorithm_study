/*
 프로그래머스 주차 요금 계산
 22.02.17
 */

import Foundation

func convertTime(_ str: String) -> Int {
  let time = str.split(separator: ":").map { Int(String($0))! }
  return time[0] * 60 + time[1]
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
  let basicTime = fees[0], basicFee = fees[1], timeRate = fees[2], feeRate = fees[3]
  let maxTime = 1439
  var carNums = Set<String>()
  var inTime = [String: Int](), totalTime = [String: Int]()
  var answer = [Int]()
  
  for str in records {
    let record = str.split(separator: " ").map { String($0) }
    carNums.insert(record[1])
    
    if record[2] == "IN" {
      inTime[record[1]] = convertTime(record[0])
    } else {
      totalTime[record[1], default: 0] += convertTime(record[0]) - inTime[record[1]]!
      inTime[record[1]] = -1
    }
  }
  
  let carNumArr = Array(carNums).sorted()
  
  for num in carNumArr {
    if inTime[num] != -1 {
      totalTime[num, default: 0] += maxTime - inTime[num]!
    }
    
    var res = basicFee
    if totalTime[num, default: 0] > basicTime {
      res += Int((Double(totalTime[num]! - basicTime) / Double(timeRate)).rounded(.up)) * feeRate
    }
    
    answer.append(res)
  }
  
  return answer
}


print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))

print(solution([1, 461, 1, 10]  , ["00:00 1234 IN"]  ))
