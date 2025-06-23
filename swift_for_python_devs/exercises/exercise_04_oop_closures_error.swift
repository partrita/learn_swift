// 연습문제 04: OOP (클래스, 구조체, 프로토콜, 익스텐션), 클로저, 오류 처리

// --- 1부: 객체 지향 프로그래밍 ---

// 1. 구조체 대 클래스:
//    a. 프로퍼티: `title`(String), `author`(String), `pageCount`(Int)를 가진 구조체 `Book`을 정의하세요.
//    b. 프로퍼티: `name`(String)과 `[Book]` 타입의 배열 `books`를 가진 클래스 `Library`를 정의하세요.
//    c. `Library`에 책을 `books` 배열에 추가하는 `addBook(_ book: Book)` 메서드를 추가하세요.
//    d. `Library`에 도서관의 각 책 제목과 저자를 출력하는 `listBooks()` 메서드를 추가하세요.
//    e. `Library` 인스턴스와 몇 개의 `Book` 인스턴스를 만드세요. 책들을 도서관에 추가하고 목록을 출력하세요.
//    f. 이 맥락에서 `Book`이 구조체로 적합하고 `Library`가 클래스로 더 적합할 수 있는 이유를 주석으로 설명하세요.


// 2. 상속:
//    a. 0.0을 반환하는 계산 프로퍼티 `area: Double`을 가진 클래스 `Shape`를 정의하세요.
//       또한 "이것은 일반적인 도형입니다."를 출력하는 `describe()` 메서드도 가져야 합니다.
//    b. `Shape`를 상속하는 클래스 `Rectangle`을 정의하세요.
//       - 저장 프로퍼티 `width: Double`과 `height: Double`을 가져야 합니다.
//       - 실제 면적(너비 * 높이)을 계산하여 반환하도록 `area` 프로퍼티를 재정의하세요.
//       - "이것은 너비 [width]와 높이 [height]를 가진 사각형입니다."를 출력하도록 `describe()` 메서드를 재정의하세요.
//       - `init(width: Double, height: Double)` 초기화 구문을 제공하세요.
//    c. `Shape`를 상속하는 클래스 `Circle`을 정의하세요.
//       - 저장 프로퍼티 `radius: Double`을 가져야 합니다.
//       - 실제 면적(π * 반지름^2)을 계산하여 반환하도록 `area` 프로퍼티를 재정의하세요. `Double.pi`를 사용하세요.
//       - "이것은 반지름 [radius]를 가진 원입니다."를 출력하도록 `describe()` 메서드를 재정의하세요.
//       - `init(radius: Double)` 초기화 구문을 제공하세요.
//    d. `Rectangle`과 `Circle`의 인스턴스를 만드세요. 해당 인스턴스의 `describe()` 메서드를 호출하고 `area`를 출력하세요.


// 3. 프로토콜:
//    a. `play()` 메서드 요구 사항과 (초 단위) `duration: Int` 가져오기 가능한 프로퍼티를 가진 `Playable` 프로토콜을 정의하세요.
//    b. `Playable`을 준수하는 구조체 `Song`을 만드세요. 프로퍼티 `title: String`, `artist: String`, `duration: Int`를 가져야 합니다.
//       "지금 [title] by [artist] ([duration]초) 재생 중"을 출력하도록 `play()` 메서드를 구현하세요.
//    c. `Playable`을 준수하는 클래스 `Movie`를 만드세요. 프로퍼티 `title: String`, `director: String`, `duration: Int`를 가져야 합니다.
//       "지금 [title], 감독: [director] ([duration]초) 상영 중"을 출력하도록 `play()` 메서드를 구현하세요.
//    d. `Song` 및 `Movie` 인스턴스를 포함하는 `[Playable]` 타입의 배열 `playlist`를 만드세요.
//    e. `playlist`를 반복하고 각 항목에 대해 `play()`를 호출하세요. 또한 재생 목록의 총 재생 시간을 출력하세요.


