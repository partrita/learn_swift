// 연습문제 04 해답: OOP (클래스, 구조체, 프로토콜, 익스텐션), 클로저, 오류 처리

import Foundation // Double.pi 및 DispatchQueue 사용

// --- 1부: 객체 지향 프로그래밍 ---

// 1. 구조체 대 클래스:
print("--- 1. 구조체 대 클래스 ---") // 문자열 리터럴 번역
//    a. 프로퍼티: `title`(String), `author`(String), `pageCount`(Int)를 가진 구조체 `Book`을 정의하세요.
struct Book {
    var title: String
    var author: String
    var pageCount: Int
}

//    b. 프로퍼티: `name`(String)과 `[Book]` 타입의 배열 `books`를 가진 클래스 `Library`를 정의하세요.
class Library {
    var name: String
    var books: [Book] = [] // 빈 배열로 초기화

    init(name: String) {
        self.name = name
    }

//    c. `Library`에 책을 `books` 배열에 추가하는 `addBook(_ book: Book)` 메서드를 추가하세요.
    func addBook(_ book: Book) {
        books.append(book)
        print("'\(book.title)'이(가) \(name)에 추가되었습니다.") // 문자열 리터럴 번역
    }

//    d. `Library`에 도서관의 각 책 제목과 저자를 출력하는 `listBooks()` 메서드를 추가하세요.
    func listBooks() {
        print("\n\(name)의 도서 목록:") // 문자열 리터럴 번역
        if books.isEmpty {
            print("도서관이 비어 있습니다.") // 문자열 리터럴 번역
            return
        }
        for book in books {
            print("- '\(book.title)' 저자: \(book.author) (\(book.pageCount) 페이지)") // 문자열 리터럴 번역
        }
    }
}

//    e. `Library` 인스턴스와 몇 개의 `Book` 인스턴스를 만드세요. 책들을 도서관에 추가하고 목록을 출력하세요.
let myLibrary = Library(name: "시립 중앙 도서관") // 문자열 리터럴 번역
let book1 = Book(title: "Swift 프로그래밍 언어", author: "Apple Inc.", pageCount: 500) // 문자열 리터럴 번역
let book2 = Book(title: "컴퓨터 프로그램의 구조와 해석", author: "Abelson & Sussman", pageCount: 650) // 문자열 리터럴 번역
let book3 = Book(title: "거의 모든 것의 짧은 역사", author: "빌 브라이슨", pageCount: 544) // 문자열 리터럴 번역

myLibrary.addBook(book1)
myLibrary.addBook(book2)
myLibrary.addBook(book3)
myLibrary.listBooks()

//    f. 이 맥락에서 `Book`이 구조체로 적합하고 `Library`가 클래스로 더 적합할 수 있는 이유를 주석으로 설명하세요.
// `Book`은 다음과 같은 이유로 구조체로 적합합니다:
//    - 비교적 간단한 데이터 컨테이너입니다.
//    - 책을 전달하거나 할당할 때 종종 별개의 복사본(값 의미론)을 원합니다.
//      예를 들어, 시스템에 책(정보 복사본)을 대여하는 경우 해당 복사본 변경 사항이 도서관의 원본에 영향을 미치지 않아야 합니다.
//    - 참조로 관리해야 하는 복잡한 ID나 라이프사이클을 갖지 않습니다.
//
// `Library`는 다음과 같은 이유로 클래스로 더 적합합니다:
//    - 고유한 엔티티(특정 도서관)를 나타냅니다. 애플리케이션의 여러 부분이 *동일한* 도서관과
//      상호 작용해야 하는 경우 모두 단일 라이브러리 인스턴스에 대한 참조를 보유해야 합니다.
//    - 한 참조를 통해 도서관에 적용된 변경 사항(예: 책 추가)은 다른 모든 참조에 표시되어야 합니다.
//    - 시간이 지남에 따라 수정되는 상태(책 모음)를 가지며 이러한 수정 사항은 공유되어야 합니다.
//    - 실제 애플리케이션에서는 더 복잡한 라이프사이클을 갖거나 소멸화 로직이 필요할 수 있습니다.


// 2. 상속:
print("\n--- 2. 상속 ---") // 문자열 리터럴 번역
//    a. 0.0을 반환하는 계산 프로퍼티 `area: Double`을 가진 클래스 `Shape`를 정의하세요.
//       또한 "이것은 일반적인 도형입니다."를 출력하는 `describe()` 메서드도 가져야 합니다.
class Shape {
    var area: Double {
        return 0.0 // 일반적인 도형의 자리 표시자
    }

