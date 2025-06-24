// 파이썬 개발자를 위한 Swift - 예제 04: 제어 흐름

// --- 조건문 ---

// If 문
// 조건 주위의 괄호는 선택 사항입니다. 중괄호 `{}`는 필수입니다.
print("--- If 문 ---") // 문자열 리터럴 번역
let temperatureInFahrenheit = 75
if temperatureInFahrenheit <= 32 {
    print("매우 춥습니다. 목도리를 착용하는 것을 고려하세요.") // 문자열 리터럴 번역
} else if temperatureInFahrenheit >= 86 {
    print("정말 덥습니다. 자외선 차단제를 잊지 마세요.") // 문자열 리터럴 번역
} else {
    print("그렇게 춥지 않습니다. 티셔츠를 입으세요.") // 문자열 리터럴 번역
}

// 파이썬:
// if temperature_in_fahrenheit <= 32:
//     print("매우 춥습니다.")
// elif temperature_in_fahrenheit >= 86:
//     print("정말 덥습니다.")
// else:
//     print("그렇게 춥지 않습니다.")

// Guard 문
// 조건이 충족되지 않으면 조기 종료를 제공합니다.
// 전제 조건을 확인하는 데 유용합니다. guard의 조건에서 할당된 변수/상수
// (예: 옵셔널 바인딩 사용)는 나머지 범위에서 사용할 수 있습니다.
print("\n--- Guard 문 ---") // 문자열 리터럴 번역
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        print("이름이 제공되지 않았습니다.") // 문자열 리터럴 번역
        return // 현재 범위(함수, 루프 등)를 반드시 종료해야 합니다.
    }

    print("안녕하세요, \(name)님!") // 문자열 리터럴 번역

    guard let location = person["location"] else {
        print("계신 곳의 날씨가 좋기를 바랍니다.") // 문자열 리터럴 번역
        return
    }
    print("\(location)의 날씨가 좋기를 바랍니다.") // 문자열 리터럴 번역
}

greet(person: ["name": "앨리스", "location": "원더랜드"]) // 문자열 리터럴 번역
greet(person: ["name": "밥"]) // 문자열 리터럴 번역
greet(person: [:])


// Switch 문
// Swift에서 매우 강력합니다. 모든 가능한 값을 다루거나 `default` 케이스가 있어야 합니다(철저해야 함).
// 암시적 fallthrough가 없습니다(C 유사 언어와 달리). 필요한 경우 `fallthrough` 키워드를 사용합니다.
print("\n--- Switch 문 ---") // 문자열 리터럴 번역
let someCharacter: Character = "z"
switch someCharacter {
case "a", "A": // 복합 케이스
    print("알파벳의 첫 글자입니다.") // 문자열 리터럴 번역
case "z", "Z":
    print("알파벳의 마지막 글자입니다.") // 문자열 리터럴 번역
default:
    print("다른 문자입니다.") // 문자열 리터럴 번역
}

// 파이썬 (3.10+에는 match-case가 있고, 그 외에는 if-elif-else)
// match some_character:
//     case "a" | "A":
//         print("첫 글자")
//     case "z" | "Z":
//         print("마지막 글자")
//     case _:
//         print("다른 문자")

// 구간 일치 (범위)
let approximateCount = 62
let countedThings = "토성 주위의 달들" // 문자열 리터럴 번역
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "없음" // 문자열 리터럴 번역
case 1..<5: // 반-열린 범위
    naturalCount = "몇 개" // 문자열 리터럴 번역
case 5..<12:
    naturalCount = "여러 개" // 문자열 리터럴 번역
case 12..<100:
    naturalCount = "수십 개" // 문자열 리터럴 번역
case 100..<1000:
    naturalCount = "수백 개" // 문자열 리터럴 번역
default: // 철저해야 함
    naturalCount = "많음" // 문자열 리터럴 번역
}
print("\(naturalCount)개의 \(countedThings)이(가) 있습니다.") // 문자열 리터럴 번역

// 튜플 일치
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint)은(는) 원점에 있습니다.") // 문자열 리터럴 번역
case (_, 0): // 와일드카드: 첫 번째 요소에 대해 모든 값을 일치시킴
    print("\(somePoint)은(는) x축 위에 있습니다.") // 문자열 리터럴 번역
