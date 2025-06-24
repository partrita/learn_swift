// 파이썬 개발자를 위한 Swift - 예제 06: 클로저

// 클로저는 코드 내에서 전달되고 사용될 수 있는 자체 포함된 기능 블록입니다.
// 정의된 컨텍스트의 모든 상수와 변수에 대한 참조를 캡처하고 저장할 수 있습니다.
// 이를 해당 상수와 변수를 "클로징 오버"한다고 합니다.
// 파이썬의 람다와 유사하지만, 루비의 블록이나 JS의 익명 함수처럼 더 강력하고 다재다능합니다.

print("--- 클로저 ---") // 문자열 리터럴 번역

// --- `sorted` 메서드 예제 ---
// Swift 표준 라이브러리는 알려진 타입의 값 배열을 정렬하는 `sorted(by:)` 메서드를 제공합니다.
// 정렬은 사용자가 제공하는 정렬 클로저의 출력에 기반합니다.
let names = ["크리스", "알렉스", "에바", "배리", "다니엘라"] // 문자열 리터럴 번역 (이름 예시)
print("원본 이름: \(names)") // 문자열 리터럴 번역

// 1. 정렬 로직으로 일반 함수 사용
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2 // s1이 s2보다 먼저 와야 하면 true (내림차순)
}
var reversedNames = names.sorted(by: backward)
print("정렬됨 ('backward' 함수 사용): \(reversedNames)") // 문자열 리터럴 번역


// 2. 클로저 표현식 구문
// 일반적인 형태:
// { (매개변수) -> 반환_타입 in
//     문장들
// }

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print("정렬됨 (전체 클로저 구문): \(reversedNames)") // 문자열 리터럴 번역


// 3. 컨텍스트에서 타입 추론
// Swift는 매개변수의 타입과 반환하는 값의 타입을 추론할 수 있습니다.
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
print("정렬됨 (추론된 타입): \(reversedNames)") // 문자열 리터럴 번역


// 4. 단일 표현식 클로저의 암시적 반환
// 클로저 본문이 단일 표현식이면 `return` 키워드를 생략할 수 있습니다.
// 표현식의 값이 암시적으로 반환됩니다.
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
print("정렬됨 (암시적 반환): \(reversedNames)") // 문자열 리터럴 번역


// 5. 축약형 인자 이름
// Swift는 인라인 클로저에 축약형 인자 이름($0, $1, $2 등)을 자동으로 제공합니다.
// $0은 첫 번째 인자를, $1은 두 번째 인자를 참조합니다.
reversedNames = names.sorted(by: { $0 > $1 })
print("정렬됨 (축약형 인자 이름): \(reversedNames)") // 문자열 리터럴 번역


// 6. 연산자 메서드
// 클로저 본문이 올바른 타입의 인자를 받고 올바른 타입을 반환하는 연산자일 뿐이라면,
// 연산자 자체를 사용할 수 있습니다.
reversedNames = names.sorted(by: >) // `>`는 String 연산자 함수 (String, String) -> Bool 입니다.
print("정렬됨 (연산자 메서드): \(reversedNames)") // 문자열 리터럴 번역


// --- 후행 클로저 ---
// 클로저 표현식이 함수의 마지막 인수인 경우, 함수 호출 괄호 뒤에
// 후행 클로저로 작성할 수 있습니다. 클로저가 *유일한* 인수인 경우 괄호를 완전히 생략할 수 있습니다.

// 예제: 배열의 `map` 메서드
let numbers = [1, 2, 3, 4, 5]
print("\n원본 숫자: \(numbers)") // 문자열 리터럴 번역

// 전체 클로저를 사용한 map
let doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})
print("두 배로 (전체 클로저): \(doubledNumbers)") // 문자열 리터럴 번역

// 후행 클로저를 사용한 map
let tripledNumbers = numbers.map { number in // `number in`은 매개변수와 본문 시작을 의미합니다.
    return number * 3
}
print("세 배로 (후행 클로저): \(tripledNumbers)") // 문자열 리터럴 번역

// 후행 클로저에서 축약형 인자 이름과 암시적 반환을 사용한 map
let squaredNumbers = numbers.map { $0 * $0 }
print("제곱 (축약형, 암시적 반환, 후행): \(squaredNumbers)") // 문자열 리터럴 번역

// 함수가 클로저만 받는 경우 괄호를 완전히 생략할 수 있습니다.
func performAction(using closure: () -> Void) {
    print("작업 수행 예정...") // 문자열 리터럴 번역
    closure()
    print("작업 수행됨.") // 문자열 리터럴 번역
}
performAction { // performAction()에 괄호 없음
    print("...작업 자체가 지금 수행 중입니다...") // 문자열 리터럴 번역
}


// --- 값 캡처 ---
// 클로저는 정의된 주변 컨텍스트의 상수와 변수를 캡처할 수 있습니다.
// 그런 다음 클로저는 해당 상수와 변수를 정의한 원래 범위가 더 이상 존재하지 않더라도
// 본문 내에서 해당 상수와 변수의 값을 참조하고 수정할 수 있습니다.

print("\n--- 값 캡처 ---") // 문자열 리터럴 번역
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0 // `runningTotal`과 `amount`는 반환된 클로저에 의해 캡처됩니다.

    // 중첩 함수 정의 (클로저임)
    func incrementer() -> Int {
        runningTotal += amount // 캡처된 `runningTotal`을 수정하고, 캡처된 `amount`를 사용합니다.
        return runningTotal
    }

    return incrementer // 클로저 반환
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print("10씩 증가:") // 문자열 리터럴 번역
print(incrementByTen()) // 출력: 10 (runningTotal은 0 + 10)
print(incrementByTen()) // 출력: 20 (runningTotal은 10 + 10)
print(incrementByTen()) // 출력: 30 (runningTotal은 20 + 10)