    func describe() {
        print("이것은 일반적인 도형입니다.") // 문자열 리터럴 번역
    }

    init() {
        // print("Shape 초기화됨") // 선택 사항: 추적용
    }
}

//    b. `Shape`를 상속하는 클래스 `Rectangle`을 정의하세요.
//       - 저장 프로퍼티 `width: Double`과 `height: Double`을 가져야 합니다.
//       - 실제 면적(너비 * 높이)을 계산하여 반환하도록 `area` 프로퍼티를 재정의하세요.
//       - "이것은 너비 [width]와 높이 [height]를 가진 사각형입니다."를 출력하도록 `describe()` 메서드를 재정의하세요.
//       - `init(width: Double, height: Double)` 초기화 구문을 제공하세요.
class Rectangle: Shape {
    var width: Double
    var height: Double

    override var area: Double {
        return width * height
    }

    override func describe() {
        print("이것은 너비 \(width)와 높이 \(height)를 가진 사각형입니다.") // 문자열 리터럴 번역
    }

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init() // 슈퍼클래스 초기화 구문 호출
        // print("Rectangle 초기화됨")
    }
}

//    c. `Shape`를 상속하는 클래스 `Circle`을 정의하세요.
//       - 저장 프로퍼티 `radius: Double`을 가져야 합니다.
//       - 실제 면적(π * 반지름^2)을 계산하여 반환하도록 `area` 프로퍼티를 재정의하세요. `Double.pi`를 사용하세요.
//       - "이것은 반지름 [radius]를 가진 원입니다."를 출력하도록 `describe()` 메서드를 재정의하세요.
//       - `init(radius: Double)` 초기화 구문을 제공하세요.
class Circle: Shape {
    var radius: Double

    override var area: Double {
        return Double.pi * radius * radius
    }

    override func describe() {
        print("이것은 반지름 \(radius)를 가진 원입니다.") // 문자열 리터럴 번역
    }

    init(radius: Double) {
        self.radius = radius
        super.init()
        // print("Circle 초기화됨")
    }
}

//    d. `Rectangle`과 `Circle`의 인스턴스를 만드세요. 해당 인스턴스의 `describe()` 메서드를 호출하고 `area`를 출력하세요.
let myRectangle = Rectangle(width: 10.0, height: 5.0)
myRectangle.describe()
print("사각형 면적: \(myRectangle.area)") // 문자열 리터럴 번역

let myCircle = Circle(radius: 3.0)
myCircle.describe()
print("원 면적: \(myCircle.area)") // 문자열 리터럴 번역


// 3. 프로토콜:
print("\n--- 3. 프로토콜 ---") // 문자열 리터럴 번역
//    a. `play()` 메서드 요구 사항과 (초 단위) `duration: Int` 가져오기 가능한 프로퍼티를 가진 `Playable` 프로토콜을 정의하세요.
protocol Playable {
    var duration: Int { get }
    func play()
}

//    b. `Playable`을 준수하는 구조체 `Song`을 만드세요. 프로퍼티 `title: String`, `artist: String`, `duration: Int`를 가져야 합니다.
//       "지금 [title] by [artist] ([duration]초) 재생 중"을 출력하도록 `play()` 메서드를 구현하세요.
struct Song: Playable {
    var title: String
    var artist: String
    var duration: Int // `duration` 요구 사항 준수

    func play() { // `play()` 요구 사항 준수
        print("지금 '\(title)' by \(artist) (\(duration)초) 재생 중입니다.") // 문자열 리터럴 번역
    }
}

//    c. `Playable`을 준수하는 클래스 `Movie`를 만드세요. 프로퍼티 `title: String`, `director: String`, `duration: Int`를 가져야 합니다.
//       "지금 [title], 감독: [director] ([duration]초) 상영 중"을 출력하도록 `play()` 메서드를 구현하세요.
class Movie: Playable {
    var title: String
    var director: String
    var duration: Int

    init(title: String, director: String, duration: Int) {
        self.title = title
        self.director = director
        self.duration = duration
    }

    func play() {
        print("지금 '\(title)', 감독: \(director) (\(duration)초) 상영 중입니다.") // 문자열 리터럴 번역
    }
}

//    d. `Song` 및 `Movie` 인스턴스를 포함하는 `[Playable]` 타입의 배열 `playlist`를 만드세요.
let song1 = Song(title: "보헤미안 랩소디", artist: "퀸", duration: 354) // 문자열 리터럴 번역
let movie1 = Movie(title: "인셉션", director: "크리스토퍼 놀란", duration: 8880) // 2시간 28분 (문자열 리터럴 번역)
let song2 = Song(title: "Imagine", artist: "존 레논", duration: 183) // 문자열 리터럴 번역

