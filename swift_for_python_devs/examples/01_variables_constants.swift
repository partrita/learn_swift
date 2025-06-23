// 파이썬 개발자를 위한 Swift - 예제 01: 변수와 상수

// --- 상수 ---
// 파이썬에서 상수는 종종 관례입니다 (예: 대문자 변수).
// Swift에서 `let`은 진정한 상수를 만듭니다 - 할당 후에는 값을 변경할 수 없습니다.
let maxLoginAttempts = 10
// maxLoginAttempts = 5 // 컴파일 시간 오류 발생: "Cannot assign to value: 'maxLoginAttempts' is a 'let' constant"

let welcomeMessage = "안녕하세요, Swift!" // 문자열 리터럴 번역
print(welcomeMessage)

// --- 변수 ---
// 파이썬에서는 모든 변수를 재할당할 수 있습니다.
// Swift에서 `var`는 변경 가능한 변수를 만듭니다.
var currentLoginAttempts = 0
print("초기 시도 횟수: \(currentLoginAttempts)") // 문자열 리터럴 번역

currentLoginAttempts = 1
print("한 번 시도 후 횟수: \(currentLoginAttempts)") // 문자열 리터럴 번역

currentLoginAttempts += 1 // Swift에는 ++ 또는 -- 연산자가 없으므로 += 또는 -=를 사용합니다.
print("다시 시도 후 횟수: \(currentLoginAttempts)") // 문자열 리터럴 번역


// --- 타입 추론 ---
// 파이썬은 동적 타입 언어이며, 타입은 런타임에 확인됩니다.
// Swift는 정적 타입 언어이지만, 종종 초기 값으로부터 타입을 추론합니다.

let implicitInteger = 70      // Int로 추론됨
let implicitDouble = 70.0     // Double로 추론됨
let implicitBoolean = true    // Bool로 추론됨
let implicitString = "테스트"   // String으로 추론됨 (문자열 리터럴 번역)

print("implicitInteger 타입: \(type(of: implicitInteger))") // 문자열 리터럴 번역
print("implicitDouble 타입: \(type(of: implicitDouble))") // 문자열 리터럴 번역


// --- 명시적 타입 어노테이션 ---
// 때로는 변수가 초기화되지 않았거나 특정 타입을 원할 때 (예: Double 대신 Float)
// 명시적으로 타입을 지정해야 합니다.

var explicitFloat: Float = 3.14159 // 명시적으로 Float
var explicitDouble: Double = 3.1415926535 // 명시적으로 Double

var environmentName: String // 선언되었지만 초기화되지 않음
environmentName = "개발 환경" // 나중에 초기화 (문자열 리터럴 번역)
print("환경: \(environmentName)") // 문자열 리터럴 번역

// let serverResponseCode: Int // 오류: 'let' 상수는 사용 전에 초기화해야 합니다.
let serverResponseCode: Int = 200 // 올바름
print("서버 응답: \(serverResponseCode)") // 문자열 리터럴 번역


// --- 타입 안전성 ---
// Swift는 타입 안전 언어입니다. 한 타입의 값을 호환되지 않는 다른 타입의 변수에 할당할 수 없습니다.
var myNumber: Int = 100
// myNumber = "백" // 컴파일 시간 오류: 'String' 타입의 값을 'Int' 타입에 할당할 수 없습니다. (주석 내 문자열 리터럴 번역)

// 명시적 타입 변환이 필요합니다:
let label = "너비는 " // 문자열 리터럴 번역
let width = 94
let widthLabel = label + String(width) // Int를 String으로 변환하여 연결
print(widthLabel)

// 문자열 보간법이 종종 더 깔끔합니다:
let anotherWidthLabel = "너비는 \(width)" // 문자열 리터럴 번역
print(anotherWidthLabel)

let piValue = 3.14
// let integerPi: Int = piValue // 오류: Double을 Int로 암시적으로 변환할 수 없습니다.
let integerPi: Int = Int(piValue) // 명시적 변환 (소수점 이하 버림)
print("정수 Pi: \(integerPi)") // 문자열 리터럴 번역


// --- 이름 규칙 ---
// Swift는 변수와 상수에 카멜 케이스를 사용합니다 (예: `myVariableName`).
// 이는 파이썬의 스네이크 케이스 (예: `my_variable_name`)와 다릅니다.
let httpStatusCode = 404
var userName = "swift_learner"

print("상태: \(httpStatusCode), 사용자: \(userName)") // 문자열 리터럴 번역

// 여러 변수를 한 줄에 쉼표로 구분하여 선언할 수 있습니다.
var x = 0.0, y = 0.0, z = 0.0
print("좌표: (\(x), \(y), \(z))") // 문자열 리터럴 번역

// 유니코드 문자를 포함하여 거의 모든 문자를 상수 및 변수 이름에 사용할 수 있습니다.
// 그러나 이름에는 공백 문자, 수학 기호, 화살표, 개인용 유니코드 스칼라 값,
// 또는 선 및 상자 그리기 문자를 포함할 수 없습니다. 또한 숫자로 시작할 수 없지만, 이름 내 다른 곳에는 숫자를 포함할 수 있습니다.
let π = 3.14159
let 😊 = "행복함" // 문자열 리터럴 번역
print("π 값: \(π), 기분: \(😊)") // 문자열 리터럴 번역

// Swift 키워드를 이름으로 사용해야 하는 경우 역따옴표(`)로 묶습니다.
var `let` = "이것은 'let'이라는 이름의 변수에 할당된 문자열입니다" // 문자열 리터럴 번역
print(`let`)
// 그러나 일반적으로 키워드를 이름으로 사용하는 것은 피하는 것이 좋습니다.