case (0, _):
    print("\(somePoint)은(는) y축 위에 있습니다.") // 문자열 리터럴 번역
case (-2...2, -2...2): // 튜플 요소의 범위 일치
    print("\(somePoint)은(는) 2x2 상자 안에 있습니다.") // 문자열 리터럴 번역
default:
    print("\(somePoint)은(는) 상자 밖에 있습니다.") // 문자열 리터럴 번역
}

// Switch 케이스의 값 바인딩
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0): // 첫 번째 요소의 값을 'x'에 바인딩
    print("x축 위에 있으며 x 값은 \(x)입니다.") // 문자열 리터럴 번역
case (0, let y): // 두 번째 요소의 값을 'y'에 바인딩
    print("y축 위에 있으며 y 값은 \(y)입니다.") // 문자열 리터럴 번역
case let (x, y) where x == y: // 추가 조건을 위한 'where' 절
    print("(\(x), \(y))에 있으며 x == y 선 위에 있습니다.") // 문자열 리터럴 번역
case let (x, y): // 두 값을 모두 바인딩
    print("다른 곳 (\(x), \(y))에 있습니다.") // 문자열 리터럴 번역
}

// Fallthrough
let integerToDescribe = 5
var description = "\(integerToDescribe)라는 숫자는 " // 문자열 리터럴 번역
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "소수이고, 또한 " // 문자열 리터럴 번역
    fallthrough // 의도적으로 기본 케이스로 넘어감
default:
    description += "정수입니다." // 문자열 리터럴 번역
}
print(description)


// --- 반복문 ---

// For-In 반복문
// 배열, 범위, 문자열, 딕셔너리와 같은 시퀀스를 반복합니다.
print("\n--- For-In 반복문 ---") // 문자열 리터럴 번역
let names = ["안나", "알렉스", "브라이언", "잭"] // 문자열 리터럴 번역
for name in names {
    print("안녕하세요, \(name)님!") // 문자열 리터럴 번역
}

// 파이썬:
// for name in names:
//     print(f"안녕하세요, {name}님!")

// 딕셔너리 반복
let numberOfLegs = ["거미": 8, "개미": 6, "고양이": 4] // 문자열 리터럴 번역
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)는 다리가 \(legCount)개 있습니다.") // 문자열 리터럴 번역
}

// 범위 반복
for index in 1...5 { // 닫힌 범위 (1부터 5까지 포함)
    print("\(index) 곱하기 5는 \(index * 5)입니다.") // 문자열 리터럴 번역
}

// 시퀀스의 값이 필요하지 않으면 밑줄 `_`을 사용합니다.
let base = 3
let power = 4
var answer = 1
for _ in 1...power { // 루프 카운터 값 자체가 필요하지 않습니다.
    answer *= base
}
print("\(base)의 \(power) 제곱은 \(answer)입니다.") // 문자열 리터럴 번역

// `stride(from:to:by:)` 및 `stride(from:through:by:)`로 더 세밀하게 제어
print("0부터 10 미만까지 2씩 증가(stride):") // 문자열 리터럴 번역
for num in stride(from: 0, to: 10, by: 2) { // 0, 2, 4, 6, 8
    print(num, terminator: " ")
}
print()

print("0부터 10까지 2씩 증가(stride):") // 문자열 리터럴 번역
for num in stride(from: 0, through: 10, by: 2) { // 0, 2, 4, 6, 8, 10
    print(num, terminator: " ")
}
print()


// While 반복문
// 각 반복 전에 조건이 평가됩니다.
print("\n--- While 반복문 ---") // 문자열 리터럴 번역
var i = 0
while i < 5 {
    print("현재 i (while): \(i)") // 문자열 리터럴 번역
    i += 1
}
// 파이썬:
// i = 0
// while i < 5:
//     print(f"현재 i (while): {i}")
//     i += 1

// Repeat-While 반복문
// 각 반복 후에 조건이 평가됩니다. 루프 본문은 항상 최소 한 번 실행됩니다.
// (다른 언어의 `do-while`과 유사)
print("\n--- Repeat-While 반복문 ---") // 문자열 리터럴 번역
var j = 0
repeat {
    print("현재 j (repeat-while): \(j)") // 문자열 리터럴 번역
    j += 1
} while j < 5