let playlist: [Playable] = [song1, movie1, song2]

//    e. `playlist`를 반복하고 각 항목에 대해 `play()`를 호출하세요. 또한 재생 목록의 총 재생 시간을 출력하세요.
print("e. 재생 목록 재생:") // 문자열 리터럴 번역
var totalDuration = 0
for item in playlist {
    item.play()
    totalDuration += item.duration
}
print("총 재생 목록 시간: \(totalDuration)초.") // 문자열 리터럴 번역


// 4. 익스텐션:
print("\n--- 4. 익스텐션 ---") // 문자열 리터럴 번역
//    a. 내장 `Int` 타입을 확장하여 정수가 짝수이면 `true`를, 그렇지 않으면 `false`를 반환하는 계산 프로퍼티 `isEven`(Bool)을 추가하세요.
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

//    b. `Int`를 확장하여 주어진 클로저를 `self` 횟수만큼 실행하는 `times(_ task: () -> Void)` 메서드를 추가하세요.
//       예시: `3.times { print("안녕하세요") }`는 "안녕하세요"를 세 번 출력해야 합니다.
extension Int {
    func times(_ task: () -> Void) {
        if self > 0 { // 양수 횟수 반복 보장
            for _ in 0..<self {
                task()
            }
        }
    }
}

//    c. 익스텐션을 테스트하세요.
let num1 = 4
let num2 = 7
print("c. \(num1)은(는) 짝수입니까? \(num1.isEven)") // true (문자열 리터럴 번역)
print("c. \(num2)은(는) 짝수입니까? \(num2.isEven)") // false (문자열 리터럴 번역)

print("c. 작업 3회 반복:") // 문자열 리터럴 번역
3.times {
    print("   Int 익스텐션에서 안녕하세요!") // 문자열 리터럴 번역
}
print("c. 작업 0회 반복 (아무것도 하지 않아야 함):") // 문자열 리터럴 번역
0.times {
    print("   이것은 출력되지 않아야 합니다.") // 문자열 리터럴 번역
}


// --- 2부: 클로저 ---
print("\n--- 5. 클로저 및 map ---") // 문자열 리터럴 번역
// 5. 기본 클로저 및 `map`:
//    정수 배열 `numbers = [1, 2, 3, 4, 5]`가 주어졌을 때:
let numbers = [1, 2, 3, 4, 5]
print("원본 숫자: \(numbers)") // 문자열 리터럴 번역
//    a. `map` 함수와 클로저를 사용하여 각 숫자가 제곱된 새 배열 `squaredNumbers`를 만드세요.
let squaredNumbers = numbers.map { number in number * number }
// 더 짧게: let squaredNumbers = numbers.map { $0 * $0 }
print("a. 제곱된 숫자: \(squaredNumbers)") // 문자열 리터럴 번역

//    b. `map`과 클로저를 사용하여 각 숫자가 "숫자: X"와 같은 문자열로 변환된 새 배열 `stringifiedNumbers`를 만드세요.
let stringifiedNumbers = numbers.map { number -> String in
    return "숫자: \(number)" // 문자열 리터럴 번역
}
// 더 짧게: let stringifiedNumbers = numbers.map { "숫자: \($0)" }
print("b. 문자열로 변환된 숫자: \(stringifiedNumbers)") // 문자열 리터럴 번역


print("\n--- 6. filter 및 reduce ---") // 문자열 리터럴 번역
// 6. `filter` 및 `reduce`:
//    동일한 `numbers` 배열이 주어졌을 때:
//    a. `filter` 함수와 클로저를 사용하여 `numbers` 배열에서 짝수만 포함하는 새 배열 `evenNumbers`를 만드세요.
let evenNumbers = numbers.filter { number in number % 2 == 0 }
// 더 짧게: let evenNumbers = numbers.filter { $0 % 2 == 0 }
print("a. 짝수: \(evenNumbers)") // 문자열 리터럴 번역

//    b. `reduce` 함수와 클로저를 사용하여 `numbers` 배열의 모든 숫자 합계를 계산하세요.
let sumOfNumbers = numbers.reduce(0) { accumulator, currentElement in
    return accumulator + currentElement
}
// 더 짧게: let sumOfNumbers = numbers.reduce(0, +)
// `0`은 초기 결과입니다. `+`는 클로저 타입과 일치하는 연산자 함수입니다.
print("b. 숫자 합계: \(sumOfNumbers)") // 문자열 리터럴 번역


