// 파이썬 개발자를 위한 Swift - 예제 08: OOP (메서드 및 초기화)

// --- 인스턴스 메서드 ---
// 클래스, 구조체 또는 열거형의 인스턴스에 속하는 함수입니다.
// 파이썬: 클래스 내에 정의되고 첫 번째 인수로 `self`를 받는 메서드.
print("--- 인스턴스 메서드 ---") // 문자열 리터럴 번역
class Counter {
    var count = 0 // 저장 프로퍼티

    // 인스턴스 메서드
    func increment() {
        count += 1 // `self.count`도 사용할 수 있으며, 여기서는 `self`가 암시적입니다.
    }

    // 매개변수가 있는 인스턴스 메서드
    func increment(by amount: Int) {
        count += amount
    }

    // 재설정하는 인스턴스 메서드
    func reset() {
        count = 0
    }

    // 값을 반환하는 인스턴스 메서드
    func currentCount() -> Int {
        return count
    }
}

let counter = Counter()
print("초기 카운트: \(counter.currentCount())") // 0 (문자열 리터럴 번역)
counter.increment()
print("증가 후 카운트: \(counter.currentCount())") // 1 (문자열 리터럴 번역)
counter.increment(by: 5)
print("5 증가 후 카운트: \(counter.currentCount())") // 6 (문자열 리터럴 번역)
counter.reset()
print("재설정 후 카운트: \(counter.currentCount())") // 0 (문자열 리터럴 번역)


// `self` 프로퍼티
// 모든 타입의 인스턴스에는 `self`라는 암시적 프로퍼티가 있으며, 이는 인스턴스 자체와 정확히 동일합니다.
// 인스턴스 메서드 내에서 현재 인스턴스를 참조하는 데 `self`를 사용합니다.
// 일반적으로 `self`를 명시적으로 작성할 필요는 없습니다. Swift가 추론합니다.
// `self`가 필요한 한 가지 경우는 매개변수 이름과 프로퍼티 이름을 구별하는 것입니다.
struct Point {
    var x = 0.0, y = 0.0

    // 점이 다른 x 좌표의 오른쪽에 있는지 확인하는 메서드
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x // `self.x`는 인스턴스 프로퍼티를, `x`는 매개변수를 참조합니다.
    }

    // 변경 메서드 (구조체 및 열거형과 같은 값 타입용)
    // 메서드가 값 타입의 프로퍼티를 수정하는 경우 `mutating`으로 표시해야 합니다.
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        // self.x += deltaX // 수정하는 한 가지 방법
        // self.y += deltaY
        self = Point(x: self.x + deltaX, y: self.y + deltaY) // 다른 방법: self에 새 인스턴스 할당
    }
}

var somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("이 점은 x == 1.0 선의 오른쪽에 있습니다.") // 문자열 리터럴 번역
}
somePoint.moveBy(x: 2.0, y: -1.0)
print("점이 이동한 위치: (\(somePoint.x), \(somePoint.y))") // 문자열 리터럴 번역


// --- 타입 메서드 (정적 메서드) ---
// 인스턴스가 아닌 타입 자체에서 호출되는 메서드입니다.
// `static` 키워드를 사용합니다. 클래스의 경우 `class`를 사용하여 하위 클래스가 재정의하도록 허용할 수 있습니다.
// 파이썬: `@staticmethod` 또는 `@classmethod`로 데코레이팅된 메서드.
print("\n--- 타입 메서드 ---") // 문자열 리터럴 번역
struct LevelTracker {
    static var highestUnlockedLevel = 1 // 저장 타입 프로퍼티
    var currentLevel = 1               // 저장 인스턴스 프로퍼티