var k = 5 // 조건 (k < 5)은 초기에 false입니다.
repeat {
    print("현재 k (repeat-while, 한 번 실행됨): \(k)") // 이것은 한 번 출력됩니다. (문자열 리터럴 번역)
    k += 1
} while k < 5


// --- 제어 전달 구문 ---
// `continue`, `break`, `fallthrough` (switch에서 보임), `return` (함수에서), `throw` (오류용)

print("\n--- 제어 전달 ---") // 문자열 리터럴 번역
// Continue: 현재 반복을 중지하고 다음 반복을 시작합니다.
print("Continue 예제:") // 문자열 리터럴 번역
let puzzleInput = "위대한 마음은 비슷하게 생각한다" // 문자열 리터럴 번역 (예시 문장)
var puzzleOutput = ""
let charactersToRemove: [Character] = ["ㅏ", "ㅔ", "ㅣ", "ㅗ", "ㅜ", " ", "ㅇ", "ㅎ"] // 한국어 모음 및 공백 추가 (예시)
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue // 모음과 공백 건너뛰기
    }
    puzzleOutput.append(character)
}
print("퍼즐 출력: \(puzzleOutput)") // 문자열 리터럴 번역

// Break: 루프 또는 switch 문을 즉시 종료합니다.
print("\nBreak 예제:") // 문자열 리터럴 번역
let numberToFind = 7
var found = false
for row in 0..<5 {
    for col in 0..<5 {
        let currentValue = row * 5 + col
        if currentValue == numberToFind {
            print("\(numberToFind)을(를) (\(row), \(col))에서 찾았습니다.") // 문자열 리터럴 번역
            found = true
            break // 내부 for-in 루프(col)를 종료합니다.
        }
    }
    if found {
        break // 외부 for-in 루프(row)를 종료합니다.
    }
}

// 레이블이 있는 구문 (`break` 또는 `continue`가 적용될 루프/switch를 지정하기 위해)
print("\n레이블이 있는 break 예제:") // 문자열 리터럴 번역
gameLoop: while true { // 외부 루프에 레이블 지정
    let diceRoll = Int.random(in: 1...6)
    print("주사위를 굴려 \(diceRoll)이(가) 나왔습니다.") // 문자열 리터럴 번역
    switch diceRoll {
    case 6:
        print("승리! 6이 나왔습니다.") // 문자열 리터럴 번역
        break gameLoop // 'gameLoop'(while 루프)에서 빠져나옵니다.
    case 1:
        print("1이 나왔습니다. 운이 없네요, 다음 턴에 다시 시도하세요.") // 문자열 리터럴 번역
        // 암시적으로 while 루프의 다음 반복으로 계속됩니다.
    default:
        print("계속 시도하세요...") // 문자열 리터럴 번역
        // 암시적으로 while 루프의 다음 반복으로 계속됩니다.
    }
    // 중단되지 않은 경우 루프를 결국 종료하기 위한 일부 지연 또는 조건 시뮬레이션
    if Int.random(in: 1...10) == 10 { // 안전 장치 중단
        print("gameLoop에서 안전 장치 중단.") // 문자열 리터럴 번역
        break gameLoop
    }
}

// `return`은 함수를 종료하는 데 사용되며, 함수 예제에서 다룹니다.
// `throw`는 오류 처리에 사용되며, 오류 처리 예제에서 다룹니다.

// 사용 가능성 확인 (API 사용 가능성)
// 코드가 적절한 OS 버전에서만 실행되도록 보장합니다.
if #available(iOS 10, macOS 10.12, *) {
    // iOS에서는 iOS 10 API를, macOS에서는 macOS 10.12 API를 사용합니다.
    print("특정 API를 지원하는 최신 OS 버전에서 실행 중입니다.") // 문자열 리터럴 번역
} else {
    // 이전 iOS 및 macOS API로 대체합니다.
    print("이전 OS 버전에서 실행 중입니다. 대체 API를 사용합니다.") // 문자열 리터럴 번역
}
// `*`는 필수이며, 다른 모든 플랫폼에서 if 본문이
// 프로젝트에서 지정한 최소 배포 대상에서 실행됨을 나타냅니다.
```
