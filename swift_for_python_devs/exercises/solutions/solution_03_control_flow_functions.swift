// 연습문제 03 해답: 제어 흐름 및 함수

// --- 제어 흐름 ---

// 1. If-Else:
print("--- 1. If-Else ---") // 문자열 리터럴 번역
func checkTemperature(celsius: Double) {
    if celsius < 0 {
        print("\(celsius)°C: 얼어붙을 것 같아요!") // 문자열 리터럴 번역
    } else if celsius >= 0 && celsius < 15 { // 이전 조건이 false이면 celsius < 15로 충분
        print("\(celsius)°C: 추워요.") // 문자열 리터럴 번역
    } else if celsius >= 15 && celsius < 25 { // celsius < 25로 충분
        print("\(celsius)°C: 쾌적해요.") // 문자열 리터럴 번역
    } else { // celsius >= 25
        print("\(celsius)°C: 따뜻해요!") // 문자열 리터럴 번역
    }
}
checkTemperature(celsius: -5.0)
checkTemperature(celsius: 10.0)
checkTemperature(celsius: 20.0)
checkTemperature(celsius: 30.0)


// 2. Switch 문:
print("\n--- 2. Switch 문 ---") // 문자열 리터럴 번역
func getSeason(month: String) -> String {
    switch month.lowercased() { // 대소문자 구분 없음을 위해 lowercased() 사용
    case "december", "january", "february": // 12월, 1월, 2월
        return "겨울" // 문자열 리터럴 번역
    case "march", "april", "may": // 3월, 4월, 5월
        return "봄"   // 문자열 리터럴 번역
    case "june", "july", "august": // 6월, 7월, 8월
        return "여름" // 문자열 리터럴 번역
    case "september", "october", "november": // 9월, 10월, 11월
        return "가을" // 문자열 리터럴 번역
    default:
        return "잘못된 월" // 문자열 리터럴 번역
    }
}
print("1월의 계절: \(getSeason(month: "January"))") // 문자열 리터럴 번역 (월 이름)
print("6월의 계절: \(getSeason(month: "June"))")   // 문자열 리터럴 번역 (월 이름)
print("10월의 계절: \(getSeason(month: "OCTOBER"))") // 대소문자 구분 없음 테스트 (문자열 리터럴 번역)
print("Swiftember의 계절: \(getSeason(month: "Swiftember"))") // 문자열 리터럴 번역


// 3. For-In 반복문:
print("\n--- 3. For-In 반복문 ---") // 문자열 리터럴 번역
//    a. 좋아하는 숫자 배열(정수 최소 5개)을 만드세요.
let favoriteNumbers = [7, 42, 13, 21, 8]
print("a. 좋아하는 숫자: \(favoriteNumbers)") // 문자열 리터럴 번역

//    b. For-in 반복문을 사용하여 배열을 반복하고 각 숫자의 제곱(숫자 * 숫자)을 출력하세요.
print("b. 제곱된 숫자:") // 문자열 리터럴 번역
for number in favoriteNumbers {
    print("   \(number)의 제곱은 \(number * number)입니다.") // 문자열 리터럴 번역
}

//    c. `studentScores = ["Alice": 88, "Bob": 92, "Charlie": 75, "David": 95]` 딕셔너리가 주어졌을 때,
//       for-in 반복문을 사용하여 각 학생의 이름과 점수를 출력하세요.
let studentScores = ["앨리스": 88, "밥": 92, "찰리": 75, "데이빗": 95] // 문자열 리터럴 번역 (이름)
print("c. 학생 점수:") // 문자열 리터럴 번역
for (student, score) in studentScores {
    print("   \(student) 학생의 점수는 \(score)점입니다.") // 문자열 리터럴 번역
}


// 4. While 반복문:
print("\n--- 4. While 반복문 ---") // 문자열 리터럴 번역
func countdown(from start: Int) {
    var current = start
    while current > 0 {
        print(current)
        current -= 1
    }
    print("발사!") // 문자열 리터럴 번역
}
countdown(from: 3)


// 5. Guard 문:
print("\n--- 5. Guard 문 ---") // 문자열 리터럴 번역
func processOrder(item: String?, quantity: Int?) {
    guard let itemName = item, !itemName.isEmpty else { // 아이템 이름이 비어있지 않은지도 확인
        print("주문 실패: 아이템 이름 누락 또는 비어있음.") // 문자열 리터럴 번역
        return
    }
    guard let itemQuantity = quantity, itemQuantity > 0 else {
        print("주문 실패: \(itemName)에 대한 잘못된 수량.") // 문자열 리터럴 번역
        return
    }
    print("주문 처리 중: \(itemName) \(itemQuantity)개.") // 문자열 리터럴 번역
}
processOrder(item: "사과", quantity: 5) // 문자열 리터럴 번역
processOrder(item: nil, quantity: 3)
processOrder(item: "", quantity: 3) // 빈 아이템 이름 테스트
processOrder(item: "바나나", quantity: nil) // 문자열 리터럴 번역
processOrder(item: "오렌지", quantity: 0) // 문자열 리터럴 번역
processOrder(item: "배", quantity: -2) // 문자열 리터럴 번역


