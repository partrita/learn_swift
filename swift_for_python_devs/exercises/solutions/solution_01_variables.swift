// 연습문제 01 해답: 변수, 상수 및 기본 타입

// 1. `appName`이라는 상수를 선언하고 "MyApp"이라는 값을 할당하세요.
//    `appName`의 값을 출력하세요.
let appName = "MyApp"
print("1. 앱 이름: \(appName)") // 문자열 리터럴 번역


// 2. `currentUserScore`라는 Int 타입의 변수를 선언하고 0으로 초기화하세요.
//    점수를 10만큼 증가시키세요.
//    점수를 출력하세요.
var currentUserScore: Int = 0
currentUserScore += 10
print("2. 현재 사용자 점수: \(currentUserScore)") // 문자열 리터럴 번역


// 3. 초기값이 25.5인 `temperatureCelsius` 변수를 선언하세요 (Swift가 타입을 추론하도록 하세요).
//    값이 1.8인 `celsiusToFahrenheitMultiplier` 상수를 선언하세요.
//    값이 32.0인 `fahrenheitOffset` 상수를 선언하세요.
//    공식 (섭씨 * 승수) + 오프셋을 사용하여 화씨 온도를 계산하세요.
//    결과를 `temperatureFahrenheit` 상수에 저장하세요.
//    "25.5°C는 77.9°F입니다."와 같이 화씨 온도를 출력하세요.
var temperatureCelsius = 25.5 // Double로 추론됨
let celsiusToFahrenheitMultiplier = 1.8
let fahrenheitOffset = 32.0
let temperatureFahrenheit = (temperatureCelsius * celsiusToFahrenheitMultiplier) + fahrenheitOffset
print("3. \(temperatureCelsius)°C는 \(temperatureFahrenheit)°F입니다.") // 문자열 리터럴 번역


// 4. String 타입의 `username` 변수를 선언하세요.
//    자신의 이름을 할당하세요.
//    문자열 보간법을 사용하여 "안녕하세요, [username]님! Swift에 오신 것을 환영합니다." 형식의 `personalizedGreeting` 인사말 문자열을 만드세요.
//    인사말을 출력하세요.
var username: String
username = "쥴스" // 사용자의 이름으로 바꾸세요 (문자열 리터럴 번역)
let personalizedGreeting = "안녕하세요, \(username)님! Swift에 오신 것을 환영합니다." // 문자열 리터럴 번역
print("4. \(personalizedGreeting)")


// 5. Bool 타입의 `isEnabled` 상수를 선언하고 `true`로 설정하세요.
//    이 상수를 기반으로 기능이 활성화되었는지 또는 비활성화되었는지 나타내는 메시지를 출력하세요.
//    예시: "기능 상태: 활성화됨" 또는 "기능 상태: 비활성화됨"
let isEnabled: Bool = true
let statusMessage = isEnabled ? "활성화됨" : "비활성화됨" // 문자열 리터럴 번역
print("5. 기능 상태: \(statusMessage)") // 문자열 리터럴 번역
// if-else를 사용한 대안:
// if isEnabled {
//     print("5. 기능 상태: 활성화됨")
// } else {
//     print("5. 기능 상태: 비활성화됨")
// }


// 6. 옵셔널 String 변수 `middleName`을 선언하고 `nil`로 초기화하세요.
//    옵셔널이 아닌 String `firstName`을 선언하고 자신의 이름을 할당하세요.
//    옵셔널이 아닌 String `lastName`을 선언하고 자신의 성을 할당하세요.
//    Nil-병합 연산자 (`??`)를 사용하여 `fullName` 문자열을 만드세요.
//    `middleName`이 `nil`이면 `fullName`은 "firstName lastName"이어야 합니다.
//    `middleName`에 값이 있으면 `fullName`은 "firstName middleName lastName"이어야 합니다.
//    `fullName`을 출력하세요.
//    그런 다음 `middleName`에 값을 할당하고 `fullName`을 다시 출력하세요.
var middleName: String? = nil
let firstName = "쥴스" // 문자열 리터럴 번역
let lastName = "더코더" // 문자열 리터럴 번역