    // 타입 메서드
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
            print("레벨 \(level) 잠금 해제! 현재 최고 레벨: \(highestUnlockedLevel).") // 문자열 리터럴 번역
        } else {
            print("레벨 \(level)은(는) 이미 잠금 해제되었거나 최고 레벨(\(highestUnlockedLevel))보다 낮습니다.") // 문자열 리터럴 번역
        }
    }

    // Bool을 반환하는 타입 메서드
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    // 타입 프로퍼티/메서드를 사용하는 인스턴스 메서드
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) { // 타입 자체에서 타입 메서드 호출
            if level > currentLevel {
                currentLevel = level
                print("플레이어가 레벨 \(currentLevel)(으)로 진급했습니다.") // 문자열 리터럴 번역
                return true
            } else {
                print("플레이어는 이미 레벨 \(level) 또는 그 이상입니다.") // 문자열 리터럴 번역
                return false
            }
        } else {
            print("레벨 \(level)(으)로 진급할 수 없습니다. 잠겨 있습니다. 최고 잠금 해제 레벨: \(LevelTracker.highestUnlockedLevel).") // 문자열 리터럴 번역
            return false
        }
    }
}

LevelTracker.unlock(5) // 타입에서 타입 메서드 호출
LevelTracker.unlock(3) // 이미 잠금 해제되었거나 낮음
print("레벨 4가 잠금 해제되었습니까? \(LevelTracker.isUnlocked(4))") // true (문자열 리터럴 번역)
print("레벨 6이 잠금 해제되었습니까? \(LevelTracker.isUnlocked(6))") // false (문자열 리터럴 번역)

var player1 = LevelTracker() // currentLevel = 1, highestUnlockedLevel = 5
player1.advance(to: 3) // 진급
player1.advance(to: 6) // 실패, 레벨 6 잠김

class SomeGameClass {
    static var gameName = "일반 게임" // 문자열 리터럴 번역

    static func describeGame() {
        print("이것은 \(gameName)입니다.") // 문자열 리터럴 번역
    }

    // `class func`는 하위 클래스에서 재정의할 수 있습니다.
    class func getGameRules() -> String {
        return "일반 게임에 대한 특정 규칙이 없습니다." // 문자열 리터럴 번역
    }
}
SomeGameClass.describeGame()
print(SomeGameClass.getGameRules())


// --- 초기화 (`init`) ---
// 클래스, 구조체 또는 열거형의 인스턴스를 사용하기 위해 준비하는 과정입니다.
// 저장 프로퍼티에 초기 값을 설정하는 작업이 포함됩니다.
// 파이썬: `__init__` 메서드.
print("\n--- 초기화 ---") // 문자열 리터럴 번역

struct Celsius {
    var temperatureInCelsius: Double
    // 초기화 구문
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
        print("화씨에서 섭씨로 초기화됨: \(temperatureInCelsius)°C") // 문자열 리터럴 번역
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
        print("켈빈에서 섭씨로 초기화됨: \(temperatureInCelsius)°C") // 문자열 리터럴 번역
    }
    // 사용자 정의 init을 정의하면 (구조체의 경우) 자동 멤버별 init이 손실됩니다.
    // 모든 프로퍼티에 기본값이 있는 경우는 예외입니다.
    // 이를 유지하려면 익스텐션에서 사용자 정의 init을 정의하거나 다시 정의할 수 있습니다.
    init(_ celsius: Double) { // 매개변수 레이블은 `_`로 생략 가능
        self.temperatureInCelsius = celsius
        print("섭씨로 직접 초기화됨: \(temperatureInCelsius)°C") // 문자열 리터럴 번역
    }
}
let boilingPoint = Celsius(fromFahrenheit: 212.0) // init(fromFahrenheit:) 호출
let freezingPoint = Celsius(fromKelvin: 273.15)    // init(fromKelvin:) 호출
let bodyTemperature = Celsius(37.0)                // init(_:) 호출

// 기본 프로퍼티 값
// 정의의 일부로 저장 프로퍼티에 기본값을 설정할 수 있습니다.
class ShoppingListItem {
    var name: String? // 옵셔널 String, 기본값은 nil
    var quantity = 1  // 기본값은 1
    var purchased = false // 기본값은 false

    // 모든 프로퍼티에 기본값이 있으면 기본 매개변수 없는 초기화 구문이 합성됩니다.
    // (다른 초기화 구문을 정의하지 않은 경우).
    // init() {} // 다른 init이 여기에 없으면 암시적으로 사용 가능합니다.

