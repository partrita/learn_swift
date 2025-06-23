// 파이썬 개발자를 위한 Swift - 예제 07: 객체 지향 프로그래밍 (클래스와 구조체)

import Foundation // 필요한 경우 sqrt 함수 등에 사용

// Swift에는 프로퍼티와 메서드를 가진 사용자 정의 데이터 타입을 만드는 두 가지 주요 방법이 있습니다:
// - 클래스 (Classes)
// - 구조체 (Structures, structs)

// --- 주요 차이점 ---
// 1. 타입:
//    - 클래스는 참조(REFERENCE) 타입입니다.
//    - 구조체는 값(VALUE) 타입입니다.
// 2. 상속:
//    - 클래스는 상속을 지원합니다.
//    - 구조체는 상속을 지원하지 않습니다.
// 3. 변경 가능성:
//    - 클래스(참조 타입)의 경우, `let` 상수는 해당 인스턴스의 가변 프로퍼티를 변경할 수 있습니다.
//      상수는 동일한 인스턴스를 참조하지만, 인스턴스의 상태는 변경될 수 있습니다.
//    - 구조체(값 타입)의 경우, 구조체 인스턴스가 `let` 상수에 할당되면,
//      해당 프로퍼티가 `var`로 선언되었더라도 어떤 프로퍼티도 변경할 수 없습니다.
//      이는 상수가 전체 값을 보유하기 때문입니다.
// 4. 초기화 구문:
//    - 구조체는 사용자 정의 초기화 구문을 정의하지 않으면 무료 멤버별 초기화 구문을 얻습니다.
//    - 클래스는 모든 저장 프로퍼티가 초기화되어야 합니다 (기본값 또는 초기화 구문 내에서).
//      모든 프로퍼티에 기본값이 있고 사용자 정의 초기화 구문이 정의되지 않은 경우에만 기본 매개변수 없는 초기화 구문을 얻습니다.
// 5. 소멸자 (`deinit`):
//    - 클래스는 리소스를 정리하기 위한 소멸자를 가질 수 있습니다.
//    - 구조체는 소멸자를 가질 수 없습니다.

print("--- 구조체 (Structs) ---") // 문자열 리터럴 번역
// 간단한 데이터 구조, 상속이 필요 없는 것,
// 그리고 값 의미론(복사본은 독립적임)을 원할 때 좋습니다.

struct Point { // 값 타입
    var x: Double
    var y: Double

    // 구조체 내의 메서드
    func description() -> String {
        return "점 (x: \(x), y: \(y))" // 문자열 리터럴 번역
    }

    // 값 타입(구조체, 열거형)의 프로퍼티를 수정하는 메서드는 `mutating`으로 표시해야 합니다.
    mutating func moveBy(deltaX: Double, deltaY: Double) {
        x += deltaX
        y += deltaY
        // 대안: self = Point(x: self.x + deltaX, y: self.y + deltaY)
    }

    // 계산 프로퍼티
    var distanceFromOrigin: Double {
        // 읽기 전용 계산 프로퍼티의 경우 `get`은 암시적입니다.
        return (x * x + y * y).squareRoot()
    }
}

// 구조체는 사용자 정의 초기화 구문을 정의하지 않으면 멤버별 초기화 구문을 자동으로 얻습니다.
var p1 = Point(x: 3.0, y: 4.0)
print(p1.description()) // "점 (x: 3.0, y: 4.0)"
print("p1의 원점으로부터의 거리: \(p1.distanceFromOrigin)") // 5.0 (문자열 리터럴 번역)

// 값 타입 동작: p2는 p1의 복사본입니다.
var p2 = p1
print("p2 초기 상태: " + p2.description()) // 문자열 리터럴 번역

p1.moveBy(deltaX: 1.0, deltaY: 1.0) // p1 수정
print("이동 후 p1: " + p1.description())      // "점 (x: 4.0, y: 5.0)" (문자열 리터럴 번역)
print("p1 이동 후 p2: " + p2.description()) // "점 (x: 3.0, y: 4.0)" (p2는 변경되지 않음) (문자열 리터럴 번역)