print("\n--- 7. 후행 클로저 ---") // 문자열 리터럴 번역
// 7. 후행 클로저:
//    비동기 작업을 시뮬레이션하는 (이 연습에서는 단순성을 위해 `DispatchQueue.main.asyncAfter`를 사용하거나 핸들러를 직접 호출)
//    `performAsyncTask(then completionHandler: @escaping (String) -> Void)` 함수를 작성하세요.
//    "작업"이 완료된 후 성공 메시지 문자열과 함께 `completionHandler`를 호출해야 합니다.
//    후행 클로저 구문을 사용하여 `performAsyncTask`를 호출하여 성공 메시지를 출력하세요.
func performAsyncTask(then completionHandler: @escaping (String) -> Void) {
    print("비동기 작업 시작 중...") // 문자열 리터럴 번역
    // 지연 시뮬레이션
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // 시뮬레이션을 위한 짧은 지연
        print("비동기 작업 완료됨.") // 문자열 리터럴 번역
        completionHandler("작업이 성공적으로 완료되었습니다!") // 문자열 리터럴 번역
    }
}

// 빠르게 종료되는 명령줄 도구나 플레이그라운드에서 이를 테스트하려면
// 프로그램을 계속 실행하거나 직접 호출해야 할 수 있습니다.
// 이 연습에서는 비동기가 까다로운 경우 데모를 위해 직접 호출하는 것이 좋습니다.
// 이 컨텍스트에서 출력을 단순화하기 위해 직접 호출 버전을 사용하겠습니다.
func performTaskDirectly(then completionHandler: (String) -> Void) {
    print("직접 작업 시작 중...") // 문자열 리터럴 번역
    // 작업 시뮬레이션
    print("직접 작업 완료됨.") // 문자열 리터럴 번역
    completionHandler("직접 작업이 성공적으로 완료되었습니다!") // 문자열 리터럴 번역
}

performTaskDirectly { resultMessage in // 후행 클로저 구문
    print("완료 핸들러: \(resultMessage)") // 문자열 리터럴 번역
}
// 플레이그라운드에서 DispatchQueue 버전을 사용하는 경우 "무기한 실행 필요"가 켜져 있는지 확인하세요.
// 또는 명령줄 앱의 경우 대기하려면 RunLoop 또는 다른 메커니즘이 필요할 수 있습니다.


// --- 3부: 오류 처리 ---
print("\n--- 8. 사용자 정의 오류 및 던지는 함수 ---") // 문자열 리터럴 번역
// 8. 사용자 정의 오류 및 던지는 함수:
//    a. `Error` 프로토콜을 준수하는 열거형 `OperationError`를 정의하세요.
//       최소 두 가지 경우, 즉 `divisionByZero`와 `negativeInput(message: String)`을 가져야 합니다.
enum OperationError: Error {
    case divisionByZero // 0으로 나누기
    case negativeInput(message: String) // 음수 입력
    case unknownOperation(operation: String) // 알 수 없는 연산
}

//    b. `performCalculation(a: Double, b: Double, operation: String) throws -> Double` 함수를 작성하세요.
func performCalculation(a: Double, b: Double, operation: String) throws -> Double {
    print("계산 수행 중: \(a) \(operation) \(b)") // 문자열 리터럴 번역
    switch operation {
    case "+":
        return a + b
    case "-":
        return a - b
    case "*":
        return a * b
    case "/":
        if b == 0 {
            throw OperationError.divisionByZero
        }
        // negativeInput 확인 예시, '/'에 대해 프롬프트에서 엄격하게 요구되지는 않음
        if a < 0 || b < 0 {
             // 이 예시에서는 나눗셈이 음수 입력을 허용하지 않는다고 가정합니다.
             // throw OperationError.negativeInput(message: "나눗셈 인수는 음수가 아니어야 합니다.") // 문자열 리터럴 번역
        }
        return a / b
    // 음수 입력에 민감할 수 있는 사용자 정의 연산 예시
    case "sqrt_sum_positive_only": // 양수만 제곱근 합산
        if a < 0 || b < 0 {
            throw OperationError.negativeInput(message: "sqrt_sum_positive_only의 입력은 음수가 아니어야 합니다.") // 문자열 리터럴 번역
        }
        return (a+b).squareRoot() // Double에 squareRoot()가 있거나 Foundation.sqrt() 사용 가정
    default:
        throw OperationError.unknownOperation(operation: operation)
    }
}