// 4. 익스텐션:
//    a. 내장 `Int` 타입을 확장하여 정수가 짝수이면 `true`를, 그렇지 않으면 `false`를 반환하는 계산 프로퍼티 `isEven`(Bool)을 추가하세요.
//    b. `Int`를 확장하여 주어진 클로저를 `self` 횟수만큼 실행하는 `times(_ task: () -> Void)` 메서드를 추가하세요.
//       예시: `3.times { print("안녕하세요") }`는 "안녕하세요"를 세 번 출력해야 합니다.
//    c. 익스텐션을 테스트하세요.


// --- 2부: 클로저 ---

// 5. 기본 클로저 및 `map`:
//    정수 배열 `numbers = [1, 2, 3, 4, 5]`가 주어졌을 때:
//    a. `map` 함수와 클로저를 사용하여 각 숫자가 제곱된 새 배열 `squaredNumbers`를 만드세요.
//    b. `map`과 클로저를 사용하여 각 숫자가 "숫자: X"와 같은 문자열로 변환된 새 배열 `stringifiedNumbers`를 만드세요.
//    두 새 배열을 모두 출력하세요.


// 6. `filter` 및 `reduce`:
//    동일한 `numbers` 배열이 주어졌을 때:
//    a. `filter` 함수와 클로저를 사용하여 `numbers` 배열에서 짝수만 포함하는 새 배열 `evenNumbers`를 만드세요.
//    b. `reduce` 함수와 클로저를 사용하여 `numbers` 배열의 모든 숫자 합계를 계산하세요.
//    `evenNumbers` 배열과 합계를 출력하세요.


// 7. 후행 클로저:
//    비동기 작업을 시뮬레이션하는 (이 연습에서는 단순성을 위해 `DispatchQueue.main.asyncAfter`를 사용하거나 핸들러를 직접 호출)
//    `performAsyncTask(then completionHandler: @escaping (String) -> Void)` 함수를 작성하세요.
//    "작업"이 완료된 후 성공 메시지 문자열과 함께 `completionHandler`를 호출해야 합니다.
//    후행 클로저 구문을 사용하여 `performAsyncTask`를 호출하여 성공 메시지를 출력하세요.


// --- 3부: 오류 처리 ---

// 8. 사용자 정의 오류 및 던지는 함수:
//    a. `Error` 프로토콜을 준수하는 열거형 `OperationError`를 정의하세요.
//       최소 두 가지 경우, 즉 `divisionByZero`와 `negativeInput(message: String)`을 가져야 합니다.
//    b. `performCalculation(a: Double, b: Double, operation: String) throws -> Double` 함수를 작성하세요.
//       - `operation`이 "+"이면 `a + b`를 반환합니다.
//       - `operation`이 "-"이면 `a - b`를 반환합니다.
//       - `operation`이 "*"이면 `a * b`를 반환합니다.
//       - `operation`이 "/"이면 `b`가 0이면 `OperationError.divisionByZero`를 던집니다. 그렇지 않으면 `a / b`를 반환합니다.
//       - `a` 또는 `b`가 음수이고 연산이 이에 민감한 경우 (예: 가상의 "sqrt_sum" 연산),
//         `OperationError.negativeInput(message: "이 연산에는 음수를 처리할 수 없습니다")`를 던집니다.
//         (단순성을 위해 이 연습에서는 "/"만 `b`가 0인 경우에 민감하다고 가정합니다. 원한다면 더 많은 논리를 추가할 수 있습니다.)
//       - 다른 모든 연산 문자열의 경우 메시지를 출력하고 0을 반환하거나 다른 오류를 던집니다.


// 9. Do-Catch 및 `try?`:
//    a. `do-catch` 블록 내에서 `performCalculation`을 여러 번 호출하여 다양한 오류 처리를 시연하세요:
//       - 성공적인 나눗셈.
//       - 0으로 나누기.
//       - (구현된 경우 선택 사항) 오류를 던지는 음수 입력 연산.
//       - 알 수 없는 연산.
//       `catch` 블록에서 오류 유형에 따라 설명적인 메시지를 출력하세요.
//    b. 오류를 발생시킬 수 있는 경우에 대해 `performCalculation`을 호출하되, `try?`를 사용하여 옵셔널 결과를 얻으세요.
//       결과 또는 `nil`인 경우 메시지를 출력하세요.

```