// 구조체 인스턴스가 상수(`let`)이면, 해당 프로퍼티가 가변 프로퍼티(`var`)이거나
// mutating 메서드를 호출하더라도 프로퍼티를 변경할 수 없습니다.
let fixedPoint = Point(x: 1.0, y: 1.0)
print("고정된 점: " + fixedPoint.description()) // 문자열 리터럴 번역
// fixedPoint.x = 2.0 // 오류: 'fixedPoint'는 'let' 상수이므로 프로퍼티에 할당할 수 없습니다.
// fixedPoint.moveBy(deltaX: 1.0, deltaY: 1.0) // 오류: 불변 값 'fixedPoint'에 대해 mutating 멤버를 사용할 수 없습니다.


print("\n--- 클래스 (Classes) ---") // 문자열 리터럴 번역
// 더 복잡한 객체, 상속이 필요할 때, 또는 참조 의미론이 필요할 때 사용됩니다.
// 파이썬 클래스는 항상 참조 타입입니다.

class Vehicle { // 참조 타입
    var currentSpeed: Double = 0.0 // 기본값을 가진 저장 프로퍼티
    let numberOfWheels: Int // 저장 프로퍼티, 초기화해야 함

    // 초기화 구문 (생성자)
    // 클래스는 멤버별 초기화 구문을 자동으로 얻지 못합니다.
    // 모든 저장 프로퍼티는 초기화 후 값을 가져야 합니다.
    init(numberOfWheels: Int) {
        self.numberOfWheels = numberOfWheels // `self`는 인스턴스를 참조합니다.
        print("\(numberOfWheels)개의 바퀴를 가진 차량 초기화됨.") // 문자열 리터럴 번역
    }

    // 또 다른 초기화 구문 (오버로딩)
    init(numberOfWheels: Int, initialSpeed: Double) {
        self.numberOfWheels = numberOfWheels
        self.currentSpeed = initialSpeed
        print("\(numberOfWheels)개의 바퀴와 초기 속도 \(initialSpeed)를 가진 차량 초기화됨.") // 문자열 리터럴 번역
    }

    // 모든 프로퍼티에 기본값이 있고 사용자 정의 초기화 구문이 정의되지 않은 경우,
    // 기본 매개변수 없는 초기화 구문 `init()`이 제공됩니다.
    // 예시:
    // class AnotherVehicle {
    //     var name = "기본값"
    // }
    // let av = AnotherVehicle() // 기본 init() 사용

    // 계산 프로퍼티
    var description: String {
        return "\(numberOfWheels)개의 바퀴를 가지고 시속 \(currentSpeed)마일로 이동하는 차량입니다." // 문자열 리터럴 번역
    }

    // 메서드
    func accelerate(by amount: Double) {
        currentSpeed += amount
    }

    func makeNoise() {
        print("일반적인 차량 소음") // 문자열 리터럴 번역
    }

    // 소멸자 (소멸자와 유사, ARC에 의해 인스턴스가 할당 해제될 때 호출됨)
    deinit {
        print("\(numberOfWheels)개의 바퀴를 가진 차량이 소멸화 중입니다.") // 문자열 리터럴 번역
    }
}

// 클래스 인스턴스 생성
var car = Vehicle(numberOfWheels: 4, initialSpeed: 30.0)
print(car.description)
car.accelerate(by: 25.0)
print("가속 후 차량: " + car.description) // 문자열 리터럴 번역

// 참조 타입 동작: anotherCarRef는 car와 동일한 인스턴스를 가리킵니다.
var anotherCarRef = car
print("anotherCarRef 속도: \(anotherCarRef.currentSpeed)") // 55.0 (문자열 리터럴 번역)

car.accelerate(by: 10.0) // `car`가 참조하는 인스턴스 수정
print("추가 가속 후 차량 속도: \(car.currentSpeed)")           // 65.0 (문자열 리터럴 번역)
print("차량 가속 후 anotherCarRef 속도: \(anotherCarRef.currentSpeed)") // 65.0 (변경 사항 확인) (문자열 리터럴 번역)

