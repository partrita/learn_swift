// 파이썬 개발자를 위한 Swift - 예제 05: 함수

import Foundation // 필요한 경우 문자열 조작 등에 사용, 기본 함수에는 엄밀히 필요하지 않음

// --- 함수 정의 및 호출 ---
// `func` 키워드, 명시적 매개변수 타입 및 명시적 반환 타입.
// 파이썬:
// def greet(name):
//     return f"Hello, {name}!"
// message = greet("Pythonista")

print("--- 기본 함수 ---") // 문자열 리터럴 번역
func greet(person: String) -> String {
    let greeting = "안녕하세요, " + person + "님!" // 문자열 리터럴 번역
    return greeting
}

// 함수 호출 - 인자 레이블 사용 (기본적으로 매개변수 이름과 동일)
let message = greet(person: "Swift 개발자") // 문자열 리터럴 번역
print(message)


// --- 함수 매개변수 및 반환 값 ---

// 매개변수 없는 함수
func sayHelloWorld() -> String {
    return "안녕하세요, 세상!" // 문자열 리터럴 번역
}
print(sayHelloWorld())

// 반환 값 없는 함수 (암시적으로 Void 반환)
func greetWithoutReturn(person: String) {
    print("안녕하세요, \(person)님 (void 함수에서)!") // 문자열 리터럴 번역
}
greetWithoutReturn(person: "앨리스") // 문자열 리터럴 번역

// 명시적으로 Void를 지정할 수도 있음
func printAndReturnNothing(message: String) -> Void {
    print("출력할 메시지: \(message)") // 문자열 리터럴 번역
}
printAndReturnNothing(message: "테스트 메시지") // 문자열 리터럴 번역

// 여러 매개변수를 가진 함수
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
let sum = addTwoInts(a: 5, b: 3)
print("5와 3의 합은 \(sum)입니다.") // 문자열 리터럴 번역

// 튜플을 반환하는 함수 (여러 값 반환용)
// 파이썬:
// def get_http_status():
//     return (404, "Not Found")
// code, msg = get_http_status()

func getHttpStatus() -> (code: Int, description: String) { // 이름 있는 튜플 요소
    return (404, "찾을 수 없음") // 문자열 리터럴 번역
}
let status = getHttpStatus()
print("HTTP 상태 코드: \(status.code), 설명: \(status.description)") // 문자열 리터럴 번역

let (statusCode, statusMessage) = getHttpStatus() // 튜플 분해
print("분해됨 - 코드: \(statusCode), 메시지: \(statusMessage)") // 문자열 리터럴 번역


// --- 인자 레이블과 매개변수 이름 ---
// 각 함수 매개변수에는 인자 레이블과 매개변수 이름이 모두 있습니다.
// 인자 레이블: 함수를 호출할 때 사용됩니다.
// 매개변수 이름: 함수의 구현에서 사용됩니다.
// 기본적으로 매개변수 이름이 인자 레이블로 사용됩니다.

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // 함수 내부:
    // firstParameterName은 첫 번째 인자 값을 참조합니다.
    // secondParameterName은 두 번째 인자 값을 참조합니다.
    print("someFunction 내부: \(firstParameterName), \(secondParameterName)") // 문자열 리터럴 번역
}
someFunction(firstParameterName: 1, secondParameterName: 2)


// 인자 레이블 지정 (외부 이름이 내부 이름과 다름)
func greet(person name: String, from hometown: String) -> String {
    // `name`과 `hometown`은 내부 매개변수 이름입니다.
    return "안녕하세요 \(name)님! \(hometown)에서 오신 것을 환영합니다." // 문자열 리터럴 번역
}
// `person`과 `from`은 호출 시 사용되는 외부 인자 레이블입니다.
print(greet(person: "빌", from: "쿠퍼티노")) // 문자열 리터럴 번역


// 인자 레이블 생략 (`_` 사용)
func multiply(_ num1: Int, by num2: Int) -> Int {
    // `num1`과 `num2`는 내부 매개변수 이름입니다.
    return num1 * num2
}
// 첫 번째 매개변수에는 인자 레이블이 없고, 두 번째에는 `by`가 있습니다.
let product = multiply(8, by: 3) // 자연스러운 문장처럼 보임
print("8과 3의 곱은 \(product)입니다.") // 문자열 리터럴 번역


// 기본 매개변수 값
// 파이썬:
// def power(base, exponent=2):
//     return base ** exponent
print("\n--- 기본 매개변수 값 ---") // 문자열 리터럴 번역
func power(base: Int, exponent: Int = 2) -> Int {
    var result = 1
    for _ in 0..<exponent {
        result *= base
    }
    return result
}
print("3의 2제곱 (기본값): \(power(base: 3))")       // 기본 지수 2 사용 (문자열 리터럴 번역)
print("3의 3제곱: \(power(base: 3, exponent: 3))") // 기본값 재정의 (문자열 리터럴 번역)


