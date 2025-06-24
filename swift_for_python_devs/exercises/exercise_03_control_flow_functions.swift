// 연습문제 03: 제어 흐름 및 함수

// --- 제어 흐름 ---

// 1. If-Else:
//    섭씨 온도를 받는 `checkTemperature(celsius: Double)` 함수를 작성하세요.
//    - 온도가 0 미만이면 "얼어붙을 것 같아요!"를 출력합니다.
//    - 0 이상 15 미만이면 (0 포함, 15 미포함) "추워요."를 출력합니다.
//    - 15 이상 25 미만이면 (15 포함, 25 미포함) "쾌적해요."를 출력합니다.
//    - 25 이상이면 "따뜻해요!"를 출력합니다.
//    다양한 온도로 함수를 테스트하세요.


// 2. Switch 문:
//    월(예: "January", "February" 등)을 받는 `getSeason(month: String)` 함수를 작성하세요.
//    Switch 문을 사용하여 계절을 반환합니다:
//    - "December", "January", "February": "겨울"
//    - "March", "April", "May": "봄"
//    - "June", "July", "August": "여름"
//    - "September", "October", "November": "가을"
//    - 기본값: "잘못된 월"
//    함수는 String을 반환해야 합니다. 테스트하세요.


// 3. For-In 반복문:
//    a. 좋아하는 숫자 배열(정수 최소 5개)을 만드세요.
//    b. For-in 반복문을 사용하여 배열을 반복하고 각 숫자의 제곱(숫자 * 숫자)을 출력하세요.
//    c. `studentScores = ["Alice": 88, "Bob": 92, "Charlie": 75, "David": 95]` 딕셔너리가 주어졌을 때,
//       for-in 반복문을 사용하여 각 학생의 이름과 점수를 출력하세요.


// 4. While 반복문:
//    `start`부터 1까지 숫자를 출력하고 "발사!"를 출력하는 `countdown(from start: Int)` 함수를 작성하세요.
//    While 반복문을 사용하세요. 예시: countdown(from: 3)은 다음을 출력해야 합니다:
//    3
//    2
//    1
//    발사!


// 5. Guard 문:
//    옵셔널 아이템 이름과 옵셔널 수량을 받는 `processOrder(item: String?, quantity: Int?)` 함수를 작성하세요.
//    `guard` 문을 사용하여 다음을 확인합니다:
//    - `item`이 `nil`이면 "주문 실패: 아이템 이름 누락."을 출력하고 반환합니다.
//    - `quantity`가 `nil`이거나 1보다 작으면 "주문 실패: [아이템 이름]에 대한 잘못된 수량."을 출력하고 반환합니다.
//    모두 유효하면 "주문 처리 중: [아이템 이름] [수량]개."를 출력합니다.
//    다양한 입력(유효, 아이템 누락, 잘못된 수량)으로 테스트하세요.


// --- 함수 ---

// 6. 기본 함수:
//    사각형의 면적을 반환하는 `calculateArea(width: Double, height: Double) -> Double` 함수를 작성하세요.
//    테스트하세요.


// 7. 인자 레이블 및 매개변수 이름:
//    "안녕하세요 [name]님! [city]에서 인사드립니다."와 같은 인사말을 출력하는
//    `greet(person name: String, nicelyFrom city: String)` 함수를 작성하세요.
//    호출은 `greet(person: "Alice", nicelyFrom: "London")`과 같아야 합니다.
//    테스트하세요.


// 8. 인자 레이블 생략:
//    두 정수를 더하는 `add(_ a: Int, _ b: Int) -> Int` 함수를 작성하세요.
//    호출은 `add(5, 3)`과 같아야 합니다.
//    테스트하세요.


// 9. 기본 매개변수 값:
//    "수신자 [recipient]에게 '[message]' 메시지 전송 중"을 출력하는
//    `sendMessage(_ message: String, to recipient: String = "Support")` 함수를 작성하세요.
//    다음과 같이 호출하여 테스트하세요:
//    - 메시지만 있는 경우 ("Support"로 전송되어야 함).
//    - 메시지와 특정 수신자가 모두 있는 경우.


// 10. 가변 매개변수:
//     가변 개수의 정수를 받아 최대 숫자를 반환하는 `findMax(_ numbers: Int...) -> Int?` 함수를 작성하세요.
//     숫자가 제공되지 않으면 `nil`을 반환해야 합니다.
//     여러 숫자, 단일 숫자, 숫자 없음으로 테스트하세요.


// 11. In-Out 매개변수:
//     전달된 숫자를 제곱하고 원본 변수를 수정하는 `squareInPlace(_ number: inout Int)` 함수를 작성하세요.
//     정수 변수를 선언하고, 함수에 전달한 후, 호출 전후의 값을 출력하세요.


// 12. 함수 타입 및 고차 함수:
//     a. 두 개의 String을 받아 String을 반환하는 함수를 나타내는 함수 타입 `StringOperation`을 정의하세요.
//     b. 이 타입과 일치하는 두 함수를 작성하세요:
//        - `concatenateStrings(_ s1: String, _ s2: String) -> String`
//        - `compareAndReturnLonger(_ s1: String, _ s2: String) -> String`
//     c. 두 문자열과 `StringOperation` 함수를 받아 연산을 적용한 결과를 반환하는
//        고차 함수 `processStrings(s1: String, s2: String, using operation: StringOperation) -> String`를 작성하세요.
//     d. 두 연산 함수 모두로 `processStrings`를 테스트하세요.

```
