import Foundation

/// 오류 타입의 열거형
/// - noName: 이름을 전달받지 못했을 때 발생하는 오류
/// - incorrectAge(age: Int) 나이가 0세 미만, 150세 초과인 경우 오류로 처리
/// - unKnown: 알 수 없는 오류
enum HelloError: Error {
  case noName
  case incorrectAge(age: Int)
  case unknown
}

/**
 여기에 작성되는 텍스트는 Description 부분에 표기됨.

 텍스트 간에 한 줄을 비워놓으면 줄바꿈이 됨.

 -, +, * 를 사용하여 원형 글머리 기호를 사용할 수 있음.

 - 이렇게
 + 이렇게
 * 이렇게

 번호로 글머리 기호도 매길 수 있음.

 1. 1번
 2. 2번
 3. 3번

 ----
 문단 바꿈

 바를 세 개 이상 사용하면 긴 줄로 문단을 나눔.

 ----

 언더바 또는 별표를 사용하여 텍스트 강조

 *기울이기*

 **텍스트 굵게**

링크 삽입
 [Swift Blog](https://swift.org/blog/)

 ---
 등호를 사용하면 바로 위 텍스트를 큰 제목으로 표시
 #을 하나 붙여줘도 동일한 효과

 큰 제목
 ===

 바를 사용하면 바로 위 텍스트를 중간 크기 제목으로 표시
 #을 두 개 붙여줘도 동일한 효과

 중간 크기 제목
 ---

 다른 텍스트보다 네 칸 이상 들여쓰기하면 코드 블록 생성
 또한 강세표(backquote, `)를 세 개 이상 묶어도 동일

    // 코멘트도 가능
     let myName: String = "yagom"
      try helloSwift(myName, yourAge: 100)

````
 let myName: String = "yagom"
 try helloSwift(myName, yourAge: 100)
````

 Precondition, Postcondition, Requires, Invariant, Complexity, Important, Warning, Author, Authors,
 Copyright, Date, SeeAlso, Since, Version, Attention, Bug, Experiment, Note, Remark, ToDo 등의 키워드를 통해 적절한 정보를 제공.
 - note: 강조하고픈 메모를 남길 수 있음
 - author: 작성자를 남길 수 있음
 - warning: 주의해야 할 점을 남길 수 있음

 ---
 > 매개변수와 반환 값 등도 적절히 표기해줄 수 있음
 - parameters:
  - yourName: 당신의 이름
  - yourAge: 당신의 나이
- Throws: 오류가 발생하면 HelloError의 한 케이스를 throw
- returns: Hello string
 */
func helloSwift(yourName: String?, yourAge age: Int = 0) throws -> String {
  guard let name: String = yourName else {
    throw HelloError.noName
  }

  if age > 150 {
    throw HelloError.incorrectAge(age: age)
  }

  return "Hello Swfit! My name is \(name)." + (age > 0 ? " I'm \(age) years old." : "")
}

