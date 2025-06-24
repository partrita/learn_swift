// 파이썬 개발자를 위한 Swift - 예제 02: 데이터 타입

// --- 기본 데이터 타입 ---

// 정수 (Int) - 파이썬의 int와 유사
// 크기는 플랫폼에 따라 다릅니다 (32비트 또는 64비트)
let age: Int = 30
let score = 95 // Int로 추론됨
print("나이: \(age), 점수: \(score)") // 문자열 리터럴 번역

// 부동 소수점 숫자
// Double: 64비트 부동 소수점 숫자 (부동 소수점 리터럴의 기본값) - 파이썬의 float와 유사
let pi: Double = 3.1415926535
let gravity = 9.80665 // Double로 추론됨
print("Pi: \(pi), 중력: \(gravity)") // 문자열 리터럴 번역

// Float: 32비트 부동 소수점 숫자
let price: Float = 19.99
print("가격: \(price)") // 문자열 리터럴 번역

// 불리언 (Bool) - 파이썬의 bool과 유사
// `true` 또는 `false`만 가능
let isActive: Bool = true
let hasPermission = false
print("활성 상태: \(isActive), 권한 있음: \(hasPermission)") // 문자열 리터럴 번역

// 문자열 (String) - 파이썬의 str과 유사
// 순서 있는 문자 컬렉션
let greeting: String = "안녕하세요, Swift 개발자님!" // 문자열 리터럴 번역
var message = "환영합니다" // 문자열 리터럴 번역
message += " Swift의 세계로." // 문자열 연결 (문자열 리터럴 번역)
print(greeting)
print(message)

// 문자열 보간법 (파이썬의 f-string과 유사)
let name = "앨리스" // 문자열 리터럴 번역 (이름 예시)
let personalizedGreeting = "안녕하세요, \(name)님!" // 문자열 리터럴 번역
print(personalizedGreeting)

let a = 5
let b = 3
print("\(a) + \(b) = \(a + b)")

// 여러 줄 문자열 (파이썬의 삼중 따옴표 문자열과 유사)
let quotation = """
흰 토끼가 안경을 썼다. "폐하, 어디서부터 시작할까요?"
그가 물었다.

왕은 엄숙하게 말했다. "처음부터 시작해서, 끝에 다다를 때까지 계속하고,
그런 다음 멈추어라."
""" // 문자열 리터럴 번역 (내용 유지 또는 적절히 의역)
print(quotation)

// 문자 (Character) - 단일 문자를 나타냅니다
// 파이썬에는 별도의 문자 타입이 없습니다. 단일 문자는 길이 1의 문자열입니다.
let initial: Character = "J"
let heartSymbol: Character = "❤️"
print("초성: \(initial), 심볼: \(heartSymbol)") // 문자열 리터럴 번역


// --- 컬렉션 타입 ---

// 배열 (Array) - 동일한 타입의 값들의 순서 있는 컬렉션. 파이썬 리스트와 유사하지만 타입이 균일해야 합니다.
// 파이썬 리스트는 혼합 타입을 저장할 수 있습니다. Swift 배열은 요소가 동일한 타입이어야 합니다.
var numbers: [Int] = [1, 2, 3, 4, 5]
var fruits = ["사과", "바나나", "오렌지"] // [String]으로 추론됨 (문자열 리터럴 번역)

print("첫 번째 숫자: \(numbers[0])") // 문자열 리터럴 번역
print("두 번째 과일: \(fruits[1])") // 문자열 리터럴 번역

numbers.append(6) // 요소 추가
print("append 후 숫자들: \(numbers)") // 문자열 리터럴 번역
fruits.insert("망고", at: 1) // 요소 삽입 (문자열 리터럴 번역)
print("insert 후 과일들: \(fruits)") // 문자열 리터럴 번역

// fruits.append(100) // 오류: 'Int' 타입의 값을 예상되는 인자 타입 'String'으로 변환할 수 없습니다.

// 빈 배열
var emptyIntArray: [Int] = []
var emptyStringArray = [String]()
print("빈 정수 배열 개수: \(emptyIntArray.count)") // 문자열 리터럴 번역