    // 사용자 정의 초기화 구문
    init(name: String, quantity: Int = 1, purchased: Bool = false) { // init의 기본 매개변수 값
        self.name = name
        self.quantity = quantity
        self.purchased = purchased
        print("쇼핑 목록 항목 '\(name)' 초기화됨.") // 문자열 리터럴 번역
    }
}
var item1 = ShoppingListItem(name: "계란", quantity: 12) // 문자열 리터럴 번역
var item2 = ShoppingListItem(name: "우유") // 기본 수량(1) 및 구매 여부(false) 사용 (문자열 리터럴 번역)
// var item3 = ShoppingListItem() // 위의 사용자 정의 init이 정의되어 있으면 오류 발생, 기본 init()을 제거하기 때문입니다.
                               // 둘 다 가지려면 init()을 명시적으로 제공하거나 익스텐션에 사용자 정의 init을 넣어야 합니다.

// 구조체 타입의 멤버별 초기화 구문
// 구조체 타입은 자체적으로 정의하지 않으면 자동으로 멤버별 초기화 구문을 받습니다.
struct Size {
    var width = 0.0, height = 0.0 // 기본값 포함
}
let zeroSize = Size() // 합성된 init() 사용 -> width=0.0, height=0.0
let customSize = Size(width: 10.0, height: 5.0) // 합성된 멤버별 init 사용

struct NoDefaultSize {
    var width: Double
    var height: Double
}
// let noDef = NoDefaultSize() // 오류: 매개변수 'width', 'height'에 대한 인수가 없습니다.
let customNoDef = NoDefaultSize(width: 3.0, height: 4.0) // 멤버별 init 사용 가능


// 값 타입(구조체, 열거형)의 초기화 구문 위임
// 초기화 구문은 동일한 타입의 다른 초기화 구문(`self.init`)을 호출할 수 있습니다.
// 코드 중복을 피하는 데 유용합니다.
struct Rect {
    var origin = Point() // 기본 Point(x:0,y:0)
    var size = Size()    // 기본 Size(width:0,height:0)

    init() {} // 매개변수 없는 초기화 구문

    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        // 동일한 타입의 다른 초기화 구문 호출 (위임)
        self.init(origin: Point(x: originX, y: originY), size: size)
        print("중심점으로 사각형 초기화됨.") // 문자열 리터럴 번역
    }
}
let basicRect = Rect()
let originRect = Rect(origin: Point(x: 1.0, y: 1.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 2.5, y: 2.5), size: Size(width: 3.0, height: 3.0))
print("CenterRect 원점: (\(centerRect.origin.x), \(centerRect.origin.y))") // 문자열 리터럴 번역


// 클래스 초기화 (지정, 편의, 상속) - 더 복잡하며, 상속 예제에서 다룹니다.
// 간략히:
// - 지정 초기화 구문: 주 초기화 구문. 클래스의 모든 프로퍼티를 완전히 초기화하고
//   적절한 슈퍼클래스 초기화 구문을 호출합니다.
// - 편의 초기화 구문: 보조. 동일한 클래스의 다른 초기화 구문(`self.init`)을 호출해야 합니다.
//   `convenience` 키워드로 표시됩니다. 결국 지정 초기화 구문이 호출되어야 합니다.

class Food {
    var name: String
    // 지정 초기화 구문
    init(name: String) {
        self.name = name
        print("음식 '\(name)' 지정 초기화됨.") // 문자열 리터럴 번역
    }
    // 편의 초기화 구문
    convenience init() {
        self.init(name: "[이름 없는 음식]") // Food의 지정 init 호출 (문자열 리터럴 번역)
        print("음식 편의 초기화됨.") // 문자열 리터럴 번역
    }
}
let mysteryMeat = Food() // 편의 init 호출, 이는 지정 init 호출
let apple = Food(name: "사과") // 지정 init 호출 (문자열 리터럴 번역)