// 항등 연산자 (=== 및 !==)
// 두 상수 또는 변수가 정확히 동일한 클래스 인스턴스를 참조하는지 확인합니다.
let car2 = Vehicle(numberOfWheels: 4)
let car3 = car // car3는 car와 동일한 인스턴스를 참조합니다.

if car === car2 {
    print("car와 car2는 동일한 인스턴스를 참조합니다.") // 출력되지 않음 (문자열 리터럴 번역)
} else {
    print("car와 car2는 다른 인스턴스를 참조합니다.") // 문자열 리터럴 번역
}

if car === car3 {
    print("car와 car3는 동일한 인스턴스를 참조합니다.") // 출력됨 (문자열 리터럴 번역)
}

// 클래스 인스턴스를 참조하는 `let` 상수:
// 인스턴스의 *가변 프로퍼티*는 변경할 수 있지만,
// 상수를 *다른 인스턴스*를 참조하도록 재할당할 수는 없습니다.
let myTruck = Vehicle(numberOfWheels: 18, initialSpeed: 50.0)
print("내 트럭: \(myTruck.description)") // 문자열 리터럴 번역
myTruck.currentSpeed = 55.0 // OK: currentSpeed는 `var` 프로퍼티입니다.
// myTruck.numberOfWheels = 16 // 오류: numberOfWheels는 `let` 프로퍼티입니다.
print("속도 변경 후 내 트럭: \(myTruck.description)") // 문자열 리터럴 번역

// myTruck = Vehicle(numberOfWheels: 6) // 오류: 'myTruck'은 'let' 상수이므로 값을 할당할 수 없습니다.


// --- 클래스와 구조체 중 선택하기 ---
// - 기본적으로 구조체(STRUCTS)를 사용합니다.
// - Objective-C 상호 운용성이 필요할 때 클래스를 사용합니다.
// - 모델링하는 데이터의 ID를 제어해야 할 때 클래스를 사용합니다.
// - ID를 제어할 필요가 없고 데이터가 단순하거나 값 타입 의미론(복사본은 독립적임)을 원할 때 구조체를 사용합니다.
// - Point, Size, Rectangle과 같은 데이터 구조는 구조체에 적합합니다.
// - ID와 라이프사이클을 가진 더 복잡한 엔티티(예: Document, Person, Window)는 종종 클래스가 더 낫습니다.

// 예시: 간단한 데이터 묶음을 위한 구조체
struct Resolution {
    var width = 0
    var height = 0

    func area() -> Int {
        return width * height
    }
}

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd // cinema는 hd의 복사본입니다.
cinema.width = 2048
print("HD 너비: \(hd.width), 시네마 너비: \(cinema.width)") // 1920, 2048 (문자열 리터럴 번역)


// --- 프로퍼티 ---
// 저장 프로퍼티 (인스턴스의 일부로 상수 또는 변수 값을 저장)
//   - 상수 저장 프로퍼티의 경우 `let`
//   - 변수 저장 프로퍼티의 경우 `var`
// 계산 프로퍼티 (값을 저장하는 대신 계산)
//   - getter와 선택적 setter를 제공합니다.
//   - Point(distanceFromOrigin) 및 Vehicle(description)에서 간략하게 다루었습니다.

// 지연 저장 프로퍼티
// 초기 값이 처음 사용될 때까지 계산되지 않는 프로퍼티입니다.
// `var`여야 하며, `let`일 수 없습니다. 비용이 많이 드는 초기화에 유용합니다.
class DataImporter {
    var filename = "data.txt" // 문자열 리터럴 번역 (파일명 예시)
    init() {
        // 비용이 많이 드는 설정 시뮬레이션
        print("\(filename)용 DataImporter 초기화됨 (잠재적으로 비용이 많이 듦).") // 문자열 리터럴 번역
        Thread.sleep(forTimeInterval: 0.1) // 작업 시뮬레이션
    }
    func importData() -> String {
        return "\(filename)의 데이터" // 문자열 리터럴 번역
    }
}