// 기본값을 가진 배열
var threeDoubles = Array(repeating: 0.0, count: 3) // [0.0, 0.0, 0.0]
print("세 개의 Double: \(threeDoubles)") // 문자열 리터럴 번역


// 딕셔너리 (Dictionary) - 순서 없는 키-값 쌍의 컬렉션. 파이썬 dict와 유사합니다.
// 키는 동일한 해시 가능한 타입이어야 하며, 값은 동일한 타입이어야 합니다.
var person: [String: String] = ["name": "홍길동", "city": "서울"] // 문자열 리터럴 번역
var scores: [String: Int] = ["수학": 90, "과학": 85] // [String: Int]로 추론됨 (문자열 리터럴 번역)

print("사람 이름: \(person["name"] ?? "해당 없음")") // 접근 시 옵셔널 반환 (문자열 리터럴 번역)
print("수학 점수: \(scores["수학"] ?? 0)") // 문자열 리터럴 번역

person["occupation"] = "개발자" // 새 키-값 쌍 추가 (문자열 리터럴 번역)
scores["수학"] = 92 // 기존 값 업데이트
print("업데이트 후 사람 정보: \(person)") // 문자열 리터럴 번역

// 혼합 값 타입을 사용하려면 `Any`를 사용할 수 있지만 타입 안전성이 떨어집니다.
var mixedInfo: [String: Any] = ["name": "제인", "age": 28, "isStudent": false] // 문자열 리터럴 번역
print("혼합 정보 나이: \(mixedInfo["age"] as? Int ?? 0)") // 'Any'에 대한 타입 캐스팅 필요 (문자열 리터럴 번역)

// 빈 딕셔너리
var emptyDict: [String: Int] = [:]
var anotherEmptyDict = [String: Double]()
print("빈 딕셔너리 개수: \(emptyDict.count)") // 문자열 리터럴 번역


// 세트 (Set) - 동일한 타입의 고유한 값들의 순서 없는 컬렉션. 파이썬 set과 유사합니다.
var uniqueNumbers: Set<Int> = [1, 2, 3, 2, 1, 4] // {1, 2, 3, 4} (순서는 다를 수 있음)
var vowels: Set<Character> = ["a", "e", "i", "o", "u"]
print("고유한 숫자들: \(uniqueNumbers.sorted())") // 일관된 출력을 위해 정렬하여 출력 (문자열 리터럴 번역)

uniqueNumbers.insert(5)
print("5 삽입 후 고유한 숫자들: \(uniqueNumbers.sorted())") // 문자열 리터럴 번역
if uniqueNumbers.contains(3) {
    print("세트에 3이 포함되어 있습니다.") // 문자열 리터럴 번역
}

// 세트 연산
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print("합집합: \(oddDigits.union(evenDigits).sorted())") // 문자열 리터럴 번역
print("교집합: \(oddDigits.intersection(singleDigitPrimeNumbers).sorted())") // 문자열 리터럴 번역
print("대칭 차집합: \(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())") // 문자열 리터럴 번역
print("차집합: \(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())") // 문자열 리터럴 번역


// --- 튜플 ---
// 고정된 크기의, 다른 타입의 값들을 가질 수 있는 순서 있는 컬렉션입니다.
// 파이썬 튜플과 유사합니다.
let httpStatus = (404, "찾을 수 없음") // 문자열 리터럴 번역
print("상태 코드: \(httpStatus.0), 메시지: \(httpStatus.1)") // 문자열 리터럴 번역

// 튜플 요소 이름 지정
let namedPoint = (x: 10, y: 20, z: 5)
print("점 좌표: x=\(namedPoint.x), y=\(namedPoint.y), z=\(namedPoint.z)") // 문자열 리터럴 번역

// 튜플 분해
let (statusCode, statusMessage) = httpStatus
print("분해됨 - 코드: \(statusCode), 메시지: \(statusMessage)") // 문자열 리터럴 번역

// 밑줄(_)로 튜플의 일부를 무시할 수 있습니다.
let (justCode, _) = httpStatus
print("코드만: \(justCode)") // 문자열 리터럴 번역