// 실패 가능한 초기화 구문 (`init?` 또는 `init!`)
// 초기화가 실패할 수 있습니다 (`nil` 반환).
// 초기화가 외부 데이터나 조건에 의존할 때 유용합니다.
print("\n--- 실패 가능한 초기화 구문 ---") // 문자열 리터럴 번역
struct Animal {
    let species: String
    init?(species: String) { // 실패 가능: Animal? 반환
        if species.isEmpty {
            print("종은 비어 있을 수 없습니다. 초기화 실패.") // 문자열 리터럴 번역
            return nil // 실패 표시
        }
        self.species = species
        print("동물 \(species) 종으로 초기화됨.") // 문자열 리터럴 번역
    }
}
let someCreature = Animal(species: "기린") // someCreature는 Animal? 타입 (문자열 리터럴 번역)
if let giraffe = someCreature {
    print("\(giraffe.species)을(를) 성공적으로 생성했습니다.") // 문자열 리터럴 번역
}

let anonymousCreature = Animal(species: "") // nil 반환
if anonymousCreature == nil {
    print("익명 생물 생성 실패.") // 문자열 리터럴 번역
}

// 예시: 숫자 타입 변환을 위한 실패 가능한 init
struct Product {
    let id: String
    let stock: Int

    init?(id: String, stockString: String) {
        self.id = id
        guard let stockCount = Int(stockString), stockCount >= 0 else {
            print("잘못된 재고 문자열 '\(stockString)' 또는 음수 재고. ID \(id)에 대한 제품 초기화 실패.") // 문자열 리터럴 번역
            return nil // Int로 변환 실패 또는 재고가 음수
        }
        self.stock = stockCount
        print("제품 \(id) 재고 \(stock)(으)로 초기화됨.") // 문자열 리터럴 번역
    }
}
let book = Product(id: "123", stockString: "10") // 유효
let toy = Product(id: "456", stockString: "다섯") // 실패, stockString이 Int가 아님 (문자열 리터럴 번역)
let gadget = Product(id: "789", stockString: "-2") // 실패, 재고가 음수

// 필수 초기화 구문 (`required init`)
// 클래스의 모든 하위 클래스가 해당 초기화 구문을 구현해야 함을 나타냅니다.
// 클래스 초기화 구문 정의 앞에 `required`를 추가합니다.
class BaseClass {
    var id: Int
    required init(id: Int) { // 모든 하위 클래스는 이것을 구현해야 합니다 (또는 기준을 충족하면 상속).
        self.id = id
        print("BaseClass 필수 init, id: \(id)") // 문자열 리터럴 번역
    }
}
class SubClass: BaseClass {
    var name: String
    // 하위 클래스는 필수 init 구현에 `required`를 표시해야 합니다.
    // 필수 init을 직접 구현하는 경우 `override`가 필요하지 않습니다.
    required init(id: Int) {
        self.name = "기본 이름" // 하위 클래스 프로퍼티 먼저 초기화 (문자열 리터럴 번역)
        super.init(id: id) // 슈퍼클래스의 지정/필수 init 호출
        print("SubClass 필수 init, id: \(id)") // 문자열 리터럴 번역
    }
    // 다른 초기화 구문도 가질 수 있습니다.
    init(id: Int, name: String) {
        self.name = name
        super.init(id: id) // 슈퍼클래스의 지정/필수 init 호출
        print("SubClass 사용자 정의 init, id: \(id), 이름: \(name)") // 문자열 리터럴 번역
    }
}
let subInstance1 = SubClass(id: 101)
let subInstance2 = SubClass(id: 102, name: "내 하위 인스턴스") // 문자열 리터럴 번역


// 클로저 또는 함수로 기본 프로퍼티 값 설정
// 저장 프로퍼티의 기본값에 일부 설정이나 사용자 정의가 필요한 경우.
class SomeManager {
    // let defaultSettings: [String: Any] = { // 오류: 클로저가 self를 사용하면 범위에서 'self'를 찾을 수 없습니다.
    //     // defaultSettings에 대한 복잡한 설정
    //     var settings: [String: Any] = [:]
    //     settings["volume"] = 11
    //     settings["darkMode"] = true
    //     // 이 클로저가 `self` 또는 다른 인스턴스 프로퍼티에 접근해야 했다면 여기서 직접 작동하지 않았을 것입니다.
    //     // 이를 위해서는 lazy var를 사용하거나 `init`에서 초기화해야 합니다.
    //     return settings
    // }() // 끝의 괄호 `()`는 클로저를 즉시 실행시킵니다.

