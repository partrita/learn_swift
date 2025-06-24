// 파이썬 개발자를 위한 Swift - 예제 03: 연산자

// --- 기본 산술 연산자 ---
// 파이썬과 매우 유사합니다.
let a = 10
let b = 3

print("산술 연산:") // 문자열 리터럴 번역
print("\(a) + \(b) = \(a + b)") // 덧셈
print("\(a) - \(b) = \(a - b)") // 뺄셈
print("\(a) * \(b) = \(a * b)") // 곱셈

// 나눗셈:
// - 정수의 경우, 정수 나눗셈입니다 (소수점 이하 버림)
print("\(a) / \(b) = \(a / b)") // 정수 나눗셈: 10 / 3 = 3
// - 부동 소수점 나눗셈의 경우, 피연산자 중 적어도 하나는 float/double이어야 합니다.
let c: Double = 10.0
let d: Double = 3.0
print("\(c) / \(d) = \(c / d)") // 부동 소수점 나눗셈: 10.0 / 3.0 = 3.333...
print("\(Double(a)) / \(Double(b)) = \(Double(a) / Double(b))") // 명시적 변환

// 나머지 연산자 (모듈로)
// 정수 및 부동 소수점 숫자에 대해 작동합니다.
print("\(a) % \(b) = \(a % b)") // 나머지: 10 % 3 = 1
print("\(c) % \(d) = \(c.truncatingRemainder(dividingBy: d))") // Double의 경우: 10.0 % 3.0 = 1.0
// 참고: 부동 소수점 나머지의 경우, Swift의 % 연산자는 C 스타일의 fmod와 더 유사합니다.
// `truncatingRemainder(dividingBy:)` 메서드는 부동 소수점에 대한 파이썬의 %처럼 동작합니다.

// 단항 마이너스 연산자
let negativeFive = -5
print("음수 5: \(negativeFive)") // 문자열 리터럴 번역

// 단항 플러스 연산자 (아무것도 하지 않지만, 대칭성을 위해 존재)
let positiveThree = +3
print("양수 3: \(positiveThree)") // 문자열 리터럴 번역


// --- 복합 할당 연산자 ---
// 파이썬과 유사합니다 (예: +=, -=, *=, /=)
var score = 100
score += 10 // score는 이제 110 (score = score + 10)
print("+= 10 후 점수: \(score)") // 문자열 리터럴 번역
score -= 20 // score는 이제 90
print("-= 20 후 점수: \(score)") // 문자열 리터럴 번역
score *= 2  // score는 이제 180
print("*= 2 후 점수: \(score)") // 문자열 리터럴 번역
score /= 3  // score는 이제 60
print("/= 3 후 점수: \(score)") // 문자열 리터럴 번역
score %= 7  // score는 이제 4 (60 % 7 = 4)
print("%= 7 후 점수: \(score)") // 문자열 리터럴 번역

// Swift에는 증가(++) 또는 감소(--) 연산자가 없습니다.
// `변수 += 1` 또는 `변수 -= 1`을 사용하십시오.


// --- 비교 연산자 ---
// 파이썬과 유사합니다. 결과는 Bool입니다.
print("\n비교 연산:") // 문자열 리터럴 번역
print("1 == 1: \(1 == 1)")  // 같음
print("2 != 1: \(2 != 1)")  // 같지 않음
print("2 > 1: \(2 > 1)")   // 보다 큼
print("1 < 2: \(1 < 2)")   // 보다 작음
print("1 >= 1: \(1 >= 1)")  // 크거나 같음
print("2 <= 1: \(2 <= 1)")  // 작거나 같음

// 항등 연산자 (클래스 인스턴스용)
// `===` (동일함) 및 `!==` (동일하지 않음)은 두 객체 참조가
// 정확히 동일한 인스턴스를 참조하는지 확인합니다. 파이썬은 `is` 및 `is not`을 사용합니다.
class MyObject {
    var id: Int
    init(id: Int) { self.id = id }
}
let obj1 = MyObject(id: 1)
let obj2 = MyObject(id: 1)
let obj3 = obj1

print("obj1 === obj2: \(obj1 === obj2)") // false (다른 인스턴스)
print("obj1 === obj3: \(obj1 === obj3)") // true (같은 인스턴스)
print("obj1 !== obj2: \(obj1 !== obj2)") // true

// 튜플은 요소가 비교 가능한 경우 비교할 수 있습니다 (사전식 비교)
print("(1, \"사과\") < (2, \"얼룩말\"): \((1, "사과") < (2, "얼룩말"))")   // true, 1 < 2 이므로 (문자열 리터럴 번역)
print("(3, \"사과\") < (3, \"새\"): \((3, "사과") < (3, "새"))")     // true, "사과" < "새" 이므로 (문자열 리터럴 번역)
print("(4, \"얼룩말\") == (4, \"얼룩말\"): \((4, "얼룩말") == (4, "얼룩말"))") // true (문자열 리터럴 번역)
// print((1, "사과") < (1, true)) // 오류: Bool은 < 또는 >와 비교할 수 없습니다.