// 튜플은 여러 값을 반환하는 함수의 반환 타입으로 유용할 수 있습니다.
func getUser() -> (name: String, age: Int, isActive: Bool) {
    return ("앨리스", 30, true) // 문자열 리터럴 번역 (이름 예시)
}
let user = getUser()
print("\(user.name) 사용자는 \(user.age)살입니다.") // 문자열 리터럴 번역


// --- 옵셔널 ---
// 값의 부재를 처리하는 데 사용됩니다. 옵셔널은 값을 가지거나 `nil`일 수 있습니다.
// 파이썬은 이를 위해 `None`을 사용하지만, Swift의 옵셔널은 타입 안전성이 더 높습니다.

var optionalString: String? = "안녕하세요" // 문자열 리터럴 번역
print("OptionalString: \(optionalString ?? "nil입니다")") // Nil-병합 연산자 (문자열 리터럴 번역)

optionalString = nil
print("nil 할당 후 OptionalString: \(optionalString ?? "nil입니다")") // 문자열 리터럴 번역

// 옵셔널이 아닌 변수가 선언되면 반드시 값을 가져야 합니다.
// var nonOptionalString: String // 오류: 변수는 옵셔널이 아닌 한 사용 전에 초기화해야 합니다.
var nonOptionalString: String = "반드시 값을 가져야 합니다" // 문자열 리터럴 번역

// 강제 언래핑 (매우 주의해서 사용 - nil이면 충돌 발생)
var anotherOptional: String? = "값이 존재합니다" // 문자열 리터럴 번역
// print(anotherOptional!) // "값이 존재합니다"
// anotherOptional = nil
// print(anotherOptional!) // 여기서 충돌 발생: Fatal error: Unexpectedly found nil while unwrapping an Optional value

// 옵셔널 바인딩 (더 안전한 언래핑 방법)
var maybeName: String? = "캐롤" // 문자열 리터럴 번역 (이름 예시)
// maybeName = nil // else 블록 실행을 보려면 주석 해제

if let actualName = maybeName {
    print("이름은 \(actualName)입니다.") // maybeName에 값이 있을 때만 실행 (문자열 리터럴 번역)
} else {
    print("이름이 nil입니다.") // 문자열 리터럴 번역
}

// 하나의 if 문에 여러 옵셔널 바인딩 및 불리언 조건
var maybeAge: Int? = 30
var maybeCity: String? = "런던" // 문자열 리터럴 번역 (도시 예시)

if let name = maybeName, let age = maybeAge, age > 18, let city = maybeCity {
    print("\(name)은(는) \(age)살이고 \(city)에 삽니다.") // 문자열 리터럴 번역
} else {
    print("필요한 모든 정보를 얻을 수 없거나 나이가 18세 초과가 아닙니다.") // 문자열 리터럴 번역
}

// 암시적 언래핑 옵셔널 (거의 필요하지 않음, 주로 Objective-C 상호 운용성을 위해 사용)
// 옵셔널처럼 동작하지만 `!` 없이 접근할 수 있습니다 (접근 시 nil이면 충돌 발생).
let assumedString: String! = "암시적으로 언래핑된 옵셔널 문자열입니다." // 문자열 리터럴 번역
let implicitValue: String = assumedString // `!` 필요 없음, 하지만 assumedString은 여기서 반드시 값을 가져야 합니다.
print(implicitValue)

// let badAssumedString: String! = nil
// let badValue = badAssumedString // badAssumedString이 nil이면 여기서 충돌 발생.

// 타입 별칭 (C의 typedef 또는 파이썬에서 변수에 타입을 할당하는 것과 유사)
// 기존 타입에 대한 대체 이름을 정의합니다.
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min // 타입 별칭 사용
print("최대 진폭: \(maxAmplitudeFound)") // 문자열 리터럴 번역

typealias Point = (Int, Int)
var screenOrigin: Point = (0,0)
print("화면 원점: \(screenOrigin)") // 문자열 리터럴 번역

typealias StringDictionary = [String: String]
var userPreferences: StringDictionary = ["theme": "dark", "language": "ko"] // 문자열 리터럴 번역
print("사용자 테마: \(userPreferences["theme"] ?? "default")") // 문자열 리터럴 번역
```