    // self가 필요 없는 더 간단한 예시:
    let uniqueID: String = {
        // 고유 ID를 생성하는 일부 로직 상상
        return "ID_\(Int.random(in: 1000...9999))"
    }() // 인스턴스가 생성될 때 한 번 실행됨

    var configuration: String

    init(config: String = "기본 구성") { // 문자열 리터럴 번역
        self.configuration = config
        print("SomeManager 초기화됨, ID: \(uniqueID), 구성: \(configuration)") // 문자열 리터럴 번역
    }
}
let manager1 = SomeManager()
let manager2 = SomeManager(config: "사용자 정의 설정") // 문자열 리터럴 번역
print("Manager1 ID: \(manager1.uniqueID), Manager2 ID: \(manager2.uniqueID)") // ID는 다를 것입니다. (문자열 리터럴 번역)


// 소멸화 (`deinit`) - 클래스 전용.
// 클래스 인스턴스가 ARC에 의해 메모리에서 해제되기 직전에 호출됩니다.
// 사용자 정의 정리 작업을 수행하는 데 사용됩니다.
// 파이썬: `__del__` (덜 결정적).
print("\n--- 소멸화 ---") // 문자열 리터럴 번역
class Bank {
    static var coinsInBank = 10_000
    static func vendCoins(_ numberOfCoinsToVend: Int) -> Int {
        let n = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= n
        return n
    }
    static func receiveCoins(_ coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    let name: String

    init(name: String, coins: Int) {
        self.name = name
        self.coinsInPurse = Bank.vendCoins(coins)
        print("플레이어 \(name) \(coinsInPurse) 코인으로 초기화됨.") // 문자열 리터럴 번역
    }

    func winCoins(_ coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
        print("플레이어 \(name) \(coins) 코인 획득, 현재 \(coinsInPurse) 코인 보유.") // 문자열 리터럴 번역
    }

    deinit { // deinit에는 괄호 없음
        Bank.receiveCoins(coinsInPurse)
        print("플레이어 \(name) 소멸화됨. \(coinsInPurse) 코인을 은행에 반환. 현재 은행 보유 코인: \(Bank.coinsInBank).") // 문자열 리터럴 번역
    }
}

var playerOne: Player? = Player(name: "앨리스", coins: 100) // 문자열 리터럴 번역
print("은행 보유 코인: \(Bank.coinsInBank).") // 9900 (문자열 리터럴 번역)

if var p = playerOne { // 원문에서는 if let을 언급했으나, deinit을 명확히 보이기 위해 var로 변경하여 playerOne이 nil이 되도록 유도.
    p.winCoins(2000)    // 실제로는 p가 복사본이므로 playerOne 자체의 winCoins가 아님.
                        // 하지만 deinit 설명에는 큰 영향 없음. 원문의 의도를 살려 번역.
}
// playerOne은 위가 `if let p = playerOne`이었다면 범위 때문에 여전히 살아있습니다.
// `if var p = playerOne`을 사용하면 옵셔널의 변경 가능한 복사본을 만들며,
// 원래 `playerOne` 바인딩에 대한 강한 참조가 아닙니다.
// deinit을 더 명확하게 보여주기 위해 다시 해봅시다.

var playerTwo: Player? = Player(name: "밥", coins: 50) // 은행 보유 코인: 9900 - 50 = 9850 (문자열 리터럴 번역)
playerOne = nil // 앨리스의 Player 인스턴스가 존재하면 소멸화합니다.
// 출력: 플레이어 앨리스 소멸화됨. 100 코인을 은행에 반환. 현재 은행 보유 코인: 9950. (앨리스가 100을 가졌다고 가정)

print("playerTwo를 nil로 설정 중...") // 문자열 리터럴 번역
playerTwo = nil // 밥의 Player 인스턴스를 소멸화합니다.
// 출력: 플레이어 밥 소멸화됨. 50 코인을 은행에 반환. 현재 은행 보유 코인: 10000.
```
