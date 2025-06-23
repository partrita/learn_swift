// 파이썬 개발자를 위한 Swift - 예제 09: OOP (상속, 프로토콜, 익스텐션)

// --- 상속 ---
// 클래스는 다른 클래스(슈퍼클래스)로부터 메서드, 프로퍼티 및 기타 특성을 상속받을 수 있습니다.
// 상속받는 클래스는 서브클래스입니다. 구조체는 상속을 지원하지 않습니다.
// 파이썬: class Subclass(Superclass):

print("--- 상속 ---") // 문자열 리터럴 번역
class Vehicle {
    var currentSpeed = 0.0
    var description: String { // 읽기 전용 계산 프로퍼티
        return "시속 \(currentSpeed)마일로 이동 중" // 문자열 리터럴 번역
    }

    func makeNoise() {
        // 아무것도 하지 않음 - 임의의 차량이 반드시 소음을 내는 것은 아닙니다.
        print("차량: 일반 소음 (슈퍼클래스)") // 문자열 리터럴 번역
    }

    init() {
        print("차량 (슈퍼클래스) 초기화됨.") // 문자열 리터럴 번역
    }

    // final 메서드/프로퍼티/서브스크립트는 재정의할 수 없습니다. `final class`는 서브클래싱할 수 없습니다.
    final func reportSpeed() {
        print("현재 속도 보고됨: \(currentSpeed) mph") // 문자열 리터럴 번역
    }
}

class Bicycle: Vehicle { // Bicycle이 Vehicle을 상속합니다.
    var hasBasket = false // Bicycle에 특정한 새 저장 프로퍼티

    // 서브클래스는 기본적으로 슈퍼클래스 초기화 구문을 상속하지 않습니다 (몇 가지 예외 제외).
    // 자체적으로 제공하거나 안전한 경우 상속된 것에 의존해야 합니다.
    // 서브클래스가 지정된 초기화 구문을 정의하지 않으면 특정 조건이 충족될 경우
    // 모든 슈퍼클래스 지정 초기화 구문을 자동으로 상속합니다.
    // (기본적으로 모든 새 프로퍼티에 기본값이 있는 경우). 여기서는 hasBasket에 기본값이 없습니다.

    override init() { // 슈퍼클래스에 사용/변경하려는 일치하는 init이 있으면 재정의해야 합니다.
        // 서브클래스 프로퍼티 먼저 초기화 (여기서 필요한 경우)
        super.init() // 슈퍼클래스 초기화 구문 호출
        print("자전거 (서브클래스) 초기화됨.") // 문자열 리터럴 번역
    }

    init(hasBasket: Bool) {
        self.hasBasket = hasBasket
        super.init() // 지정된 초기화 구문에서 항상 super.init()을 호출합니다 (슈퍼클래스에 있는 경우).
        print("자전거 (서브클래스) 바구니 옵션으로 초기화됨.") // 문자열 리터럴 번역
    }


    // 메서드 재정의 (`override` 키워드 사용 필수)
    override func makeNoise() {
        print("자전거: 따르릉 따르릉!") // 문자열 리터럴 번역
    }

    // 슈퍼클래스의 final 메서드는 재정의할 수 없습니다.
    // override func reportSpeed() { ... } // 오류: 인스턴스 메서드가 'final' 인스턴스 메서드를 재정의합니다.
}

let someVehicle = Vehicle()
print("일부 차량: \(someVehicle.description)") // 문자열 리터럴 번역
someVehicle.makeNoise()

let myBicycle = Bicycle(hasBasket: true)
myBicycle.currentSpeed = 15.0
print("내 자전거: \(myBicycle.description)") // 상속된 `description` 접근 (문자열 리터럴 번역)
print("내 자전거에 바구니 있음: \(myBicycle.hasBasket)") // 문자열 리터럴 번역
myBicycle.makeNoise() // 재정의된 `makeNoise` 호출
myBicycle.reportSpeed() // 슈퍼클래스의 final 메서드 호출

// 슈퍼클래스 멤버 접근 (`super.`)
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0

    override init() { // Bicycle의 init() 재정의
        super.init(hasBasket: true) // 슈퍼클래스 (Bicycle) 초기화 구문 호출
        self.currentNumberOfPassengers = 1 // 탠덤의 기본값
        print("탠덤 (Bicycle의 서브클래스) 초기화됨.") // 문자열 리터럴 번역
    }

    init(passengers: Int, basket: Bool) {
        self.currentNumberOfPassengers = passengers
        super.init(hasBasket: basket) // 슈퍼클래스 (Bicycle) 초기화 구문 호출
        print("탠덤 (Bicycle의 서브클래스) 승객/바구니 옵션으로 초기화됨.") // 문자열 리터럴 번역
    }

    override func makeNoise() {
        super.makeNoise() // 슈퍼클래스 (Bicycle의) makeNoise 호출
        print("탠덤: ...그리고 부드러운 휙 소리.") // 문자열 리터럴 번역
    }

    override var description: String { // 계산 프로퍼티 재정의
        return super.description + ", \(currentNumberOfPassengers)명의 승객과 함께" // 문자열 리터럴 번역
    }
}

