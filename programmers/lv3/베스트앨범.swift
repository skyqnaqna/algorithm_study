/*
 프로그래머스 베스트앨범
 22.03.25
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
  var genresPlays = [String: Int]()
  var genresMusics = [String: [[Int]]]()
  var answer = [Int]()
  
  for i in genres.indices {
    genresPlays[genres[i], default: 0] += plays[i]
    genresMusics[genres[i], default: [[Int]]()].append([i, plays[i]])
  }
  
  let genresRanking = Array(genresPlays).sorted(by: { $0.value > $1.value })
  
  for (genre, _) in genresRanking {
    let sortedMusics = genresMusics[genre]!.sorted(by: {
      if $0[1] == $1[1] {
        return $0[0] < $1[0]
      } else {
        return $0[1] > $1[1]
      }
    })
    
    answer.append(sortedMusics[0][0])
    if sortedMusics.count > 1 {
      answer.append(sortedMusics[1][0])
    }
  }
  
  return answer
}

print(solution(["classic", "pop", "classic", "classic", "pop"]  , [500, 600, 150, 800, 2500]  ))
print(solution(["classic" ]  , [800]  ))