// --- 삼항 조건 연산자 ---
// `질문 ? 답1 : 답2`
// 파이썬의 `답1 if 조건 else 답2`와 유사합니다.
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// hasHeader가 true이면 rowHeight는 40 + 50 = 90
// hasHeader가 false이면 rowHeight는 40 + 20 = 60
print("행 높이: \(rowHeight)") // 문자열 리터럴 번역


// --- Nil-병합 연산자 (`??`) ---
// `a ?? b`는 옵셔널 `a`가 값을 포함하면 언래핑하고, `a`가 `nil`이면 `b`를 반환합니다.
// `a`가 `None`일 수 있는 경우 파이썬의 `a or b`와 유사하지만, `0` 또는 `False`가 유효한 값인 타입에 대해 더 안전합니다.
let defaultColorName = "빨강" // 문자열 리터럴 번역
var userDefinedColorName: String? // = nil
// userDefinedColorName = "파랑" // 이 값을 사용하려면 주석 해제 (문자열 리터럴 번역)

var colorNameToUse = userDefinedColorName ?? defaultColorName
print("사용할 색상: \(colorNameToUse)") // userDefinedColorName이 nil이면 "빨강", 그렇지 않으면 "파랑" (문자열 리터럴 번역)

// Nil-병합 연산자 연결
var optionalNickname: String? = nil
var optionalFullName: String? = "홍길동" // 문자열 리터럴 번역
var displayName = optionalNickname ?? optionalFullName ?? "손님" // 문자열 리터럴 번역
print("표시 이름: \(displayName)") // "홍길동" (문자열 리터럴 번역)

optionalFullName = nil
displayName = optionalNickname ?? optionalFullName ?? "손님" // 문자열 리터럴 번역
print("표시 이름 (둘 다 nil): \(displayName)") // "손님" (문자열 리터럴 번역)


// --- 범위 연산자 ---
// 파이썬은 `range()` 함수와 슬라이싱을 사용합니다. Swift에는 전용 연산자가 있습니다.

// 닫힌 범위 연산자 (`a...b`) -> `a`와 `b`를 모두 포함
print("\n범위:") // 문자열 리터럴 번역
for index in 1...5 { // 1, 2, 3, 4, 5
    print(index, terminator: " ")
}
print()

// 반-열린 범위 연산자 (`a..<b`) -> `a`를 포함하고 `b`는 포함하지 않음
for index in 1..<5 { // 1, 2, 3, 4
    print(index, terminator: " ")
}
print()

// 단방향 범위 (배열 슬라이싱 등에 사용 가능)
let names = ["안나", "알렉스", "브라이언", "잭", "조이"] // 문자열 리터럴 번역
print("이름들: \(names)") // 문자열 리터럴 번역

let firstTwo = names[..<2] // 처음부터 인덱스 2 전까지: ["안나", "알렉스"]
print("처음 두 명: \(firstTwo)") // 문자열 리터럴 번역

let fromBrianOn = names[2...] // 인덱스 2부터 끝까지: ["브라이언", "잭", "조이"]
print("브라이언부터: \(fromBrianOn)") // 문자열 리터럴 번역

let upToJack = names[...3] // 처음부터 인덱스 3까지 (포함): ["안나", "알렉스", "브라이언", "잭"]
print("잭까지: \(upToJack)") // 문자열 리터럴 번역

// 범위가 값을 포함하는지 확인할 수 있습니다.
let range = 1...10
print("1...10이 5를 포함하는가? \(range.contains(5))")   // true (문자열 리터럴 번역)
print("1...10이 11을 포함하는가? \(range.contains(11))") // false (문자열 리터럴 번역)

let partialRangeFrom = names[2...]
// print(partialRangeFrom.contains("알렉스")) // 오류: PartialRangeFrom에는 contains가 없으므로 구체적인 타입이 필요합니다.
// 범위 개념을 사용하여 원본 배열에서 사용:
if let brianIndex = names.firstIndex(of: "브라이언"), partialRangeFrom.startIndex <= brianIndex { // 문자열 리터럴 번역
    print("브라이언은 인덱스 2부터의 부분 범위에 있습니다.") // 문자열 리터럴 번역
}