// 가변 매개변수 (지정된 타입의 0개 이상의 값을 받음, 파이썬의 *args와 유사)
// 값은 함수 본문 내에서 해당 타입의 배열로 사용할 수 있게 됩니다.
// 함수는 최대 하나의 가변 매개변수를 가질 수 있으며, 마지막 매개변수여야 합니다.
print("\n--- 가변 매개변수 ---") // 문자열 리터럴 번역
func average(_ numbers: Double...) -> Double { // `numbers`는 내부적으로 [Double]입니다.
    if numbers.isEmpty {
        return 0.0
    }
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print("1,2,3,4,5의 평균: \(average(1.0, 2.0, 3.0, 4.0, 5.0))") // 문자열 리터럴 번역
print("10.5, 12.5의 평균: \(average(10.5, 12.5))") // 문자열 리터럴 번역
print("숫자 없음의 평균: \(average())") // 문자열 리터럴 번역


// In-Out 매개변수
// 함수 매개변수는 기본적으로 상수입니다.
// In-out 매개변수를 사용하면 함수가 전달된 변수를 수정할 수 있으며,
// 이러한 변경 사항은 함수 호출이 반환된 후 원래 변수에 반영됩니다.
// 참조에 의한 전달과 유사합니다.
// 파이썬의 가변 타입(리스트, 딕셔너리 등)은 객체 참조로 전달되므로 함수 내부 변경 사항이 원본에 영향을 미칩니다.
// 불변 타입의 경우 파이썬은 사실상 값에 의한 전달을 합니다.
print("\n--- In-Out 매개변수 ---") // 문자열 리터럴 번역
func swapTwoInts(_ a: inout Int, _ b: inout Int) { // `inout` 키워드
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
print("교환 전: someInt = \(someInt), anotherInt = \(anotherInt)") // 문자열 리터럴 번역
swapTwoInts(&someInt, &anotherInt) // 변수를 `&`(앰퍼샌드)와 함께 전달
print("교환 후: someInt = \(someInt), anotherInt = \(anotherInt)") // 문자열 리터럴 번역
// 참고: 변수만 in-out 인수로 전달할 수 있습니다 (상수나 리터럴은 안 됨).


// --- 함수 타입 ---
// 모든 함수에는 매개변수 타입과 반환 타입으로 구성된 특정 함수 타입이 있습니다.
// 예시: `(Int, Int) -> Int`는 두 개의 Int를 받아 Int를 반환하는 함수의 타입입니다.
print("\n--- 함수 타입 ---") // 문자열 리터럴 번역
func add(a: Int, b: Int) -> Int { return a + b }
func subtract(a: Int, b: Int) -> Int { return a - b }

var mathFunction: (Int, Int) -> Int // 함수 타입의 변수 선언

mathFunction = add // `add` 함수를 `mathFunction`에 할당
print("mathFunction 결과 (add): \(mathFunction(10, 5))") // 15 (문자열 리터럴 번역)

mathFunction = subtract // `subtract` 함수 할당
print("mathFunction 결과 (subtract): \(mathFunction(10, 5))") // 5 (문자열 리터럴 번역)

// 함수 타입을 매개변수 타입으로 사용 (고차 함수)
func printMathResult(_ operation: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = operation(a, b)
    print("계산 결과: \(result)") // 문자열 리터럴 번역
}
printMathResult(add, 20, 7)      // `add` 함수를 인수로 전달
printMathResult(subtract, 20, 7) // `subtract` 함수를 인수로 전달

// 함수 타입을 반환 타입으로 사용 (함수를 반환하는 함수)
func stepForward(_ input: Int) -> Int { return input + 1 }
func stepBackward(_ input: Int) -> Int { return input - 1 }

func chooseStepFunction(backward: Bool) -> (Int) -> Int { // (Int) -> Int 타입의 함수를 반환
    return backward ? stepBackward : stepForward
}

var currentValue = 3
print("현재 값: \(currentValue)") // 문자열 리터럴 번역
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero는 이제 stepBackward 또는 stepForward입니다.

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue) // 반환된 함수 호출
}
print("0!") // 문자열 리터럴 번역


// --- 중첩 함수 ---
// 함수 내부에 다른 함수를 정의할 수 있습니다.
// 중첩 함수는 기본적으로 외부 세계에서 숨겨지지만, 감싸는 함수에 의해 호출될 수 있습니다.
// 감싸는 함수는 중첩 함수 중 하나를 반환할 수도 있습니다.
print("\n--- 중첩 함수 ---") // 문자열 리터럴 번역
func chooseAnotherStepFunction(backward: Bool) -> (Int) -> Int {
    func goForward(input: Int) -> Int { return input + 1 }
    func goBackward(input: Int) -> Int { return input - 1 }

    return backward ? goBackward : goForward
}

var val = -2
let nextStepFunc = chooseAnotherStepFunction(backward: val < 0)
while val != 0 {
    print("\(val)... (중첩됨)") // 문자열 리터럴 번역
    val = nextStepFunc(val)
}
print("0! (중첩됨)") // 문자열 리터럴 번역

// 클로저는 함수와 관련된 더 고급 주제이므로 별도의 예제에서 다룹니다.
```
