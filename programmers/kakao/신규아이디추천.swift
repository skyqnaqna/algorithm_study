/*
 프로그래머스 신규 아이디 추천
 21.07.03
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

func step1(_ id: String) -> String {
    return id.lowercased()
}

func step2(_ id: String) -> String {
    var result = [String]()
    for char in id {
        if char >= "a" && char <= "z" {
            result.append(String(char))
        } else if char == "." || char == "-" || char == "_" {
            result.append(String(char))
        } else if char >= "0" && char <= "9" {
            result.append(String(char))
        }
    }
    
    return result.map{ $0 }.joined()
}

func step3(_ id: String) -> String {
    var result = [String]()
    let str = id.map{ String($0) }
    result.append(str[0])
    
    for i in 1 ..< str.count {
        if str[i] == "." && str[i - 1] == "." {
            continue
        }
        result.append(str[i])
    }
    
    return result.map{ $0 }.joined()
}

func step4(_ id: String) -> String {
    var result = id.map{ String($0) }
    if result[0] == "." {
        result.removeFirst()
    }
    if result.last == "." {
        result.removeLast()
    }
    return result.map{ $0 }.joined()
}

func step5(_ id: String) -> String {
    if id.isEmpty {
        return "a"
    } else {
        return id
    }
}

func step6(_ id: String) -> String {
    var result = id.map{ String($0) }
    
    if result.count > 15 {
        if result[14] == "." {
            return result[0..<14].joined()
        } else {
            return result[0..<15].joined()
        }
    } else {
        return id
    }
}

func step7(_ id: String) -> String {
    var len = id.count
    var result = id
    
    if len < 3{
        let last = String(id.last!)
        
        while result.count < 3 {
            result += last
        }
        return result
    } else {
        return id
    }
}

func solution(_ new_id:String) -> String {
    var id = new_id
    id = step1(id)
    id = step2(id)
    id = step3(id)
    id = step4(id)
    id = step5(id)
    id = step6(id)
    id = step7(id)
    
    return id
}