// --- 논리 연산자 ---
// `!` (논리 NOT), `&&` (논리 AND), `||` (논리 OR)
// 파이썬의 `not`, `and`, `or`와 유사합니다.
print("\n논리 연산:") // 문자열 리터럴 번역
let allowedEntry = false
if !allowedEntry {
    print("입장이 허용되지 않습니다.") // 출력됨 (문자열 리터럴 번역)
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("환영합니다!") // 문자열 리터럴 번역
} else {
    print("접근 거부.") // 출력됨 (문자열 리터럴 번역)
}

let hasDoorKey = false
let knowsOverrideCode = true
if hasDoorKey || knowsOverrideCode {
    print("환영합니다 (OR 사용)!") // 출력됨 (문자열 리터럴 번역)
} else {
    print("접근 거부 (OR 사용).") // 문자열 리터럴 번역
}

// 논리 연산자 결합 (명확성 및 우선순위를 위한 괄호)
if (enteredDoorCode && passedRetinaScan) || knowsOverrideCode {
    print("환영합니다 (결합된 논리)!") // 출력됨 (문자열 리터럴 번역)
} else {
    print("접근 거부 (결합된 논리).") // 문자열 리터럴 번역
}


// --- 비트 연산자 (일반적인 앱 개발에서는 덜 사용되지만 존재함) ---
// `&` (AND), `|` (OR), `^` (XOR), `~` (NOT), `<<` (왼쪽 시프트), `>>` (오른쪽 시프트)
// 파이썬에도 유사한 연산자가 있습니다.
print("\n비트 연산:") // 문자열 리터럴 번역
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits  // 0b11110000
print("초기값: \(String(initialBits, radix: 2)), 반전값: \(String(invertedBits, radix: 2))") // 문자열 리터럴 번역

let firstFourBits: UInt8  = 0b11110000
let lastFourBits: UInt8   = 0b00001111
let middleFourBits = firstFourBits & lastFourBits // 0b00000000
print("AND: \(String(middleFourBits, radix: 2))")

let someBits: UInt8 = 0b00010100
let moreBits: UInt8 = 0b00000101
let combinedbits = someBits | moreBits // 0b00010101
print("OR: \(String(combinedbits, radix: 2))")

let xorBits = someBits ^ moreBits // 0b00010001
print("XOR: \(String(xorBits, radix: 2))")

let shiftBits: UInt8 = 4 // 0b00000100
let leftShift = shiftBits << 1   // 0b00001000 (8)
let rightShift = shiftBits >> 2  // 0b00000001 (1)
print("시프트: \(shiftBits), 왼쪽: \(leftShift), 오른쪽: \(rightShift)") // 문자열 리터럴 번역


// --- 오버플로 연산자 (&+, &-, &*) ---
// 기본적으로 Swift는 정수 오버플로 발생 시 트랩합니다 (런타임 오류).
// 오버플로 동작(래핑)을 원하면 오버플로 연산자를 사용하십시오.
var potentialOverflow: UInt8 = UInt8.max // 255
// potentialOverflow = potentialOverflow + 1 // 충돌 발생

potentialOverflow = potentialOverflow &+ 1 // 0으로 래핑됨
print("오버플로 덧셈: \(potentialOverflow)") // 문자열 리터럴 번역

potentialOverflow = UInt8.min // 0
// potentialOverflow = potentialOverflow - 1 // 충돌 발생

potentialOverflow = potentialOverflow &- 1 // 255로 래핑됨
print("오버플로 뺄셈: \(potentialOverflow)") // 문자열 리터럴 번역

// 곱셈을 위한 &*도 있습니다. 나눗셈과 나머지 연산에는 오버플로 변형이 없습니다.


// --- 연산자 우선순위 및 결합성 ---
// Swift에는 표준 연산자 우선순위 규칙이 있습니다 (예: * / 가 + - 보다 먼저).
// 우선순위를 명확히 하거나 재정의하려면 괄호 `()`를 사용하십시오.
let result = 2 + 3 * 4 // 2 + 12 = 14 (곱셈 먼저)
print("2 + 3 * 4 = \(result)")
let resultWithParens = (2 + 3) * 4 // 5 * 4 = 20 (괄호로 인해 덧셈 먼저)
print("(2 + 3) * 4 = \(resultWithParens)")
// 전체 목록은 Swift 문서에 있습니다.


// --- 사용자 정의 연산자 ---
// Swift에서는 사용자 정의 중위, 전위, 후위 및 할당 연산자를 정의할 수 있습니다.
// 이는 고급 주제입니다. 예시:
prefix operator √ // 제곱근을 위한 새 전위 연산자 정의

prefix func √ (number: Double) -> Double {
    return sqrt(number)
}
let sqrtValue = √25.0
print("25의 사용자 정의 제곱근: \(sqrtValue)") // 문자열 리터럴 번역

// 코드 가독성을 유지하기 위해 일반적으로 사용자 정의 연산자를 드물게 사용하는 것이 좋습니다.
```
