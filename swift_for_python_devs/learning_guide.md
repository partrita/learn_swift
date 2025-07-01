# 파이썬 개발자를 위한 Swift 학습 가이드

이 가이드는 Swift의 기초를 안내하며, 기존 파이썬 지식을 활용할 수 있도록 파이썬과의 비교를 통해 설명합니다.

## 목차

1.  [소개](#소개)
    *   [Swift란?](#swift란)
    *   [왜 Swift인가?](#왜-swift인가)
    *   [Swift 대 파이썬: 주요 차이점](#swift-대-파이썬-주요-차이점)
2.  [시작하기](#시작하기)
    *   [Playgrounds](#playgrounds)
    *   [기본 구문](#기본-구문)
3.  [변수와 상수](#변수와-상수)
    *   [선언](#선언)
    *   [타입 추론](#타입-추론)
    *   [타입 안전성](#타입-안전성)
    *   [이름 규칙](#이름-규칙)
4.  [데이터 타입](#데이터-타입)
    *   [기본 타입 (Int, Double, Float, Bool, String)](#기본-타입)
    *   [컬렉션 타입 (Array, Dictionary, Set)](#컬렉션-타입)
    *   [튜플](#튜플)
    *   [옵셔널](#옵셔널)
5.  [연산자](#연산자)
    *   [산술, 비교, 논리 연산자](#산술-비교-논리-연산자)
    *   [Nil-병합 연산자](#nil-병합-연산자)
    *   [범위 연산자](#범위-연산자)
6.  [제어 흐름](#제어-흐름)
    *   [조건문 (if, else if, else, switch)](#조건문)
    *   [반복문 (for-in, while, repeat-while)](#반복문)
    *   [제어 전달 구문 (continue, break, fallthrough, return, throw)](#제어-전달-구문)
7.  [함수](#함수)
    *   [함수 정의 및 호출](#함수-정의-및-호출)
    *   [매개변수와 반환 값](#매개변수와-반환-값)
    *   [인자 레이블과 매개변수 이름](#인자-레이블과-매개변수-이름)
    *   [일급 시민으로서의 함수](#일급-시민으로서의-함수)
    *   [클로저](#클로저)
8.  [객체 지향 프로그래밍 (OOP)](#객체-지향-프로그래밍-oop)
    *   [클래스와 구조체 (structs)](#클래스와-구조체-structs)
    *   [프로퍼티 (저장 프로퍼티와 계산 프로퍼티)](#프로퍼티-저장-프로퍼티와-계산-프로퍼티)
    *   [메서드 (인스턴스 메서드와 타입 메서드)](#메서드-인스턴스-메서드와-타입-메서드)
    *   [초기화 (생성자)](#초기화-생성자)
    *   [소멸화 (소멸자)](#소멸화-소멸자)
    *   [상속](#상속)
    *   [프로토콜 (인터페이스)](#프로토콜-인터페이스)
    *   [익스텐션](#익스텐션)
9.  [오류 처리](#오류-처리)
    *   [오류 표현 및 발생](#오류-표현-및-발생)
    *   [오류 처리 (do-catch, try?, try!)](#오류-처리-do-catch-try-try)
10. [메모리 관리 (ARC)](#메모리-관리-arc)
    *   [자동 참조 계산](#자동-참조-계산)
11. [다음 단계](#다음-단계)

---

## 1. 소개

### Swift란?
Swift는 macOS, iOS, watchOS, tvOS 등을 위한 강력하고 직관적인 프로그래밍 언어입니다. Apple Inc.와 오픈 소스 커뮤니티에 의해 개발되었습니다.

### 왜 Swift인가?
- **안전성:** 일반적인 프로그래밍 오류의 전체 클래스를 제거하도록 설계되었습니다.
- **빠른 속도:** C++에 필적하는 성능을 제공합니다.
- **현대적:** 옵셔널, 제네릭, 클로저와 같은 기능은 표현력이 풍부하고 즐거운 프로그래밍을 가능하게 합니다.
- **상호 운용성:** Objective-C 코드와 원활하게 작동합니다.

### Swift 대 파이썬: 주요 차이점

| 기능             | 파이썬                                      | Swift                                           |
|------------------|---------------------------------------------|-------------------------------------------------|
| **타이핑**       | 동적 타이핑                                 | 정적 타이핑 (타입 추론 기능 포함)                 |
| **성능**         | 일반적으로 느림 (인터프리터 방식)           | 일반적으로 빠름 (컴파일 방식)                     |
| **오류 처리**    | 예외 (try-except)                           | 오류 처리 (do-catch, 옵셔널)                    |
| **Null 안전성**  | `None` 타입, 처리하지 않으면 런타임 오류 발생 | 옵셔널 (`?`, `!`)을 통한 명시적 null 처리       |
| **구문**         | 들여쓰기 민감                               | 중괄호 기반 (`{}`)                              |
| **컴파일**       | 인터프리터 방식 (대부분)                    | 컴파일 방식                                     |
| **모바일 개발**  | 네이티브 지원 제한적 (Kivy, BeeWare)        | iOS, macOS 등의 주요 언어                       |
| **동시성**       | GIL이 진정한 병렬 처리에 병목이 될 수 있음    | 동시성 내장 지원 (Grand Central Dispatch, async/await) |

## 2. 시작하기

### Playgrounds
Xcode Playgrounds는 Swift 코드를 실험하고 결과를 즉시 확인할 수 있는 대화형 환경을 제공합니다. 이는 파이썬 인터프리터나 Jupyter Notebook을 사용하는 것과 유사합니다.

### 기본 구문
- 문장은 일반적으로 줄 바꿈으로 끝납니다. 세미콜론 (`;`)은 한 줄에 여러 문장을 작성하지 않는 한 선택 사항입니다.
- 코드 블록은 중괄호 `{}`로 묶습니다.
- 주석:
    - 한 줄 주석: `// 이것은 주석입니다`
    - 여러 줄 주석: `/* 이것은 여러 줄 주석입니다 */`

**파이썬:**
```python
# 이것은 주석입니다
name = "Alice"
if name == "Alice":
    print("Hello, Alice!") # 들여쓰기가 중요합니다
```

**Swift:**
```swift
// 이것은 주석입니다
var name = "Alice" // 변수 선언
if name == "Alice" { // 범위를 위한 중괄호
    print("Hello, Alice!") // 세미콜론은 선택 사항
}
```

## 3. 변수와 상수

### 선언
- **상수**는 `let`으로 선언합니다. 할당 후에는 값을 변경할 수 없습니다. (한 번 할당된 파이썬 변수를 생각하세요).
- **변수**는 `var`로 선언합니다. 값을 변경할 수 있습니다.

**파이썬:**
```python
# 파이썬에는 언어 키워드에 의한 엄격한 상수 개념이 없습니다
# 관례적으로 대문자 이름은 상수를 의미합니다
MAX_CONNECTIONS = 10
name = "Bob"
name = "Charlie"
```

**Swift:**
```swift
let maxConnections = 10 // 상수
// maxConnections = 5 // 컴파일 시간 오류 발생

var name = "Bob"     // 변수
name = "Charlie"
```

### 타입 추론
Swift는 종종 초기 값으로부터 변수나 상수의 타입을 추론할 수 있습니다.

**파이썬:**
```python
age = 30 # 타입은 int
pi = 3.14 # 타입은 float
is_active = True # 타입은 bool
message = "Hello" # 타입은 str
```

**Swift:**
```swift
var age = 30          // Int로 추론됨
let pi = 3.14         // Double로 추론됨
var isActive = true   // Bool로 추론됨
let message = "Hello" // String으로 추론됨
```

콜론 (`:`)을 사용하여 타입을 명시적으로 선언할 수도 있습니다.

**Swift:**
```swift
var score: Int = 100
let gravity: Double = 9.8
var welcomeMessage: String
welcomeMessage = "Hi there!"
```

### 타입 안전성
Swift는 타입 안전 언어입니다. 이는 컴파일러가 컴파일 시간에 타입을 확인하고 타입 불일치를 오류로 표시한다는 것을 의미합니다. 명시적 변환 없이는 한 타입의 값을 다른 타입의 변수에 할당할 수 없습니다.

**파이썬 (동적 타이핑):**
```python
x = 10
x = "Python" # 허용됨, x의 타입이 변경됨
```

**Swift (정적 타이핑):**
```swift
var x: Int = 10
// x = "Swift" // 컴파일 시간 오류: 'String' 타입의 값을 'Int' 타입에 할당할 수 없습니다
```

### 이름 규칙
- **카멜 케이스:** Swift는 변수, 상수, 함수, 메서드 이름에 카멜 케이스를 사용합니다 (예: `myVariableName`, `calculateArea`).
- **어퍼 카멜 케이스 (파스칼 케이스):** 클래스, 구조체, 열거형, 프로토콜과 같은 타입 이름에 사용합니다 (예: `MyClass`, `String`, `Int`).

이는 변수와 함수에 `snake_case`를, 클래스에 `CapWords`(파스칼 케이스)를 권장하는 파이썬의 PEP 8과 유사합니다.

## 4. 데이터 타입

### 기본 타입

| Swift 타입 | 파이썬 대응 | 설명                       | 예시 (Swift)                   |
|------------|-------------|----------------------------|--------------------------------|
| `Int`      | `int`       | 정수                       | `let age: Int = 25`            |
| `Double`   | `float`     | 64비트 부동 소수점 숫자    | `let pi: Double = 3.14159`     |
| `Float`    | `float`     | 32비트 부동 소수점 숫자    | `let price: Float = 19.99`     |
| `Bool`     | `bool`      | `true` 또는 `false`        | `let isValid: Bool = true`     |
| `String`   | `str`       | 문자열                     | `let greeting: String = "Hello"`|
| `Character`| (단일 문자 str) | 단일 문자                | `let initial: Character = "J"` |


**문자열 보간법:**
파이썬의 f-string과 유사합니다.

**파이썬:**
```python
name = "World"
greeting = f"Hello, {name}!"
```

**Swift:**
```swift
let name = "World"
let greeting = "Hello, \(name)!" // "Hello, World!"
```

### 컬렉션 타입

#### Array (배열)
같은 타입의 값들을 순서대로 저장하는 컬렉션입니다.

**파이썬 (List):**
```python
numbers = [1, 2, 3, 4, 5]
names = ["Alice", "Bob", "Charlie"]
mixed = [1, "hello", True] # 파이썬 리스트는 혼합 타입을 가질 수 있습니다
```

**Swift (Array):**
```swift
var numbers: [Int] = [1, 2, 3, 4, 5]
var names = ["Alice", "Bob", "Charlie"] // [String]으로 추론됨
// var mixed = [1, "hello", true] // 오류: 이종 컬렉션 리터럴은 '[Any]'로만 추론될 수 있습니다

// 빈 배열
var emptyIntArray: [Int] = []
var anotherEmptyArray = [String]()
```
- 요소 접근: `numbers[0]` (두 언어 모두)
- 요소 추가: `numbers.append(6)` (Swift) vs `numbers.append(6)` (파이썬)
- 길이/개수: `numbers.count` (Swift) vs `len(numbers)` (파이썬)

#### Dictionary (딕셔너리)
순서 없는 키-값 쌍의 컬렉션입니다. 키는 같은 타입이어야 하고, 값도 같은 타입이어야 합니다.

**파이썬 (dict):**
```python
person = {
    "name": "Alice",
    "age": 30,
    "city": "New York"
}
scores = {"math": 90, "science": 85}
```

**Swift (Dictionary):**
```swift
var person: [String: Any] = [ // 혼합 값 타입을 위해 Any 사용, 보통 더 구체적으로 지정하려고 노력합니다
    "name": "Alice",
    "age": 30,
    "city": "New York"
]
var scores: [String: Int] = ["math": 90, "science": 85]

// 빈 딕셔너리
var emptyDict: [String: Int] = [:]
var anotherEmptyDict = [String: String]()
```
- 값 접근: `person["name"]` (두 언어 모두). Swift에서는 옵셔널을 반환합니다.
- 추가/업데이트: `scores["english"] = 92` (두 언어 모두)
- 제거: `scores.removeValue(forKey: "math")` (Swift) vs `del scores["math"]` 또는 `scores.pop("math")` (파이썬)

#### Set (세트)
같은 타입의 고유한 값들을 순서 없이 저장하는 컬렉션입니다.

**파이썬 (set):**
```python
unique_numbers = {1, 2, 3, 2, 1} # {1, 2, 3}
```

**Swift (Set):**
```swift
var uniqueNumbers: Set<Int> = [1, 2, 3, 2, 1] // {1, 2, 3}이 됨
var vowels: Set<Character> = ["a", "e", "i", "o", "u"]

// 빈 세트
var emptySet = Set<String>()
```
- 세트 연산 (합집합, 교집합 등)은 두 언어 모두에서 사용 가능합니다.

### 튜플
고정된 크기의, 다른 타입의 값들을 순서대로 가질 수 있는 컬렉션입니다.

**파이썬:**
```python
point = (10, 20)
http_status = (404, "Not Found")
x, y = point
code, message = http_status
```

**Swift:**
```swift
let point = (10, 20)
let httpStatus = (404, "Not Found")

// 요소 접근
let x = point.0       // 10
let y = point.1       // 20

let code = httpStatus.0 // 404
let message = httpStatus.1 // "Not Found"

// 튜플 요소 이름 지정
let namedPoint = (x: 10, y: 20)
print(namedPoint.x) // 10

// 튜플 분해
let (statusCode, statusMessage) = httpStatus
print("상태 코드: \(statusCode)")
```
Swift의 튜플은 명확성을 위해 이름 있는 요소를 허용하는 등 더 강력합니다.

### 옵셔널
Swift는 값의 부재를 처리하기 위해 "옵셔널" 개념을 도입합니다. 옵셔널 변수는 값을 가지거나 `nil`(파이썬의 `None`과 유사)일 수 있습니다. 이는 누락된 값의 가능성을 명시적으로 고려하게 하여 안전한 코드를 작성하기 위한 핵심 기능입니다.

**파이썬:**
```python
def find_user(user_id):
    if user_id == 1:
        return {"name": "Alice"}
    else:
        return None # 사용자를 찾을 수 없음을 나타냄

user = find_user(2)
if user is not None:
    print(user["name"])
else:
    print("사용자를 찾을 수 없습니다.")
```

**Swift:**
```swift
var name: String? // 이 String 변수는 String 또는 nil을 가질 수 있습니다
name = "John Doe"
name = nil

// 옵셔널 String - String 또는 nil일 수 있습니다
var optionalName: String? = "Jane Doe"
// var optionalName: String? = nil

// 강제 언래핑 (주의해서 사용!)
// optionalName이 nil이면 여기서 충돌이 발생합니다.
// let unwrappedName = optionalName!
// print("Hello, \(unwrappedName)")

// 옵셔널 바인딩 (더 안전한 언래핑 방법)
if let unwrappedName = optionalName {
    print("Hello, \(unwrappedName)") // optionalName에 값이 있을 때만 실행됨
} else {
    print("이름이 nil입니다.")
}

// 옵셔널 체이닝
struct User { var profile: Profile? }
struct Profile { var name: String? }
let user: User? = User(profile: Profile(name: "Alice"))

if let userName = user?.profile?.name { // 중첩된 옵셔널에 안전하게 접근
    print("사용자 이름: \(userName)")
} else {
    print("사용자 이름을 가져올 수 없습니다.")
}

// Nil-병합 연산자 (나중에 다룸)
let currentName = optionalName ?? "Guest" // optionalName이 nil이면 "Guest" 사용
print("현재 사용자: \(currentName)")
```
옵셔널을 이해하는 것은 Swift에서 매우 중요합니다.

## 5. 연산자

### 산술, 비교, 논리 연산자
이들은 파이썬과 매우 유사합니다.

- **산술:** `+`, `-`, `*`, `/`, `%` (나머지)
- **비교:** `==`, `!=`, `>`, `<`, `>=`, `<=`
- **논리:** `&&` (논리 AND), `||` (논리 OR), `!` (논리 NOT)

**파이썬:**
```python
a = 10
b = 3
print(a / b)  # 3.333... (부동 소수점 나눗셈)
print(a // b) # 3 (정수 나눗셈)
print(a % b)  # 1

True and False # False
not True # False
```

**Swift:**
```swift
let a = 10
let b = 3
// print(a / b) // a와 b가 Int이면 오류. Int 나눗셈은 Int를 결과로 냄.
print(Double(a) / Double(b)) // 3.333... (부동 소수점 나눗셈을 위해 Double로 변환해야 함)
print(a / b) // 3 (정수 나눗셈)
print(a % b) // 1

true && false // false
!true // false
```
**나눗셈 참고:** Swift에서 `Int / Int`는 `Int`를 결과로 냅니다 (소수점 이하 버림). 부동 소수점 나눗셈을 위해서는 피연산자 중 적어도 하나가 부동 소수점 타입이어야 합니다.

### Nil-병합 연산자 (`??`)
옵셔널이 `nil`일 경우 기본값을 제공합니다.

**파이썬 (종종 `or` 또는 `if` 문으로 처리):**
```python
name = None
username = name or "Guest" # "Guest"

def get_setting(key, default_value):
    # ... 설정 가져오기 ...
    if setting_value is None:
        return default_value
    return setting_value
```

**Swift:**
```swift
let defaultColorName = "red"
var userDefinedColorName: String? // nil 상태

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName이 nil이므로 colorNameToUse는 "red"가 됩니다

userDefinedColorName = "blue"
colorNameToUse = userDefinedColorName ?? defaultColorName
// colorNameToUse는 "blue"가 됩니다
```
구문: `a ?? b`는 `a != nil ? a! : b`와 동일합니다.

### 범위 연산자
- **닫힌 범위 연산자 (`a...b`):** `a`부터 `b`까지의 값을 포함합니다. `1...5`는 1, 2, 3, 4, 5를 나타냅니다.
- **반-열린 범위 연산자 (`a..<b`):** `a`부터 `b` 미만까지의 값을 포함합니다. `1..<5`는 1, 2, 3, 4를 나타냅니다.
- **단방향 범위:** `a...`, `...a`, `..<a`.

**파이썬 (`range()`):**
```python
for i in range(1, 6): # 1, 2, 3, 4, 5 (1...5와 유사)
    print(i)

for i in range(5): # 0, 1, 2, 3, 4 (0..<5와 유사)
    print(i)

my_list = [10, 20, 30, 40, 50]
my_list[1:3] # [20, 30] (슬라이싱, 반-열린 범위와 유사)
```

**Swift:**
```swift
for index in 1...5 {
    print(index) // 1, 2, 3, 4, 5
}

for index in 1..<5 {
    print(index) // 1, 2, 3, 4
}

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names[0...2] { // "Anna", "Alex", "Brian"
    print(name)
}
for name in names[..<2] { // "Anna", "Alex"
    print(name)
}
for name in names[2...] { // "Brian", "Jack"
    print(name)
}
```

## 6. 제어 흐름

### 조건문

#### `if`, `else if`, `else`
구문은 유사하지만, Swift는 단일 문장에도 중괄호 `{}`를 요구하며 조건 주위의 괄호는 선택 사항이지만 명확성을 위해 종종 사용됩니다.

**파이썬:**
```python
temperature = 25
if temperature > 30:
    print("덥습니다!")
elif temperature > 20:
    print("따뜻합니다.")
else:
    print("시원합니다.")
```

**Swift:**
```swift
let temperature = 25
if temperature > 30 {
    print("덥습니다!")
} else if temperature > 20 {
    print("따뜻합니다.")
} else {
    print("시원합니다.")
}
```

#### `switch`
Swift의 `switch` 문은 파이썬에 직접적인 `switch`가 없는 것(파이썬 3.10+에는 `match-case`가 있음)에 비해 매우 강력하고 유연합니다.
- Swift의 `switch` 문은 모든 가능한 값을 다루거나 `default` 케이스를 포함해야 합니다 (철저해야 함).
- 기본적으로 "fall through"하지 않습니다 (일반적으로 `break` 필요 없음). C 스타일의 fall-through를 위해서는 `fallthrough` 키워드를 사용할 수 있습니다.
- 범위, 튜플, 값 바인딩 등 다양한 패턴에 대해 일치시킬 수 있습니다.

**파이썬 (`if-elif-else` 또는 3.10+ `match-case` 사용):**
```python
# if-elif-else 사용
value = "a"
if value == "a":
    print("A입니다")
elif value == "b":
    print("B입니다")
else:
    print("다른 것입니다")

# 파이썬 3.10+ match-case
# match value:
#     case "a":
#         print("A입니다")
#     case "b":
#         print("B입니다")
#     case _:
#         print("다른 것입니다")
```

**Swift:**
```swift
let value = "a"
switch value {
case "a":
    print("A입니다")
case "b", "c": // 복합 케이스
    print("B 또는 C입니다")
default:
    print("다른 것입니다")
}

let approximateCount = 62
let countedThings = "토성 주위를 도는 위성들"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "없음"
case 1..<5:
    naturalCount = "몇 개"
case 5..<12:
    naturalCount = "여러 개"
case 12..<100:
    naturalCount = "수십 개"
case 100..<1000:
    naturalCount = "수백 개"
default:
    naturalCount = "많음"
}
print("\(countedThings)은(는) \(naturalCount) 있습니다.") // "토성 주위를 도는 위성들은 수십 개 있습니다."

// 튜플 일치 및 값 바인딩
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint)은(는) 원점에 있습니다")
case (_, 0): // 와일드카드를 사용한 값 바인딩
    print("\(somePoint)은(는) x축 위에 있습니다")
case (0, let y): // 'y' 값 바인딩
    print("\(somePoint)은(는) y축 \(y)에 있습니다")
case (-2...2, -2...2):
    print("\(somePoint)은(는) 2x2 상자 안에 있습니다")
default:
    print("\(somePoint)은(는) 상자 밖에 있습니다")
}
```

### 반복문

#### `for-in` 반복문
시퀀스(배열, 범위, 문자열 등)를 반복합니다.

**파이썬:**
```python
numbers = [1, 2, 3]
for num in numbers:
    print(num)

for char in "hello":
    print(char)
```

**Swift:**
```swift
let numbers = [1, 2, 3]
for num in numbers {
    print(num)
}

for char in "hello" {
    print(char)
}

// 딕셔너리 반복
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)는 다리가 \(legCount)개 있습니다")
}

// 시퀀스의 값이 필요하지 않은 경우:
for _ in 1...3 { // 반복 변수가 필요하지 않으면 밑줄 사용
    print("반복 중")
}
```

#### `while` 반복문
조건이 참인 동안 문장 집합을 실행합니다.

**파이썬:**
```python
count = 0
while count < 5:
    print(count)
    count += 1
```

**Swift:**
```swift
var count = 0
while count < 5 {
    print(count)
    count += 1 // Swift에는 ++ 또는 -- 연산자가 없습니다
}
```

#### `repeat-while` 반복문
다른 언어의 `do-while` 반복문과 유사합니다. 조건이 확인되기 전에 반복문 본문이 적어도 한 번 실행됩니다.

**파이썬 (`while True`와 `break`로 에뮬레이트):**
```python
# 직접적인 repeat-while은 없으며, 종종 에뮬레이트됩니다:
# count = 0
# while True:
#     print(count)
#     count += 1
#     if not (count < 5):
#         break
```

**Swift:**
```swift
var i = 0
repeat {
    print("i의 현재 값: \(i)")
    i += 1
} while i < 5
// 이 반복문은 i = 0, 1, 2, 3, 4에 대해 출력합니다
```

### 제어 전달 구문
- **`continue`**: 반복문의 현재 반복을 건너뛰고 다음 반복으로 진행합니다. (파이썬과 동일)
- **`break`**: 반복문이나 `switch` 문을 즉시 종료합니다. (파이썬과 동일)
- **`fallthrough`**: `switch` 문에서 실행이 다음 case 블록으로 계속되도록 합니다 (C 스타일 동작).
- **`return`**: 함수를 종료하고 선택적으로 반환 값을 제공합니다. (파이썬과 동일)
- **`throw`**: 오류 처리에 사용됩니다 (나중에 다룸).

**`fallthrough`를 사용한 Swift 예시:**
```swift
let integerToDescribe = 5
var description = "\(integerToDescribe)라는 숫자는"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " 소수이고, 또한"
    fallthrough // 의도적으로 default로 넘어감
default:
    description += " 정수입니다."
}
print(description) // "5라는 숫자는 소수이고, 또한 정수입니다."
```

## 7. 함수

### 함수 정의 및 호출

**파이썬:**
```python
def greet(name):
    return f"Hello, {name}!"

message = greet("Alice")
print(message)
```

**Swift:**
```swift
func greet(name: String) -> String { // 매개변수 타입과 반환 타입이 명시적입니다
    return "Hello, \(name)!"
}

let message = greet(name: "Alice") // 호출 시 인자 레이블 'name'이 사용됩니다
print(message)
```
- Swift 함수는 `func` 키워드를 사용합니다.
- 매개변수 타입과 반환 타입은 **반드시** 지정해야 합니다.
- `->`는 반환 타입을 나타냅니다. 함수가 값을 반환하지 않으면 `-> Void`를 사용하거나 생략할 수 있습니다.

### 매개변수와 반환 값

**여러 매개변수:**
**파이썬:**
```python
def add(a, b):
    return a + b
```
**Swift:**
```swift
func add(a: Int, b: Int) -> Int {
    return a + b
}
let sum = add(a: 5, b: 3)
```

**매개변수 없음:**
**파이썬:**
```python
def say_hello():
    print("Hello!")
```
**Swift:**
```swift
func sayHello() { // 또는 func sayHello() -> Void {
    print("Hello!")
}
sayHello()
```

**튜플 반환 (여러 값 반환):**
**파이썬:**
```python
def get_coordinates():
    return 10, 20 # 튜플 반환

x, y = get_coordinates()
```
**Swift:**
```swift
func getCoordinates() -> (Int, Int) {
    return (10, 20)
}
let coordinates = getCoordinates()
print("x: \(coordinates.0), y: \(coordinates.1)")

func getNamedCoordinates() -> (x: Int, y: Int) {
    return (x: 10, y: 20)
}
let namedCoords = getNamedCoordinates()
print("x: \(namedCoords.x), y: \(namedCoords.y)")
```

### 인자 레이블과 매개변수 이름
기본적으로 Swift는 함수를 호출할 때 매개변수 이름을 인자 레이블로 사용합니다.

```swift
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // 함수 본문에서 firstParameterName은 첫 번째 매개변수 값을,
    // secondParameterName은 두 번째 매개변수 값을 참조합니다
}
// 호출 시 매개변수 이름을 레이블로 사용합니다:
// someFunction(firstParameterName: 1, secondParameterName: 2)
```

**다른 인자 레이블 지정:**
내부 매개변수 이름과 다른 외부 인자 레이블을 제공할 수 있습니다. 인자 레이블이 없도록 하려면 `_`를 사용합니다.

```swift
func greet(person name: String, from hometown: String) -> String {
    // 'name'과 'hometown'은 함수 내부에서 사용됩니다
    return "Hello \(name)! \(hometown)에서 오신 것을 환영합니다."
}
// 호출 방식:
print(greet(person: "Bill", from: "Cupertino"))
// 'person'과 'from'이 인자 레이블입니다.

func subtract(_ a: Int, by b: Int) -> Int { // 첫 번째 매개변수에 레이블 없음
    return a - b
}
let result = subtract(10, by: 3) // 호출: subtract(10, by: 3)
```
이는 레이블이 항상 매개변수 이름인 파이썬의 키워드 인자와 다릅니다.

**기본 매개변수 값:**
파이썬과 유사합니다.

**파이썬:**
```python
def power(base, exponent=2):
    return base ** exponent
```
**Swift:**
```swift
func power(base: Int, exponent: Int = 2) -> Int {
    var result = 1
    for _ in 0..<exponent {
        result *= base
    }
    return result
}
power(base: 3) // 9
power(base: 3, exponent: 3) // 27
```

**가변 매개변수 (파이썬의 `*args`와 유사):**
지정된 타입의 값을 0개 이상 받습니다.

**파이썬:**
```python
def average(*numbers):
    if not numbers:
        return 0
    return sum(numbers) / len(numbers)
```
**Swift:**
```swift
func average(_ numbers: Double...) -> Double { // numbers는 내부적으로 [Double]입니다
    if numbers.isEmpty {
        return 0.0
    }
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
average(1.0, 2.0, 3.0) // 2.0
average()              // 0.0
```

**In-Out 매개변수 (참조에 의한 전달과 같이 매개변수를 직접 수정):**
함수 매개변수는 기본적으로 상수입니다. 함수가 매개변수 값을 수정하고 함수 호출이 끝난 후에도 해당 변경 사항이 유지되기를 원하면 해당 매개변수를 in-out 매개변수로 정의합니다.
in-out 매개변수에 인수를 전달할 때 변수 이름 바로 앞에 앰퍼샌드(`&`)를 붙입니다.

**파이썬 (객체는 참조로 전달되며, 가변 타입은 변경될 수 있음):**
```python
def modify_list(my_list):
    my_list.append(4)

items = [1, 2, 3]
modify_list(items) # items는 이제 [1, 2, 3, 4]입니다
```

**Swift:**
```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt) // &를 사용하여 참조로 전달
print("someInt는 이제 \(someInt)이고, anotherInt는 이제 \(anotherInt)입니다")
// "someInt는 이제 107이고, anotherInt는 이제 3입니다" 출력
```

### 일급 시민으로서의 함수
파이썬과 마찬가지로 Swift의 함수는 일급 타입입니다. 변수/상수에 할당하거나, 다른 함수에 인수로 전달하거나, 함수에서 반환할 수 있습니다.

**Swift:**
```swift
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

var mathFunction: (Int, Int) -> Int = addTwoInts // mathFunction은 (Int, Int) -> Int 타입입니다
print("결과: \(mathFunction(2, 3))") // 결과: 5

func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("계산 결과: \(mathFunc(a, b))")
}
printMathResult(addTwoInts, 10, 5) // "계산 결과: 15"

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int { // 함수를 반환합니다
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero는 이제 stepBackward() 함수를 참조합니다
print("0으로 카운트:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("0!")
```

### 클로저
클로저는 코드 내에서 전달되고 사용될 수 있는 자체 포함된 기능 블록입니다. 파이썬의 `lambda` 함수와 유사하지만 훨씬 더 강력하고 다재다능하며, Ruby의 블록이나 JavaScript의 익명 함수와 비슷합니다.

**파이썬 Lambda:**
```python
numbers = [1, 2, 3, 4]
squared = list(map(lambda x: x * x, numbers)) # [1, 4, 9, 16]
```

**Swift 클로저:**
클로저는 정의된 컨텍스트의 모든 상수와 변수에 대한 참조를 캡처하고 저장할 수 있습니다 (이를 "클로징 오버"라고 함).

일반적인 형태:
```swift
{ (매개변수) -> 반환_타입 in
    // 문장들
}
```

`sorted(by:)` 메서드 예시:
```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// 정렬을 위해 정의된 함수 사용
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward) // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

// 클로저 표현식 사용
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 컨텍스트에서 타입 추론 (Swift는 매개변수 및 반환 값의 타입을 추론할 수 있음)
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

// 단일 표현식 클로저의 암시적 반환
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

// 축약형 인자 이름 ($0, $1, $2 등)
reversedNames = names.sorted(by: { $0 > $1 })

// 연산자 메서드 (연산자 함수가 필요한 타입과 일치하는 경우)
reversedNames = names.sorted(by: >) // 이 경우 가장 간단한 형태
```

**후행 클로저:**
클로저 표현식이 함수의 마지막 인수인 경우, 함수 호출 괄호 뒤에 *후행 클로저*로 작성할 수 있습니다. 클로저가 *유일한* 인수인 경우 괄호를 완전히 생략할 수 있습니다.

```swift
// func someFunctionThatTakesAClosure(closure: () -> Void) { /* ... */ }

// 후행 클로저로 호출:
// someFunctionThatTakesAClosure() {
//     // 클로저 본문이 여기에 들어갑니다
// }
// 또는
// someFunctionThatTakesAClosure {
//     // 클로저 본문
// }

let numbers = [1, 2, 3, 4]
let squaredNumbers = numbers.map { number in // 후행 클로저
    number * number
}
print(squaredNumbers) // [1, 4, 9, 16]

let mappedNumbers = numbers.map { number -> String in // 명시적 반환 타입을 가진 후행 클로저
    return "숫자: \(number)"
}
print(mappedNumbers) // ["숫자: 1", "숫자: 2", "숫자: 3", "숫자: 4"]
```

클로저는 Swift에서 광범위하게 사용되며, 특히 콜백, 비동기 작업 및 함수형 프로그래밍 패턴에 유용합니다.

## 8. 객체 지향 프로그래밍 (OOP)

### 클래스와 구조체 (`struct`s)
클래스와 구조체 모두 프로퍼티와 메서드를 정의할 수 있습니다.

**주요 차이점:**
- **클래스는 참조 타입입니다:** 클래스 인스턴스를 할당하거나 함수에 전달할 때, 동일한 기존 인스턴스에 대한 참조로 작업합니다. 한 참조를 통해 변경된 사항은 다른 참조를 통해서도 볼 수 있습니다. (파이썬에서 대부분의 객체가 작동하는 방식과 유사합니다).
- **구조체는 값 타입입니다:** 구조체 인스턴스를 할당하거나 함수에 전달할 때, 인스턴스의 복사본이 만들어집니다. 한 복사본의 변경 사항은 다른 복사본에 영향을 미치지 않습니다. (파이썬의 `int`, `str`과 같은 기본 타입 또는 리스트를 명시적으로 복사할 때 `new_list = old_list[:]`와 유사합니다).

- **상속:** 클래스는 상속을 지원하지만 구조체는 지원하지 않습니다.
- **소멸자 (`deinit`):** 클래스는 소멸자를 가질 수 있지만 구조체는 가질 수 없습니다.
- **참조 계산:** 참조 계산은 클래스의 인스턴스에만 적용됩니다.

**구조체는 언제 사용하나요?**
- 작고 간단한 데이터 구조.
- 값 의미론을 원할 때 (복사본은 독립적임).
- 다른 타입으로부터 상속받을 필요가 없을 때.
- 예시: Point, Size, Rectangle, 복소수.

**파이썬 (클래스):**
```python
class Dog:
    def __init__(self, name, breed): # 생성자
        self.name = name
        self.breed = breed
        self.tricks = []

    def bark(self):
        return "Woof!"

    def learn_trick(self, trick_name):
        self.tricks.append(trick_name)

my_dog = Dog("Buddy", "Golden Retriever")
print(my_dog.name)
print(my_dog.bark())
my_dog.learn_trick("sit")

another_dog_ref = my_dog # 둘 다 동일한 객체를 참조합니다
another_dog_ref.learn_trick("fetch")
print(my_dog.tricks) # ['sit', 'fetch']
```

**Swift (클래스 예시):**
```swift
class Dog {
    var name: String
    var breed: String
    var tricks: [String] = [] // 기본 빈 배열로 초기화

    // 초기화 구문 (생성자)
    init(name: String, breed: String) {
        self.name = name // 'self'는 파이썬의 self와 유사합니다
        self.breed = breed
    }

    func bark() -> String {
        return "Woof!"
    }

    func learnTrick(_ trickName: String) {
        tricks.append(trickName)
    }
}

let myDog = Dog(name: "Buddy", breed: "Golden Retriever")
print(myDog.name)
print(myDog.bark())
myDog.learnTrick("sit")

let anotherDogRef = myDog // 둘 다 동일한 Dog 인스턴스를 참조합니다
anotherDogRef.learnTrick("fetch")
print(myDog.tricks) // ["sit", "fetch"]
```

**Swift (구조체 예시):**
```swift
struct Point {
    var x: Double
    var y: Double

    func distance(to otherPoint: Point) -> Double {
        let dx = otherPoint.x - self.x
        let dy = otherPoint.y - self.y
        return (dx*dx + dy*dy).squareRoot() // Double에 squareRoot() 익스텐션이 있다고 가정
    }
}

var p1 = Point(x: 0, y: 0) // 구조체는 사용자 정의 초기화 구문을 정의하지 않으면 멤버별 초기화 구문을 기본으로 얻습니다
var p2 = p1 // p2는 p1의 복사본입니다

p2.x = 10
print(p1.x) // 0.0 (p1은 변경되지 않음)
print(p2.x) // 10.0

let p3 = Point(x:3, y:4)
// p3.x = 5 // 오류: p3는 let 상수이므로, 구조체인 경우 프로퍼티를 변경할 수 없습니다
```
구조체의 인스턴스가 `let` 상수에 할당되면, 해당 프로퍼티가 변수 프로퍼티일지라도 변경할 수 없습니다. 이는 구조체가 값 타입이기 때문입니다. 클래스(참조 타입)의 경우, `let` 상수 인스턴스의 변수 프로퍼티를 변경할 수 있습니다.

### 프로퍼티

프로퍼티는 특정 클래스, 구조체 또는 열거형과 값을 연관시킵니다.

#### 저장 프로퍼티
인스턴스의 일부로 상수(`let`) 또는 변수(`var`) 값을 저장합니다.

```swift
struct FixedLengthRange {
    var firstValue: Int
    let length: Int // 저장 프로퍼티
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 이 범위는 정수 값 0, 1, 2를 나타냅니다
rangeOfThreeItems.firstValue = 6
// 이 범위는 이제 정수 값 6, 7, 8을 나타냅니다
// rangeOfThreeItems.length = 4 // 오류: length는 상수 저장 프로퍼티입니다
```

**지연 저장 프로퍼티:**
처음 사용될 때까지 초기 값이 계산되지 않는 프로퍼티입니다. `lazy var`로 선언합니다. 반드시 `var`여야 합니다. 초기 값이 계산 비용이 많이 들거나 초기화 시 사용할 수 없는 외부 요인에 의존하는 프로퍼티에 유용합니다.

```swift
class DataImporter {
    /* DataImporter는 외부 파일에서 데이터를 가져오는 클래스입니다.
    이 클래스는 초기화하는 데 상당한 시간이 걸린다고 가정합니다. */
    var filename = "data.txt"
    // DataImporter 클래스는 여기서 데이터 가져오기 기능을 제공합니다
    init() {
        print("DataImporter 초기화됨")
    }
}

class DataManager {
    lazy var importer = DataImporter() // importer는 접근될 때까지 생성되지 않습니다
    var data: [String] = []
    // DataManager 클래스는 여기서 데이터 관리 기능을 제공합니다
}

let manager = DataManager() // importer의 DataImporter 인스턴스는 아직 생성되지 않았습니다
manager.data.append("일부 데이터")
manager.data.append("더 많은 데이터")
// importer 프로퍼티의 DataImporter 인스턴스는 여전히 생성되지 않았습니다

print(manager.importer.filename) // 이제 importer 인스턴스가 생성됩니다
// "DataImporter 초기화됨" 출력
// "data.txt" 출력
```

#### 계산 프로퍼티
실제로 값을 저장하지 않습니다. 대신, 다른 프로퍼티와 값을 간접적으로 검색하고 설정하기 위한 getter와 선택적 setter를 제공합니다.

**파이썬 (`@property` 데코레이터 사용):**
```python
class Square:
    def __init__(self, side_length):
        self.side_length = side_length

    @property
    def area(self): # Getter
        return self.side_length ** 2

    @area.setter
    def area(self, new_area):
        self.side_length = new_area ** 0.5

s = Square(5)
print(s.area) # 25
s.area = 36
print(s.side_length) # 6.0
```

**Swift:**
```swift
struct PointStruct { // 충돌을 피하기 위해 Point에서 변경
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = PointStruct()
    var size = Size()
    var center: PointStruct { // 계산 프로퍼티 'center'
        get { // Getter
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return PointStruct(x: centerX, y: centerY)
        }
        set(newCenter) { // Setter (선택 사항)
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
        // setter가 정의되지 않으면 읽기 전용 계산 프로퍼티입니다
        // 축약형 setter: 새 값의 이름이 지정되지 않으면 기본적으로 'newValue'가 됩니다
        // set {
        //    origin.x = newValue.x - (size.width / 2)
        //    origin.y = newValue.y - (size.height / 2)
        // }
    }
}

var square = Rect(origin: PointStruct(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
print("square.origin은 현재 (\(square.origin.x), \(square.origin.y))에 있습니다")
// square.origin은 현재 (0.0, 0.0)에 있습니다
print("square.center는 (\(initialSquareCenter.x), \(initialSquareCenter.y))에 있습니다")
// square.center는 (5.0, 5.0)에 있습니다

square.center = PointStruct(x: 15.0, y: 15.0)
print("square.origin은 현재 (\(square.origin.x), \(square.origin.y))에 있습니다")
// square.origin은 현재 (10.0, 10.0)에 있습니다
```

**프로퍼티 관찰자 (`willSet`, `didSet`):**
프로퍼티 값의 변경에 응답합니다. 새 값이 현재 값과 동일하더라도 프로퍼티 값이 설정될 때마다 호출됩니다.
- `willSet`은 값이 저장되기 직전에 호출됩니다. 새 값은 상수(기본 이름 `newValue`)로 전달됩니다.
- `didSet`은 새 값이 저장된 직후에 호출됩니다. 이전 값은 상수(기본 이름 `oldValue`)로 전달됩니다.

```swift
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("\(totalSteps)에서 totalSteps를 \(newTotalSteps)(으)로 설정하려고 합니다")
        }
        didSet {
            if totalSteps > oldValue  {
                print("\(totalSteps - oldValue) 걸음 추가됨")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// 0에서 totalSteps를 200(으)로 설정하려고 합니다
// 200 걸음 추가됨
stepCounter.totalSteps = 360
// 200에서 totalSteps를 360(으)로 설정하려고 합니다
// 160 걸음 추가됨
```

### 메서드

특정 타입과 연관된 함수입니다.

#### 인스턴스 메서드
클래스, 구조체 또는 열거형의 인스턴스에서 호출되는 메서드입니다. (`self`는 현재 인스턴스를 참조합니다).

```swift
class Counter {
    var count = 0
    func increment() {
        self.count += 1 // 모호함이 없으면 self는 선택 사항입니다
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment() // count는 1
counter.increment(by: 5) // count는 6
counter.reset() // count는 0
```

**인스턴스 메서드 내에서 값 타입 수정 (`mutating`):**
구조체와 열거형은 값 타입입니다. 기본적으로 값 타입의 프로퍼티는 해당 인스턴스 메서드 내에서 수정할 수 없습니다. 수정을 허용하려면 메서드 앞에 `mutating` 키워드를 붙입니다.

```swift
struct PointValueType { // 충돌을 피하기 위해 이름 변경
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        // self.x += deltaX // 메서드가 mutating이므로 프로퍼티를 수정할 수 있습니다
        // self.y += deltaY
        self = PointValueType(x: self.x + deltaX, y: self.y + deltaY) // 또는 self에 새 구조체를 할당
    }
}
var somePointVal = PointValueType(x: 1.0, y: 1.0)
somePointVal.moveBy(x: 2.0, y: 3.0)
print("점은 이제 (\(somePointVal.x), \(somePointVal.y))에 있습니다")
// "점은 이제 (3.0, 4.0)에 있습니다" 출력

// let fixedPoint = PointValueType(x: 3.0, y: 3.0)
// fixedPoint.moveBy(x: 2.0, y: 3.0) // 오류 발생, 불변 값에 대해 mutating 메서드를 호출할 수 없습니다
```

#### 타입 메서드 (정적 메서드)
인스턴스가 아닌 타입 자체에서 호출됩니다. `static` 키워드를 사용합니다. 클래스의 경우 `class`를 사용하여 하위 클래스가 슈퍼클래스의 구현을 재정의하도록 허용할 수 있습니다.

**파이썬 (`@staticmethod` 또는 `@classmethod` 사용):**
```python
class MathHelper:
    @staticmethod
    def add(x, y):
        return x + y

    @classmethod
    def description(cls):
        return f"이것은 헬퍼 클래스입니다: {cls.__name__}"

MathHelper.add(5,3) # 8
MathHelper.description()
```

**Swift:**
```swift
struct LevelTracker {
    static var highestUnlockedLevel = 1 // 저장 타입 프로퍼티
    static func unlock(_ level: Int) { // 타입 메서드
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func isUnlocked(_ level: Int) -> Bool { // 타입 메서드
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1 // 저장 인스턴스 프로퍼티

    // 이 인스턴스 메서드는 타입 프로퍼티를 쿼리하여 현재 레벨이 잠금 해제되었는지 확인할 수 있습니다
    func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level // 이 부분은 mutating func이어야 수정 가능합니다. 예제에서는 설명을 위해 생략.
            return true
        } else {
            return false
        }
    }
}

// 사용법:
LevelTracker.unlock(2)
LevelTracker.unlock(5)
print(LevelTracker.highestUnlockedLevel) // 5

var playerLevel = LevelTracker() // 인스턴스
print(playerLevel.currentLevel) // 1
// playerLevel.advance는 currentLevel을 변경하려고 하므로 mutating이어야 합니다.
// 이 예제에서는 LevelTracker.isUnlocked를 보여주는 데 중점을 둡니다.
if LevelTracker.isUnlocked(3) { // 직접 타입 메서드 호출
    print("레벨 3은 잠금 해제되었습니다.")
} else {
    print("레벨 3은 잠겨 있습니다.")
}


class SomeClass {
    static func someTypeMethod() {
        print("클래스의 정적 타입 메서드")
    }
    class func overridableTypeMethod() { // 'class'는 재정의를 허용합니다
        print("클래스 타입 메서드 - 재정의 가능")
    }
}
```

### 초기화 (생성자)
초기화 구문 (`init`)은 새 인스턴스를 생성하기 위한 특별한 메서드입니다. 모든 저장 프로퍼티가 초기 값을 갖도록 하는 것이 주된 역할입니다.

**파이썬 (`__init__`):**
```python
class Color:
    def __init__(self, red, green, blue):
        self.red = red
        self.green = green
        self.blue = blue
```

**Swift:**
```swift
struct Color {
    let red, green, blue: Double
    // 초기화 구문
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    // 또 다른 초기화 구문
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let gray = Color(white: 0.5) // init(white:) 호출
```

**기본 초기화 구문:**
- 구조체가 사용자 정의 초기화 구문을 제공하지 않으면 자동으로 *멤버별 초기화 구문*을 얻습니다 (모든 프로퍼티에 기본값이 있거나 옵셔널인 경우 기본 `init()`도 얻음).
  `struct Size { var width = 0.0, height = 0.0 }`
  `let s = Size(width: 10, height: 20)` 또는 `let s = Size()`
- 클래스가 모든 프로퍼티에 기본값을 제공하고 사용자 정의 초기화 구문이 없으면 기본 `init()`을 얻습니다.

**지정 초기화 구문과 편의 초기화 구문 (클래스용):**
- **지정 초기화 구문**은 주 초기화 구문입니다. 해당 클래스에서 도입된 모든 프로퍼티를 완전히 초기화하고 적절한 슈퍼클래스 초기화 구문을 호출합니다. 클래스는 적어도 하나를 가져야 합니다.
- **편의 초기화 구문**은 보조적인 지원 초기화 구문입니다. 동일한 클래스의 다른 초기화 구문을 호출해야 합니다 (결국 지정 초기화 구문을 호출).
  `convenience` 키워드로 표시됩니다.

```swift
class Food {
    var name: String
    // 지정 초기화 구문
    init(name: String) {
        self.name = name
    }
    // 편의 초기화 구문 (동일 클래스의 지정 초기화 구문을 호출해야 함)
    convenience init() {
        self.init(name: "[Unnamed]") // init(name:) 호출
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    // RecipeIngredient의 지정 초기화 구문
    init(name: String, quantity: Int) {
        self.quantity = quantity // 하위 클래스 프로퍼티 먼저 초기화
        super.init(name: name)   // 그런 다음 슈퍼클래스의 지정 초기화 구문 호출
    }
    // 슈퍼클래스의 편의 초기화 구문을 재정의하는 편의 초기화 구문
    // 이 클래스(RecipeIngredient)의 지정 초기화 구문을 호출해야 함
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient() // 편의 init() -> 편의 init(name:) -> 지정 init(name:quantity:) 호출
print(oneMysteryItem.name) // "[Unnamed]"
print(oneMysteryItem.quantity) // 1

let oneBacon = RecipeIngredient(name: "Bacon")
print(oneBacon.name) // "Bacon"
print(oneBacon.quantity) // 1

let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
print(sixEggs.name) // "Eggs"
print(sixEggs.quantity) // 6
```

**실패 가능한 초기화 구문 (`init?`, `init!`):**
실패할 수 있는 ( `nil`을 반환할 수 있는) 초기화 구문입니다.

```swift
struct Animal {
    let species: String
    init?(species: String) { // 실패 가능한 초기화 구문
        if species.isEmpty { return nil } // 초기화 실패
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe") // someCreature는 Animal? 타입입니다
if let giraffe = someCreature {
    print("\(giraffe.species) 종으로 동물이 초기화되었습니다")
}

let anonymousCreature = Animal(species: "") // anonymousCreature는 nil입니다
if anonymousCreature == nil {
    print("익명 동물은 초기화될 수 없었습니다")
}
```

### 소멸화 (소멸자)
소멸자 (`deinit`)는 클래스 인스턴스가 할당 해제되기 직전에 호출됩니다. 클래스에만 해당됩니다.

**파이썬 (`__del__` - 덜 결정적):**
```python
class MyFileHandler:
    def __init__(self, filename):
        self.file = open(filename, 'w')
        print("파일 열림.")
    def __del__(self):
        if self.file:
            self.file.close()
            print("파일 닫힘.") # 객체가 가비지 컬렉션될 때 호출됨

# handler = MyFileHandler("test.txt")
# handler = None # __del__을 트리거할 수 있음
```

**Swift (`deinit`):**
```swift
class Bank {
    static var coinsInBank = 10_000
    static func vendCoins(_ numberOfCoinsToVend: Int) -> Int {
        let numberOfCoinsActuallyVended = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsActuallyVended
        return numberOfCoinsActuallyVended
    }
    static func receiveCoins(_ coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(_ coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit { // 소멸자
        Bank.receiveCoins(coinsInPurse) // 은행에 코인 반환
        print("플레이어가 소멸화되었고, \(coinsInPurse) 코인을 은행에 반환했습니다.")
    }
}

var playerOne: Player? = Player(coins: 100)
print("PlayerOne은 \(playerOne!.coinsInPurse) 코인을 가지고 있습니다") // PlayerOne은 100 코인을 가지고 있습니다
print("은행에는 \(Bank.coinsInBank) 코인이 있습니다") // 은행에는 9900 코인이 있습니다

playerOne!.winCoins(2000)
print("PlayerOne은 이제 \(playerOne!.coinsInPurse) 코인을 가지고 있습니다") // PlayerOne은 이제 2100 코인을 가지고 있습니다
print("은행에는 \(Bank.coinsInBank) 코인이 있습니다") // 은행에는 7900 코인이 있습니다

playerOne = nil // Player 인스턴스를 할당 해제하고 deinit이 호출됩니다
// "플레이어가 소멸화되었고, 2100 코인을 은행에 반환했습니다." 출력
print("은행에는 이제 \(Bank.coinsInBank) 코인이 있습니다") // 은행에는 이제 10000 코인이 있습니다
```

### 상속
클래스는 다른 클래스(슈퍼클래스)로부터 메서드, 프로퍼티 및 기타 특성을 상속받을 수 있습니다. 상속받는 클래스는 하위 클래스입니다.

**파이썬:**
```python
class Vehicle:
    def __init__(self, current_speed=0):
        self.current_speed = current_speed

    def make_noise(self):
        print("일반 차량 소음")

class Bicycle(Vehicle): # Bicycle이 Vehicle을 상속합니다
    def __init__(self, has_basket=False):
        super().__init__() # 슈퍼클래스 init 호출
        self.has_basket = has_basket

    def make_noise(self): # 재정의
        print("따르릉 따르릉!")

bike = Bicycle(has_basket=True)
bike.make_noise() # 따르릉 따르릉!
print(bike.current_speed) # 0
```

**Swift:**
```swift
class Vehicle {
    var currentSpeed = 0.0
    var description: String { // 계산 프로퍼티
        return "시속 \(currentSpeed) 마일로 이동 중"
    }
    func makeNoise() {
        // 아무것도 하지 않음 - 임의의 차량이 반드시 소음을 내는 것은 아님
        print("일반 차량 소음 (슈퍼클래스에서)")
    }
}

class Bicycle: Vehicle { // Bicycle이 Vehicle을 상속합니다
    var hasBasket = false
    // 하위 클래스는 기본적으로 슈퍼클래스 초기화 구문을 자동으로 상속하지 않습니다
    // (안전을 위해 특정 조건이 충족되는 경우는 제외).
    // 자체적으로 제공하거나 안전한 경우 상속된 것에 의존해야 합니다.

    // 하위 클래스 초기화 구문이 슈퍼클래스 지정 초기화 구문을 호출하지 않으면,
    // 슈퍼클래스에 인자 없는 init이 있는 경우 Swift가 암시적으로 super.init()을 호출합니다.
    // 여기서 Vehicle에는 사용자 정의 init이 없으므로 기본 init()이 있습니다.
    // Bicycle은 정의하지 않으면 기본 init()을 얻게 됩니다.

    override func makeNoise() { // 'override' 키워드가 필요합니다
        print("따르릉 따르릉!")
    }
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("자전거: \(bicycle.description)") // 자전거: 시속 15.0 마일로 이동 중
bicycle.makeNoise() // 따르릉 따르릉!

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 12.0
print("탠덤 자전거: \(tandem.description)") // 탠덤 자전거: 시속 12.0 마일로 이동 중
tandem.makeNoise() // 따르릉 따르릉! (Bicycle에서 상속)

// 재정의 방지: `final`
// `final var`, `final func`, `final class subscript`, `final class`
// final class Car { ... } // Car는 하위 클래스를 가질 수 없습니다
// class MyCar: Car {} // 오류
```
- 슈퍼클래스 메서드, 프로퍼티 또는 서브스크립트를 재정의하려면 `override` 키워드를 사용합니다.
- `super.`를 사용하여 슈퍼클래스 멤버에 접근합니다 (예: `super.init()`, `super.someMethod()`).

### 프로토콜 (인터페이스)
프로토콜은 특정 작업이나 기능에 적합한 메서드, 프로퍼티 및 기타 요구 사항의 청사진을 정의합니다. 그런 다음 클래스, 구조체 또는 열거형이 프로토콜을 *준수*할 수 있습니다. 이는 Java/C#의 인터페이스 또는 파이썬의 추상 기본 클래스(ABC)와 유사합니다.

**파이썬 (`abc` 모듈 사용):**
```python
from abc import ABC, abstractmethod

class Drawable(ABC):
    @abstractmethod
    def draw(self):
        pass

class Circle(Drawable):
    def draw(self):
        print("원 그리기")

# d = Drawable() # 오류: 추상 클래스를 인스턴스화할 수 없습니다
c = Circle()
c.draw()
```

**Swift:**
```swift
protocol FullyNamed {
    var fullName: String { get } // 가져올 수 있는 프로퍼티 요구 사항
    // 설정 가능한 프로퍼티의 경우: { get set }
    func describe() // 메서드 요구 사항
}

struct Person: FullyNamed { // Person이 FullyNamed를 준수합니다
    var firstName: String
    var lastName: String

    var fullName: String { // 필요한 프로퍼티 구현
        return "\(firstName) \(lastName)"
    }
    func describe() { // 필요한 메서드 구현
        print("이 사람의 이름은 \(fullName)입니다.")
    }
}

struct Pet: FullyNamed {
    var name: String
    var species: String

    var fullName: String {
        return "\(name) (\(species))"
    }
    func describe() {
        print("이 반려동물은 \(fullName)입니다.")
    }
}

let john = Person(firstName: "John", lastName: "Appleseed")
john.describe() // 이 사람의 이름은 John Appleseed입니다.
print(john.fullName) // John Appleseed

let fluffy = Pet(name: "Fluffy", species: "Cat")
fluffy.describe() // 이 반려동물은 Fluffy (Cat)입니다.

// 프로토콜을 타입으로 사용
var someone: FullyNamed
someone = john
print(someone.fullName)
someone = fluffy
print(someone.fullName)

// 프로토콜 요구 사항에는 타입 프로퍼티 및 타입 메서드(정적)가 포함될 수 있습니다
protocol Togglable {
    mutating func toggle() // 인스턴스를 수정하는 경우 'mutating' (값 타입용)
    static var description: String { get }
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
    static var description: String {
        return "껐다 켰다 할 수 있는 스위치입니다."
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle() // lightSwitch는 이제 .on입니다
print(OnOffSwitch.description) // 껐다 켰다 할 수 있는 스위치입니다.
```
프로토콜은 다형성과 코드 재사용(프로토콜 지향 프로그래밍)을 가능하게 하는 Swift 디자인의 기본입니다.

### 익스텐션
기존 클래스, 구조체, 열거형 또는 프로토콜 타입에 새로운 기능을 추가합니다. 여기에는 계산 프로퍼티, 메서드, 초기화 구문, 서브스크립트 추가 및 프로토콜 준수가 포함됩니다.
이는 파이썬의 클래스 몽키 패칭 기능과 유사하지만 더 구조적이고 타입 안전합니다.

```swift
// 내장 Double 타입 확장
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }

    func squared() -> Double {
        return self * self
    }
}

let oneInch = 25.4.mm
print("1인치는 \(oneInch) 미터입니다") // 1인치는 0.0254 미터입니다
let threeFeet = 3.0.ft
print("3피트는 \(threeFeet) 미터입니다") // 3피트는 0.914399970739201 미터입니다

let fiveSquared = 5.0.squared() // 25.0

// 익스텐션을 통한 프로토콜 준수
protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Game {
    var score = 0
    var name: String
}

extension Game: TextRepresentable { // Game이 TextRepresentable을 준수하도록 만듭니다
    var textualDescription: String {
        return "게임: \(name), 점수: \(score)"
    }
}
let myGame = Game(score: 100, name: "Space Invaders")
print(myGame.textualDescription) // 게임: Space Invaders, 점수: 100
```

## 9. 오류 처리

Swift는 런타임에 복구 가능한 오류를 발생시키고, 잡고, 전파하고, 조작하기 위한 일급 지원을 제공합니다. 이는 값의 부재를 처리하는 옵셔널과 다릅니다. 오류 처리는 작업의 예기치 않은 결과를 다룹니다.

파이썬은 예외 처리를 위해 `try-except-finally` 블록을 사용합니다.

### 오류 표현 및 발생
Swift에서 오류는 `Error` 프로토콜(빈 프로토콜)을 준수하는 타입의 값으로 표현됩니다. 열거형은 관련된 오류 조건 그룹을 모델링하는 데 종종 적합합니다.

```swift
enum VendingMachineError: Error { // Error 프로토콜 준수
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

// 오류 발생
// throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
```

### 오류 처리
함수가 오류를 발생시키면 프로그램 흐름이 변경됩니다.

#### `throws`를 사용하여 오류 전파
함수는 선언에 `throws` 키워드를 포함하여 오류를 발생시킬 수 있음을 나타냅니다.
`throws` 함수를 호출하는 경우 오류를 처리하거나(`do-catch`, `try?` 또는 `try!` 사용) 현재 함수도 `throws`로 표시하여 오류를 전파해야 합니다.

```swift
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws { // 이 함수는 오류를 발생시킬 수 있습니다
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("\(name) 제공 중")
    }
}
```

#### `do-catch`를 사용하여 오류 처리
`do-catch` 문은 코드 블록을 실행합니다. `do` 절 내에서 오류가 발생하면 `catch` 절과 일치시켜 어떤 절이 오류를 처리할 수 있는지 결정합니다.

```swift
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice", // 오류 발생 원인
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName) // 'try' 키워드 필요
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 100

// 예제 1: 특정 오류 잡기
func attemptToBuySnack(person: String) {
    do {
        try buyFavoriteSnack(person: person, vendingMachine: vendingMachine)
        print("\(person)을(를) 위한 간식을 성공적으로 구매했습니다.")
    } catch VendingMachineError.invalidSelection {
        print("\(person)에 대한 잘못된 선택입니다.")
    } catch VendingMachineError.outOfStock {
        print("\(person)에 대한 재고가 없습니다.")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("\(person)에 대한 자금이 부족합니다. \(coinsNeeded) 코인을 추가로 넣어주세요.")
    } catch { // 일반 catch 블록 (오류는 'error'로 암시적으로 사용 가능)
        print("\(person)에 대한 예기치 않은 오류: \(error).")
    }
}

attemptToBuySnack(person: "Alice") // Alice를 위한 간식을 성공적으로 구매했습니다. (칩 가격 <= 100 가정)
// (칩 구매 후, coinsDeposited가 이제 90이라고 가정)
attemptToBuySnack(person: "Bob")   // Bob에 대한 잘못된 선택입니다. (Licorice 재고 없음)
attemptToBuySnack(person: "Eve")   // Eve를 위한 간식을 성공적으로 구매했습니다. (프레첼 가격 <= 90 가정)

// 예제 2: 오류 전파
// func someFunctionThatCallsThrowingFunction() throws {
//     try vendingMachine.vend(itemNamed: "Candy Bar")
// }
```

#### 오류를 옵셔널 값으로 변환 (`try?`)
`try?`를 사용하여 오류를 옵셔널 값으로 변환하여 처리합니다. `try?` 표현식을 평가하는 동안 오류가 발생하면 표현식의 값은 `nil`이 됩니다.

```swift
// func someThrowingFunction() throws -> Int { /* ... */ }

let x = try? someThrowingFunction() // x는 Int? 타입입니다
// someThrowingFunction이 오류를 발생시키면 x는 nil이 됩니다. 그렇지 않으면 x는 반환된 Int입니다.

// vend 예제:
func fetchData() -> Data? { // 데이터를 반환하거나 nil을 반환할 수 있는 예제 함수
    if let data = try? Data(contentsOf: URL(string: "http://example.com/data.txt")!) {
        return data
    } else {
        print("데이터를 가져올 수 없습니다.")
        return nil
    }
}
```

#### 오류 전파 비활성화 (`try!`)
던지는 함수나 메서드가 런타임에 실제로 오류를 발생시키지 않을 것이라고 확신할 때 `try!`를 사용합니다. 오류가 *발생하면* 런타임 오류(크래시)가 발생합니다. 극도의 주의를 기울여 사용하십시오.

```swift
// let photo = try! loadImage(atPath: "./Resources/JohnAppleseed.jpg")
// 이 코드는 해당 경로에 대해 loadImage가 절대 실패하지 않을 것이라고 가정합니다.
```

#### 정리 작업 지정 (`defer`)
`defer` 문은 실행이 현재 범위를 벗어나기 직전에 코드 블록을 실행합니다 (예: 함수 반환, 오류 발생, 반복문 중단). 리소스 정리에 유용합니다. `defer` 문은 나타난 순서의 역순으로 실행됩니다.

**파이썬 (`finally` 사용):**
```python
# file = None
# try:
#     file = open("myfile.txt", "r")
#     # 파일 처리
# finally:
#     if file:
#         file.close()
#         print("finally에서 파일 닫힘.")
```

**Swift:**
```swift
func processFile(filename: String) throws {
    let file = open(filename, O_RDONLY) // C 스타일 파일 열기
    if file == -1 {
        // throw FileError.couldNotOpen
        print("파일을 열 수 없습니다.")
        return
    }
    defer { // 범위가 종료될 때 실행됨 (반환 또는 오류)
        close(file)
        print("defer에서 파일 닫힘.")
    }

    // 파일 작업...
    // 여기서 오류가 발생하거나 함수가 반환되면 defer 블록이 여전히 실행됩니다.
    print("파일 처리 중...")
    // 작업 시뮬레이션, 오류 발생 가능성
    // if someCondition { throw FileError.readFailed }
}

// try processFile(filename: "example.txt")
```

## 10. 메모리 관리 (ARC)

Swift는 클래스 인스턴스의 메모리를 관리하기 위해 자동 참조 계산(ARC)을 사용합니다. ARC는 해당 인스턴스가 더 이상 필요하지 않을 때 클래스 인스턴스에서 사용한 메모리를 자동으로 해제합니다.
- 일반적으로 메모리 관리에 대해 직접 생각할 필요가 없습니다.
- ARC는 각 클래스 인스턴스를 현재 참조하고 있는 프로퍼티, 상수 및 변수가 몇 개인지 추적하여 작동합니다. 해당 인스턴스에 대한 활성 참조가 하나 이상 존재하는 한 인스턴스를 할당 해제하지 않습니다.
- **강한 참조 순환:** ARC는 때때로 두 클래스 인스턴스가 서로 강한 참조를 유지하여 절대 할당 해제되지 않는 상황(메모리 누수)을 유발할 수 있습니다. Swift는 이러한 순환을 해결하기 위해 `weak` 및 `unowned` 참조를 제공합니다.
    - **`weak` 참조:** 약한 참조는 참조하는 인스턴스에 대한 강한 유지를 하지 않으므로 ARC가 참조된 인스턴스를 할당 해제하는 것을 막지 않습니다. 인스턴스가 할당 해제되면 참조는 `nil`이 됩니다. 따라서 약한 참조는 옵셔널 타입이어야 합니다.
    - **`unowned` 참조:** 약한 참조와 마찬가지로 미소유 참조는 강한 유지를 하지 않습니다. 그러나 미소유 참조는 다른 인스턴스가 동일한 수명 또는 더 긴 수명을 가질 때 사용됩니다. 항상 값을 가질 것으로 가정됩니다. 인스턴스가 할당 해제된 후 미소유 참조에 접근하면 런타임 오류가 발생합니다.

**파이썬 (가비지 컬렉션):**
파이썬은 참조 계산과 순환 가비지 컬렉터의 조합을 사용하여 메모리를 관리합니다. 일반적으로 메모리를 수동으로 관리하지 않습니다.

**Swift (ARC 예제 - 강한 참조 순환):**
```swift
class PersonARC {
    let name: String
    init(name: String) { self.name = name }
    var apartment: ApartmentARC? // 옵셔널, nil일 수 있음
    deinit { print("\(name)이(가) 소멸화 중입니다 (Person)") }
}

class ApartmentARC {
    let unit: String
    init(unit: String) { self.unit = unit }
    // weak var tenant: PersonARC? // 순환을 끊으려면 weak 사용
    var tenant: PersonARC? // 기본적으로 강한 참조
    deinit { print("아파트 \(unit)이(가) 소멸화 중입니다") }
}

var johnArc: PersonARC?
var unit4A: ApartmentARC?

johnArc = PersonARC(name: "John Appleseed")
unit4A = ApartmentARC(unit: "4A")

// 강한 참조 순환 생성:
johnArc!.apartment = unit4A
unit4A!.tenant = johnArc // tenant가 weak가 아니면 순환이 생성됨

// 둘 다 nil로 설정합니다. 순환이 있으면 deinit이 호출되지 않습니다.
johnArc = nil
unit4A = nil
// ApartmentARC의 'tenant'가 'var tenant: PersonARC?'이면 deinit 메시지가 출력되지 않습니다.
// ApartmentARC의 'tenant'가 'weak var tenant: PersonARC?'이면 deinit 메시지가 출력됩니다.
```
위의 순환을 끊으려면 `ApartmentARC`의 `tenant`를 `weak var tenant: PersonARC?`로 선언해야 합니다.

## 11. 다음 단계

- **Apple의 Swift 문서:** 공식 "The Swift Programming Language" 책은 훌륭하고 포괄적인 자료입니다.
- **SwiftUI / UIKit:** Apple 플랫폼용 사용자 인터페이스 구축.
- **서버 사이드 Swift:** Vapor 또는 Kitura와 같은 프레임워크.
- **동시성:** `async/await`, 액터.
- **제네릭:** 유연하고 재사용 가능한 함수 및 타입 작성.
- **패키지 관리:** Swift Package Manager (SPM).