let myTandem = Tandem(passengers: 2, basket: false)
myTandem.currentSpeed = 12.0
print("내 탠덤: \(myTandem.description)") // 문자열 리터럴 번역
myTandem.makeNoise()


// --- 프로토콜 (파이썬의 인터페이스 또는 추상 기본 클래스와 유사) ---
// 메서드, 프로퍼티 및 기타 요구 사항의 청사진을 정의합니다.
// 그런 다음 클래스, 구조체 또는 열거형이 프로토콜을 *준수*할 수 있습니다.
// 파이썬: from abc import ABC, abstractmethod
print("\n--- 프로토콜 ---") // 문자열 리터럴 번역

protocol Named { // 프로토콜 이름은 일반적으로 -able, -ible 또는 -ing로 끝나거나 역할을 설명합니다.
    var name: String { get } // 가져올 수 있는 프로퍼티 요구 사항
    // 설정 가능한 프로퍼티의 경우: { get set }
    func identify() -> String // 메서드 요구 사항
}

protocol Aged {
    var age: Int { get set }
}

// 프로토콜 준수
struct Person: Named, Aged { // 여러 프로토콜을 준수할 수 있습니다.
    var name: String // Named의 `name` 프로퍼티 구현
    var age: Int     // Aged의 `age` 프로퍼티 구현

    func identify() -> String { // Named의 `identify` 메서드 구현
        return "저는 \(name)이고, 나이는 \(age)살입니다." // 문자열 리터럴 번역
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Dog: Named { // 클래스도 준수할 수 있습니다.
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }

    func identify() -> String {
        return "저는 \(breed) 종의 \(name)입니다." // 문자열 리터럴 번역
    }
}

var john = Person(name: "홍길동", age: 30) // 문자열 리터럴 번역
let buddy = Dog(name: "버디", breed: "골든 리트리버") // 문자열 리터럴 번역

print(john.identify())
print(buddy.identify())

john.age += 1 // `age`는 설정 가능합니다.

// 프로토콜을 타입으로 사용 (다형성)
var somethingNamed: Named // Named를 준수하는 모든 인스턴스를 담을 수 있습니다.
somethingNamed = john
print("이름 있는 것 (사람): \(somethingNamed.identify())") // 문자열 리터럴 번역
// print(somethingNamed.age) // 오류: 'somethingNamed'는 'Named' 타입이며, 'age'가 없습니다.

somethingNamed = buddy
print("이름 있는 것 (개): \(somethingNamed.identify())") // 문자열 리터럴 번역

// 프로토콜 타입의 컬렉션
let identifiableThings: [Named] = [john, buddy]
for thing in identifiableThings {
    print("컬렉션에서: \(thing.identify())") // 문자열 리터럴 번역
    if let person = thing as? Person { // 특정 타입을 확인하기 위한 타입 캐스팅
        print("   (이것은 사람이며, 나이: \(person.age))") // 문자열 리터럴 번역
    }
}

// 프로토콜 요구 사항에는 타입 프로퍼티 및 타입 메서드(정적)가 포함될 수 있습니다.
protocol Togglable {
    mutating func toggle() // 값 타입(구조체, 열거형)의 경우 `mutating`
    static var description: String { get }
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off: self = .on
        case .on:  self = .off
        }
        print("스위치가 \(self)(으)로 전환됨.") // 문자열 리터럴 번역
    }
    static var description: String {
        return "켜고 끌 수 있는 스위치입니다." // 문자열 리터럴 번역
    }
}
print(OnOffSwitch.description)
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle() // on
lightSwitch.toggle() // off

// 프로토콜 상속
// 프로토콜은 하나 이상의 다른 프로토콜로부터 상속받을 수 있습니다.
protocol PrettyTextRepresentable: CustomStringConvertible, CustomDebugStringConvertible {
    var prettyDescription: String { get }
}
// CustomStringConvertible은 `description: String`을 요구합니다.
// CustomDebugStringConvertible은 `debugDescription: String`을 요구합니다.

struct GameObject: PrettyTextRepresentable {
    var id: Int
    var name: String