class DataManager {
    lazy var importer = DataImporter() // 처음 접근할 때까지 초기화되지 않음
    var data: [String] = []

    init() {
        print("DataManager 초기화됨.") // 문자열 리터럴 번역
    }

    func loadData() {
        print("DataManager가 데이터를 로드하려고 합니다...") // 문자열 리터럴 번역
        // `importer`는 여기서 처음 접근할 때 생성됩니다.
        data.append(importer.importData())
        print("데이터 로드됨.") // 문자열 리터럴 번역
    }
}
print("\n--- 지연 저장 프로퍼티 ---") // 문자열 리터럴 번역
let manager = DataManager() // importer는 아직 생성되지 않았습니다.
print("DataManager 인스턴스 생성됨.") // 문자열 리터럴 번역
// ... 잠시 후 ...
manager.loadData() // importer가 이제 생성됩니다.
// manager.importer.filename = "other_data.txt" // importer에 접근하는 것도 초기화합니다.
// manager.loadData() // importer는 이미 생성되었습니다.

// 프로퍼티 관찰자 (`willSet` 및 `didSet`)
// 프로퍼티 값의 변경을 관찰하고 응답합니다.
// 초기화 중에는 호출되지 않습니다.
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) { // 값이 저장되기 직전에 호출됨
            print("\(totalSteps)에서 totalSteps를 \(newTotalSteps)(으)로 설정하려고 합니다.") // 문자열 리터럴 번역
        }
        didSet(oldTotalSteps) { // 새 값이 저장된 직후에 호출됨
                                // 지정하지 않은 경우 이전 매개변수의 기본 이름은 `oldValue`입니다.
            if totalSteps > oldTotalSteps {
                print("\(totalSteps - oldTotalSteps) 걸음 추가됨. 현재 총계: \(totalSteps)") // 문자열 리터럴 번역
            } else {
                print("totalSteps가 \(oldTotalSteps)에서 \(totalSteps)(으)로 변경됨.") // 문자열 리터럴 번역
            }
        }
    }
}
print("\n--- 프로퍼티 관찰자 ---") // 문자열 리터럴 번역
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// 0에서 totalSteps를 200(으)로 설정하려고 합니다.
// 200 걸음 추가됨. 현재 총계: 200
stepCounter.totalSteps = 360
// 200에서 totalSteps를 360(으)로 설정하려고 합니다.
// 160 걸음 추가됨. 현재 총계: 360
stepCounter.totalSteps = 300
// 360에서 totalSteps를 300(으)로 설정하려고 합니다.
// totalSteps가 360에서 300(으)로 변경됨.


// 타입 프로퍼티 (정적 프로퍼티)
// 특정 인스턴스가 아닌 타입 자체에 속하는 프로퍼티입니다.
// `static` 키워드를 사용합니다. 클래스의 계산 타입 프로퍼티의 경우 `class`를 사용하여 재정의를 허용할 수 있습니다.
struct SomeStructure {
    static var storedTypeProperty = "어떤 값." // 문자열 리터럴 번역
    static var computedTypeProperty: Int {
        return 1
    }
}
class SomeClass {
    static var storedTypeProperty = "다른 값." // 문자열 리터럴 번역
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int { // `class`는 하위 클래스가 재정의하도록 허용합니다.
        return 42
    }
}
print("\n--- 타입 프로퍼티 ---") // 문자열 리터럴 번역
print(SomeStructure.storedTypeProperty) // "어떤 값."
SomeStructure.storedTypeProperty = "새로운 값." // 문자열 리터럴 번역
print(SomeStructure.storedTypeProperty) // "새로운 값."
print(SomeClass.overrideableComputedTypeProperty) // 42

// 메서드(인스턴스 메서드 및 타입 메서드)는 별도의 예제에서 자세히 다루지만,
// 위의 `description()` 및 `accelerate()`는 인스턴스 메서드입니다.
// 타입 메서드(정적 메서드)도 `static` 또는 `class` 키워드로 호출됩니다.
```