// --- 함수 ---

// 6. 기본 함수:
print("\n--- 6. 기본 함수 ---") // 문자열 리터럴 번역
func calculateArea(width: Double, height: Double) -> Double {
    return width * height
}
let area = calculateArea(width: 10.5, height: 4.0)
print("10.5x4.0 사각형의 면적: \(area)") // 문자열 리터럴 번역


// 7. 인자 레이블 및 매개변수 이름:
print("\n--- 7. 인자 레이블 ---") // 문자열 리터럴 번역
func greet(person name: String, nicelyFrom city: String) {
    // `name`과 `city`는 내부 매개변수 이름입니다.
    // `person`과 `nicelyFrom`은 외부 인자 레이블입니다.
    print("안녕하세요 \(name)님! \(city)에서 인사드립니다.") // 문자열 리터럴 번역
}
greet(person: "앨리스", nicelyFrom: "런던") // 문자열 리터럴 번역


// 8. 인자 레이블 생략:
print("\n--- 8. 인자 레이블 생략 ---") // 문자열 리터럴 번역
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
let sumOfTwo = add(5, 3)
print("5와 3의 합 (레이블 생략됨): \(sumOfTwo)") // 문자열 리터럴 번역


// 9. 기본 매개변수 값:
print("\n--- 9. 기본 매개변수 값 ---") // 문자열 리터럴 번역
func sendMessage(_ message: String, to recipient: String = "고객지원팀") { // 문자열 리터럴 번역
    print("수신자 \(recipient)에게 '\(message)' 메시지 전송 중") // 문자열 리터럴 번역
}
sendMessage("시스템 중요 오류 발생!") // 기본 수신자 "고객지원팀" 사용 (문자열 리터럴 번역)
sendMessage("계정 관련 도움이 필요합니다", to: "결제팀") // 수신자 지정 (문자열 리터럴 번역)


// 10. 가변 매개변수:
print("\n--- 10. 가변 매개변수 ---") // 문자열 리터럴 번역
func findMax(_ numbers: Int...) -> Int? {
    if numbers.isEmpty {
        return nil
    }
    var currentMax = numbers[0] // 또는 Int.min
    for number in numbers {
        if number > currentMax {
            currentMax = number
        }
    }
    return currentMax
}
print("1, 5, 2, 8, 3 중 최대값: \(findMax(1, 5, 2, 8, 3) ?? -1)") // 문자열 리터럴 번역
print("10의 최대값: \(findMax(10) ?? -1)") // 문자열 리터럴 번역
print("숫자 없음의 최대값: \(findMax() ?? -1)") // -1은 여기서 nil이 반환되었음을 의미 (문자열 리터럴 번역)


// 11. In-Out 매개변수:
print("\n--- 11. In-Out 매개변수 ---") // 문자열 리터럴 번역
func squareInPlace(_ number: inout Int) {
    number = number * number
}
var myValue = 5
print("원본 값: \(myValue)") // 문자열 리터럴 번역
squareInPlace(&myValue) // &와 함께 전달
print("squareInPlace 후 값: \(myValue)") // 문자열 리터럴 번역


// 12. 함수 타입 및 고차 함수:
print("\n--- 12. 함수 타입 및 고차 함수 ---") // 문자열 리터럴 번역
//     a. 두 개의 String을 받아 String을 반환하는 함수를 나타내는 함수 타입 `StringOperation`을 정의하세요.
typealias StringOperation = (String, String) -> String

//     b. 이 타입과 일치하는 두 함수를 작성하세요:
//        - `concatenateStrings(_ s1: String, _ s2: String) -> String`
//        - `compareAndReturnLonger(_ s1: String, _ s2: String) -> String`
func concatenateStrings(_ s1: String, _ s2: String) -> String {
    return s1 + s2
}
func compareAndReturnLonger(_ s1: String, _ s2: String) -> String {
    return s1.count >= s2.count ? s1 : s2
}

//     c. 두 문자열과 `StringOperation` 함수를 받아 연산을 적용한 결과를 반환하는
//        고차 함수 `processStrings(s1: String, s2: String, using operation: StringOperation) -> String`를 작성하세요.
func processStrings(s1: String, s2: String, using operation: StringOperation) -> String {
    return operation(s1, s2)
}

//     d. 두 연산 함수 모두로 `processStrings`를 테스트하세요.
let string1 = "안녕하세요" // 문자열 리터럴 번역
let string2 = "월드와이드웹" // 문자열 리터럴 번역

let concatenated = processStrings(s1: string1, s2: string2, using: concatenateStrings)
print("연결됨: \(concatenated)") // 문자열 리터럴 번역

let longerString = processStrings(s1: string1, s2: string2, using: compareAndReturnLonger)
print("더 긴 문자열: \(longerString)") // 문자열 리터럴 번역
```