print("\n--- 9. Do-Catch 및 try? ---") // 문자열 리터럴 번역
// 9. Do-Catch 및 `try?`:
//    a. `do-catch` 블록 내에서 `performCalculation`을 여러 번 호출하여 다양한 오류 처리를 시연하세요:
print("a. Do-Catch 예제:") // 문자열 리터럴 번역
//       - 성공적인 나눗셈.
do {
    let result = try performCalculation(a: 10.0, b: 2.0, operation: "/")
    print("   성공적인 나눗셈: 10.0 / 2.0 = \(result)") // 문자열 리터럴 번역
} catch {
    print("   10.0 / 2.0 중 오류: \(error)") // 발생해서는 안 됨 (문자열 리터럴 번역)
}

//       - 0으로 나누기.
do {
    let result = try performCalculation(a: 5.0, b: 0.0, operation: "/")
    print("   0으로 나누기 결과 (출력되지 않아야 함): \(result)") // 문자열 리터럴 번역
} catch OperationError.divisionByZero {
    print("   오류 포착: 0으로 나누는 것은 허용되지 않습니다.") // 문자열 리터럴 번역
} catch let OperationError.negativeInput(message) {
    print("   오류 포착: 음수 입력 - \(message)") // 문자열 리터럴 번역
} catch OperationError.unknownOperation(let op) {
    print("   오류 포착: 알 수 없는 연산 '\(op)'.") // 문자열 리터럴 번역
} catch {
    print("   예기치 않은 오류 포착: \(error)") // 문자열 리터럴 번역
}

//       - (구현된 경우 선택 사항) 오류를 던지는 음수 입력 연산.
do {
    let result = try performCalculation(a: -4.0, b: 2.0, operation: "sqrt_sum_positive_only")
    print("   sqrt_sum_positive_only 결과 (출력되지 않아야 함): \(result)") // 문자열 리터럴 번역
} catch OperationError.divisionByZero {
    print("   오류 포착: 0으로 나누는 것은 허용되지 않습니다.") // 문자열 리터럴 번역
} catch let OperationError.negativeInput(message) {
    print("   오류 포착: 음수 입력 - \(message)") // 문자열 리터럴 번역
} catch OperationError.unknownOperation(let op) {
    print("   오류 포착: 알 수 없는 연산 '\(op)'.") // 문자열 리터럴 번역
} catch {
    print("   예기치 않은 오류 포착: \(error)") // 문자열 리터럴 번역
}

//       - 알 수 없는 연산.
do {
    let result = try performCalculation(a: 10.0, b: 2.0, operation: "%")
    print("   알 수 없는 연산 결과 (출력되지 않아야 함): \(result)") // 문자열 리터럴 번역
} catch OperationError.divisionByZero {
    print("   오류 포착: 0으로 나누는 것은 허용되지 않습니다.") // 문자열 리터럴 번역
} catch let OperationError.negativeInput(message) {
    print("   오류 포착: 음수 입력 - \(message)") // 문자열 리터럴 번역
} catch OperationError.unknownOperation(let op) {
    print("   오류 포착: 알 수 없는 연산 '\(op)'.") // 문자열 리터럴 번역
} catch {
    print("   예기치 않은 오류 포착: \(error)") // 문자열 리터럴 번역
}


//    b. 오류를 발생시킬 수 있는 경우에 대해 `performCalculation`을 호출하되, `try?`를 사용하여 옵셔널 결과를 얻으세요.
//       결과 또는 `nil`인 경우 메시지를 출력하세요.
print("\nb. try? 예제:") // 문자열 리터럴 번역
let resultTryOptional = try? performCalculation(a: 8.0, b: 0.0, operation: "/")
if let result = resultTryOptional {
    print("   try? 결과: \(result)") // 문자열 리터럴 번역
} else {
    print("   계산 실패 (try?가 nil 반환). 오류: 0으로 나누기 (예상됨).") // 문자열 리터럴 번역
}

let successfulResultTryOptional = try? performCalculation(a: 9.0, b: 3.0, operation: "/")
if let result = successfulResultTryOptional {
    print("   try? 결과 (성공): \(result)") // 문자열 리터럴 번역
} else {
    print("   계산 실패 (try?가 nil 반환, 9/3에 대해 예기치 않음).") // 문자열 리터럴 번역
}

// performAsyncTask를 긴 대기 시간이나 복잡한 설정 없이 테스트 가능하게 하려면:
// 명령줄에서 실행 중이고 DispatchQueue에 비해 너무 빨리 종료되는 경우:
// RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.5)) // 잠시 동안 활성 상태 유지
// 그러나 자동화된 테스트나 간단한 스크립트 실행의 경우 직접 호출이 더 쉽습니다.
```