let incrementBySeven = makeIncrementer(forIncrement: 7)
print("\n7씩 증가:") // 문자열 리터럴 번역
print(incrementBySeven()) // 출력: 7 (이 인스턴스의 새 runningTotal)
print(incrementBySeven()) // 출력: 14

// `incrementByTen`과 `incrementBySeven` 클로저는 자체적으로 독립적인
// 캡처된 `runningTotal` 변수를 가집니다. 서로 간섭하지 않습니다.
print("\nincrementByTen 다시 호출:") // 문자열 리터럴 번역
print(incrementByTen()) // 출력: 40 (자신의 캡처된 runningTotal에서 계속)


// --- 클로저는 참조 타입입니다 ---
// 클로저를 상수나 변수에 할당하면 실제로는 해당 상수나 변수를
// 클로저에 대한 *참조*로 설정하는 것입니다.
// 즉, 클로저를 두 개의 다른 상수/변수에 할당하면
// 둘 다 동일한 클로저와 캡처된 환경을 참조하게 됩니다.

let alsoIncrementByTen = incrementByTen // `alsoIncrementByTen`은 `incrementByTen`과 동일한 클로저를 참조합니다.
print("\n'alsoIncrementByTen' 사용:") // 문자열 리터럴 번역
print(alsoIncrementByTen()) // 출력: 50 (동일한 runningTotal에서 계속)


// --- 탈출 클로저 (`@escaping`) ---
// 클로저가 함수에 인수로 전달되지만 함수가 반환된 *후에* 호출될 때
// 클로저가 함수를 *탈출*한다고 합니다.
// 이는 클로저가 함수 외부에 정의된 변수에 저장되거나
// 비동기 작업의 일부인 경우 발생할 수 있습니다.
// 클로저 매개변수의 타입을 `@escaping`으로 표시해야 합니다.

var completionHandlers: [() -> Void] = [] // 탈출 클로저를 저장할 배열

// `someFunctionWithEscapingClosure`는 클로저를 받아 `completionHandlers`에 추가합니다.
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
    print("탈출 클로저 추가됨. 개수: \(completionHandlers.count)") // 문자열 리터럴 번역
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    print("비탈출 클로저 즉시 호출됨:") // 문자열 리터럴 번역
    closure() // 함수 범위 내에서 호출됨
}

// 사용 예시:
print("\n--- 탈출 클로저 ---") // 문자열 리터럴 번역
let myEscapingClosure = { print("탈출 클로저가 실행되었습니다!") } // 문자열 리터럴 번역
someFunctionWithEscapingClosure(completionHandler: myEscapingClosure)
someFunctionWithEscapingClosure(completionHandler: { print("다른 탈출 클로저가 실행되었습니다!") }) // 문자열 리터럴 번역

let myNonescapingClosure = { print("비탈출 클로저 작업!") } // 문자열 리터럴 번역
someFunctionWithNonescapingClosure(closure: myNonescapingClosure)

// 이제 저장된 탈출 클로저를 받아들인 함수 외부에서 호출할 수 있습니다:
print("\n저장된 탈출 클로저 실행:") // 문자열 리터럴 번역
for handler in completionHandlers {
    handler()
}
// 출력:
// 탈출 클로저가 실행되었습니다!
// 다른 탈출 클로저가 실행되었습니다!


// --- 자동 클로저 (`@autoclosure`) ---
// 자동 클로저는 함수에 인수로 전달되는 표현식을 래핑하기 위해 자동으로 생성되는 클로저입니다.
// 인수를 받지 않으며, 호출될 때 래핑된 표현식의 값을 반환합니다.
// 이 구문적 편의성은 명시적 클로저 대신 일반 표현식을 작성하여 함수의 매개변수 주위의 중괄호를 생략할 수 있게 합니다.
// 지연되어야 하는 작업에 사용됩니다. 예: `&&` 또는 `||`의 오른쪽 피연산자, 또는 `assert`.

print("\n--- 자동 클로저 ---") // 문자열 리터럴 번역
var customersInLine = ["크리스", "알렉스", "에바", "배리", "다니엘라"] // 문자열 리터럴 번역 (이름 예시)
print("초기 고객: \(customersInLine)") // 문자열 리터럴 번역

// `customerProvider` 클로저는 `customersInLine`이 비어 있지 않으면 실행되지 않습니다.
// `@autoclosure`는 문자열 표현식만으로 `serve(customer:)`를 호출할 수 있게 합니다.
func serve(customer customerProvider: @autoclosure () -> String) {
    print("지금 \(customerProvider())님을 서비스 중입니다!") // 클로저가 여기서 호출됩니다. (문자열 리터럴 번역)
}

// 문자열 표현식으로 `serve` 호출, 자동으로 클로저로 래핑됩니다.
serve(customer: customersInLine.removeFirst()) // "크리스"가 제거되고 서비스됩니다.
// `customersInLine.removeFirst()` 표현식은 `customerProvider()`가 호출될 때만 평가됩니다.

// 탈출 자동 클로저가 필요한 경우: `@autoclosure @escaping () -> String`
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
    print("고객 제공자 수집됨. 개수: \(customerProviders.count)") // 문자열 리터럴 번역
}

collectCustomerProviders(customersInLine.removeFirst()) // 알렉스
collectCustomerProviders(customersInLine.removeFirst()) // 에바

print("\n수집된 고객 서비스 중:") // 문자열 리터럴 번역
for provider in customerProviders {
    serve(customer: provider()) // 저장된 자동 클로저 호출
}
print("남은 고객: \(customersInLine)") // 배리, 다니엘라 (문자열 리터럴 번역)
```