var fullName: String // var로 변경하여 재할당 가능하게 함
// middleName이 nil일 때 추가 공백을 처리하는 약간 더 나은 방법:
if let actualMiddleName = middleName, !actualMiddleName.isEmpty { // 중간 이름이 비어있지 않은지도 확인
    fullName = "\(firstName) \(actualMiddleName) \(lastName)"
} else {
    fullName = "\(firstName) \(lastName)"
}
print("6. 전체 이름 (middleName이 nil): \(fullName)") // 문자열 리터럴 번역

middleName = "AI" // 문자열 리터럴 번역
if let actualMiddleName = middleName, !actualMiddleName.isEmpty {
    fullName = "\(firstName) \(actualMiddleName) \(lastName)"
} else {
    fullName = "\(firstName) \(lastName)"
}
print("6. 전체 이름 (middleName에 값이 있음): \(fullName)") // 문자열 리터럴 번역


// 7. 서버 응답을 나타내는 튜플 `httpResponse`를 만드세요.
//    두 개의 요소, 즉 값이 200인 `statusCode`(Int)와 값이 "OK"인 `message`(String)를 포함해야 합니다.
//    튜플에서 상태 코드와 메시지를 출력하세요.
//    그런 다음 튜플을 두 개의 개별 상수 `code`와 `msg`로 분해하고 출력하세요.
let httpResponse = (statusCode: 200, message: "성공") // 문자열 리터럴 번역 ("OK" -> "성공")
print("7. 튜플 접근: 상태 코드: \(httpResponse.statusCode), 메시지: \(httpResponse.message)") // 문자열 리터럴 번역

let (code, msg) = httpResponse
print("7. 분해됨: 코드: \(code), 메시지: \(msg)") // 문자열 리터럴 번역


// 8. 타입 변환:
//    값이 123.456인 Double `preciseValue`를 선언하세요.
//    `preciseValue`를 Int로 변환하여 `integerValue`에 저장하고 `integerValue`를 출력하세요.
//    값이 1_000_000인 Int `largeNumber`를 선언하세요 (가독성을 위해 밑줄 사용).
//    `largeNumber`를 String으로 변환하여 `numberString`에 저장하고 `numberString`을 출력하세요.
let preciseValue: Double = 123.456
let integerValue: Int = Int(preciseValue) // 소수점 이하 버림: 123
print("8. Double \(preciseValue)를 Int로: \(integerValue)") // 문자열 리터럴 번역

let largeNumber: Int = 1_000_000
let numberString: String = String(largeNumber)
print("8. Int \(largeNumber)를 String으로: \(numberString)") // 문자열 리터럴 번역


// 9. Swift에서 `let`과 `var`의 차이점은 무엇인가요? 주석으로 설명하세요.
// `let`은 상수를 선언하는 데 사용됩니다. `let` 상수에 값이 할당되면 변경할 수 없습니다.
// `var`는 변수를 선언하는 데 사용됩니다. `var` 변수의 값은 초기 할당 후 변경할 수 있습니다.


// 10. Swift가 타입 안전 언어로 간주되는 이유는 무엇인가요? 주석으로 설명하세요.
//      타입 불일치를 보여주는 간단한 코드 예제(주석 처리하지 않으면 컴파일 시간 오류 발생)를 제공하세요.
// Swift는 컴파일 시간에 타입을 확인하기 때문에 타입 안전 언어입니다. 이는 컴파일러가
// 특정 타입으로 선언된 변수나 상수가 해당 타입의 값만 보유할 수 있도록 보장한다는 것을 의미합니다.
// 명시적 변환 없이는 한 타입의 값을 호환되지 않는 다른 타입의 변수에 할당할 수 없습니다.
// 이는 개발 초기에 많은 일반적인 프로그래밍 오류를 포착하는 데 도움이 됩니다.

// 타입 불일치 예시:
var myAge: Int = 30
// myAge = "서른" // 이 줄은 컴파일 시간 오류를 발생시킵니다:
                   // "Cannot assign value of type 'String' to type 'Int'" (String 타입의 값을 Int 타입에 할당할 수 없습니다)
```