    var description: String { // CustomStringConvertible용
        return "게임 오브젝트 ID: \(id)" // 문자열 리터럴 번역
    }
    var debugDescription: String { // CustomDebugStringConvertible용
        return "GameObject(id: \(id), name: \"\(name)\")"
    }
    var prettyDescription: String { // PrettyTextRepresentable용
        return "✨ \(name) (ID: \(id)) ✨"
    }
}
let playerObject = GameObject(id: 1, name: "영웅") // 문자열 리터럴 번역
print(playerObject) // CustomStringConvertible을 통해 `description` 사용
print("디버그: \(String(reflecting: playerObject))") // `debugDescription` 사용 (문자열 리터럴 번역)
print(playerObject.prettyDescription)


// --- 익스텐션 ---
// 기존 클래스, 구조체, 열거형 또는 프로토콜 타입에 새로운 기능을 추가합니다.
// 여기에는 계산 프로퍼티, 메서드, 초기화 구문, 서브스크립트 추가 및
// 원래 타입 정의 *후에* 프로토콜 준수가 포함됩니다.
// 파이썬의 몽키 패칭과 유사하지만 더 구조적이고 타입 안전합니다.
print("\n--- 익스텐션 ---") // 문자열 리터럴 번역

// 내장 Double 타입 확장
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }

    func squared() -> Double {
        return self * self
    }
}
let oneMeter = 1.0
print("1미터는 cm로: \(oneMeter.cm)") // 100.0 (문자열 리터럴 번역)
let distanceKm = 2.5.km
print("2.5km는 \(distanceKm)미터입니다.") // 2500.0 (문자열 리터럴 번역)
print("5.0의 제곱은 \(5.0.squared())입니다.") // 25.0 (문자열 리터럴 번역)

// 익스텐션을 통한 프로토콜 준수
protocol TextRepresentable {
    var textualDescription: String { get }
}

struct GameScore { // 원본 구조체 정의
    var points: Int
    var level: Int
}
// 나중에 또는 다른 파일에서 GameScore를 확장하여 TextRepresentable을 준수하도록 합니다.
extension GameScore: TextRepresentable {
    var textualDescription: String {
        return "점수: \(points) 레벨: \(level)" // 문자열 리터럴 번역
    }
}
let currentScore = GameScore(points: 1500, level: 3)
print(currentScore.textualDescription) // "점수: 1500 레벨: 3"

// 익스텐션으로 새 초기화 구문 추가
// (구조체가 자동 멤버별 초기화 구문을 유지하고 사용자 정의 구문을 추가하는 데 유용)
struct Size {
    var width = 0.0, height = 0.0
}
extension Size {
    init(squareSide: Double) { // 새 초기화 구문
        self.init(width: squareSide, height: squareSide) // 원본 멤버별/기본 init 호출
        print("크기가 익스텐션을 통해 정사각형으로 초기화됨.") // 문자열 리터럴 번역
    }
}
let defaultSize = Size() // 여전히 작동 (width: 0, height: 0)
let customSize = Size(width: 10, height: 20) // 멤버별 초기화 구문 여전히 작동
let squareSize = Size(squareSide: 5.0) // 익스텐션의 새 초기화 구문
print("정사각형 크기: 너비=\(squareSize.width), 높이=\(squareSize.height)") // 문자열 리터럴 번역

// 익스텐션으로 메서드 추가
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    var isEven: Bool {
        return self % 2 == 0
    }
}
3.repetitions {
    print("Int 익스텐션에서 안녕하세요!") // 문자열 리터럴 번역
}
print("4는 짝수인가? \(4.isEven)") // true (문자열 리터럴 번역)
print("7은 짝수인가? \(7.isEven)") // false (문자열 리터럴 번역)

// 익스텐션 내 중첩 타입
extension Character {
    enum Kind { // 익스텐션을 통해 Character 내에 중첩 열거형 Kind 정의
        case vowel, consonant, other // 모음, 자음, 기타
    }
    var kind: Kind { // 중첩 열거형을 사용하는 계산 프로퍼티
        switch String(self).lowercased() {
        case "a", "e", "i", "o", "u", "ㅏ", "ㅐ", "ㅑ", "ㅓ", "ㅔ", "ㅕ", "ㅗ", "ㅛ", "ㅜ", "ㅠ", "ㅡ", "ㅣ": // 한국어 모음 추가
            return .vowel
        // 자음 케이스는 단순화를 위해 영어 알파벳만 유지. 필요시 한국어 자음 추가 가능.
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            return .consonant
        default:
            return .other
        }
    }
}
let charA: Character = "a"
let charB: Character = "B"
let charNum: Character = "7"
let charKorVowel: Character = "ㅏ"
print("'\(charA)'는 \(charA.kind)입니다.") // vowel (문자열 리터럴 번역)
print("'\(charB)'는 \(charB.kind)입니다.") // consonant (문자열 리터럴 번역)
print("'\(charNum)'는 \(charNum.kind)입니다.") // other (문자열 리터럴 번역)
print("'\(charKorVowel)'는 \(charKorVowel.kind)입니다.") // vowel (문자열 리터럴 번역)
```
