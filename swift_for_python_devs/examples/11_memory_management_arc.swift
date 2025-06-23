// 파이썬 개발자를 위한 Swift - 예제 11: 메모리 관리 (ARC)

// Swift는 클래스 인스턴스의 메모리를 관리하기 위해 자동 참조 계수(ARC)를 사용합니다.
// ARC는 해당 인스턴스가 더 이상 필요하지 않을 때 클래스 인스턴스가 사용한 메모리를 자동으로 해제합니다.
// 일반적으로 메모리 관리에 대해 직접 생각할 필요가 없습니다.
// ARC는 클래스의 인스턴스에만 적용되며, 구조체나 열거형(값 타입)에는 적용되지 않습니다.

// 파이썬은 참조 계수와 순환 가비지 컬렉터의 조합을 사용합니다.

print("--- 기본 ARC 동작 ---") // 문자열 리터럴 번역
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name)이(가) 초기화 중입니다 (Person).") // 문자열 리터럴 번역
    }
    deinit {
        print("\(name)이(가) 소멸화 중입니다 (Person).") // 문자열 리터럴 번역
    }
}

// Person 인스턴스에 대한 세 개의 참조 생성
var reference1: Person?
var reference2: Person?
var reference3: Person?

// 새 Person 인스턴스를 만들고 reference1에 할당
reference1 = Person(name: "홍길동") // 문자열 리터럴 번역 (이름 예시)
// 출력: 홍길동이(가) 초기화 중입니다 (Person).
// 이제 이 Person 인스턴스에 대한 강한 참조가 하나 있습니다.

// 동일한 인스턴스를 reference2와 reference3에 할당
reference2 = reference1
reference3 = reference1
// 이제 이 Person 인스턴스에 대한 강한 참조가 세 개 있습니다.

// 이 강한 참조 중 두 개를 nil로 설정하여 해제
reference1 = nil
reference2 = nil
// 여전히 하나의 강한 참조(reference3)가 있으므로 Person 인스턴스는 아직 할당 해제되지 않았습니다.
print("reference1과 reference2는 nil입니다. reference3는 여전히 참조를 유지합니다.") // 문자열 리터럴 번역

// 마지막 강한 참조 해제
reference3 = nil
// 출력: 홍길동이(가) 소멸화 중입니다 (Person).
// 이제 더 이상 강한 참조가 없으므로 ARC가 Person 인스턴스를 할당 해제합니다.


// --- 클래스 인스턴스 간의 강한 참조 순환 ---
// 두 클래스 인스턴스가 서로 강한 참조를 유지하여 각 인스턴스가 다른 인스턴스를 계속 살아있게 하면
// 강한 참조 순환이 발생합니다.
// 이는 참조 횟수가 절대 0으로 떨어지지 않아 ARC가 해당 인스턴스를 할당 해제하지 못하게 되어
// 메모리 누수로 이어짐을 의미합니다.

print("\n--- 강한 참조 순환 예제 ---") // 문자열 리터럴 번역
class Resident { // 거주자
    let name: String
    var apartment: Apartment? // 옵셔널, nil일 수 있음. 기본적으로 강한 참조.

    init(name: String) {
        self.name = name
        print("거주자 \(name) 초기화됨.") // 문자열 리터럴 번역
    }
    deinit {
        print("거주자 \(name) 소멸화됨.") // 문자열 리터럴 번역
    }
}

class Apartment { // 아파트
    let unit: String // 호수
    // 순환을 끊으려면 `weak var tenant: Resident?`여야 합니다.
    var tenant: Resident? // 기본적으로 강한 참조

    init(unit: String) {
        self.unit = unit
        print("아파트 \(unit) 초기화됨.") // 문자열 리터럴 번역
    }
    deinit {
        print("아파트 \(unit) 소멸화됨.") // 문자열 리터럴 번역
    }
}

var bob: Resident?
var unit4A: Apartment?

bob = Resident(name: "밥")         // bob은 Resident 인스턴스에 대한 강한 참조 1개 (문자열 리터럴 번역)
unit4A = Apartment(unit: "4A호")    // unit4A는 Apartment 인스턴스에 대한 강한 참조 1개 (문자열 리터럴 번역)

// 순환 생성:
bob!.apartment = unit4A   // Apartment 인스턴스는 이제 강한 참조 2개 (unit4A 및 bob.apartment)
unit4A!.tenant = bob      // Resident 인스턴스는 이제 강한 참조 2개 (bob 및 unit4A.tenant)

print("밥과 4A호가 연결되어 순환을 생성합니다.") // 문자열 리터럴 번역

// 외부 참조 해제 시도
bob = nil    // bob의 Resident 인스턴스에 대한 강한 참조가 사라짐. Resident 인스턴스는 여전히 참조 1개 유지 (unit4A.tenant로부터)
unit4A = nil // unit4A의 Apartment 인스턴스에 대한 강한 참조가 사라짐. Apartment 인스턴스는 여전히 참조 1개 유지 ((원래 bob).apartment로부터)

// 순환 때문에 여기서 DEINIT 메시지가 출력되지 않습니다.
// Resident 및 Apartment 인스턴스는 여전히 서로 강한 참조를 유지합니다.
// 메모리 누수!

// --- 강한 참조 순환 해결 ---
// Swift는 강한 참조 순환을 해결하는 두 가지 방법을 제공합니다:
// 1. 약한 참조 (`weak`)
// 2. 미소유 참조 (`unowned`)

// --- 약한 참조 ---
// 약한 참조는 참조하는 인스턴스에 대한 강한 유지를 하지 않습니다.
// ARC가 참조된 인스턴스를 할당 해제하는 것을 막지 않습니다.
// ARC는 참조하는 인스턴스가 할당 해제될 때 약한 참조를 자동으로 `nil`로 설정합니다.
// 이 때문에 약한 참조는 옵셔널 타입(`var` 및 `?`)으로 선언해야 합니다.
// 다른 인스턴스의 수명이 더 짧거나 nil일 수 있을 때 약한 참조를 사용합니다.

print("\n--- 약한 참조 예제 (순환 해결) ---") // 문자열 리터럴 번역
class PersonWithWeakApartment {
    let name: String
    var apartment: ApartmentWithWeakTenant? // 아파트에 대한 강한 참조

    init(name: String) {
        self.name = name
        print("PersonWithWeakApartment \(name) 초기화됨.") // 문자열 리터럴 번역
    }
    deinit {
        print("PersonWithWeakApartment \(name) 소멸화됨.") // 문자열 리터럴 번역
    }
}

class ApartmentWithWeakTenant {
    let unit: String
    weak var tenant: PersonWithWeakApartment? // 세입자에 대한 약한(WEAK) 참조

    init(unit: String) {
        self.unit = unit
        print("ApartmentWithWeakTenant \(unit) 초기화됨.") // 문자열 리터럴 번역
    }
    deinit {
        print("ApartmentWithWeakTenant \(unit) 소멸화됨.") // 문자열 리터럴 번역
    }
}

var alice: PersonWithWeakApartment?
var unit1B: ApartmentWithWeakTenant?

alice = PersonWithWeakApartment(name: "앨리스") // 문자열 리터럴 번역
unit1B = ApartmentWithWeakTenant(unit: "1B호") // 문자열 리터럴 번역

// 연결:
alice!.apartment = unit1B // Alice는 unit1B에 대한 강한 참조를 가짐
unit1B!.tenant = alice    // unit1B는 Alice에 대한 약한 참조를 가짐

print("앨리스와 1B호가 연결됨 (세입자에 약한 참조 사용).") // 문자열 리터럴 번역

alice = nil
// unit1B의 약한 참조가 Alice 인스턴스를 살아있게 하지 않으므로 Alice 인스턴스가 할당 해제됩니다.
// 출력: PersonWithWeakApartment 앨리스 소멸화됨.
// Alice가 할당 해제되면 unit1B에 대한 강한 참조도 끊어집니다.

unit1B = nil
// unit1B 인스턴스의 유일한 강한 참조(원래 `unit1B` 변수로부터)가 끊어져 할당 해제됩니다.
// 출력: ApartmentWithWeakTenant 1B호 소멸화됨.
// 순환이 끊어졌습니다!


// --- 미소유 참조 ---
// 약한 참조와 마찬가지로 미소유 참조는 참조하는 인스턴스에 대한 강한 유지를 하지 않습니다.
// 약한 참조와 달리, 미소유 참조는 다른 인스턴스가 동일한 수명 또는 더 긴 수명을 가질 때 사용됩니다.
// 미소유 참조는 항상 값을 가질 것으로 가정됩니다. ARC는 미소유 참조의 값을 절대 `nil`로 설정하지 않습니다.
// 따라서 미소유 참조는 비옵셔널 타입으로 정의됩니다.
// 중요: 참조하는 인스턴스가 할당 해제된 후 미소유 참조에 접근하려고 하면
// 런타임 오류(크래시)가 발생합니다.
// 참조가 설정된 후에는 절대 nil이 아닐 것이라고 확신할 때 미소유를 사용합니다.

print("\n--- 미소유 참조 예제 ---") // 문자열 리터럴 번역
// 시나리오: 고객과 신용카드. 신용카드는 항상 고객에게 속합니다.
// 고객은 신용카드가 없을 수 있지만, 카드는 *반드시* 고객이 있어야 합니다.
// 고객이 카드를 "소유"합니다. 카드는 고객보다 오래 존재할 수 없습니다.

class Customer { // 고객
    let name: String
    var card: CreditCard? // 옵셔널, 고객에게 카드가 없을 수 있음. 카드에 대한 강한 참조.

    init(name: String) {
        self.name = name
        print("고객 \(name) 초기화됨.") // 문자열 리터럴 번역
    }
    deinit {
        print("고객 \(name) 소멸화됨.") // 문자열 리터럴 번역
    }
}

class CreditCard { // 신용카드
    let number: UInt64 // 번호
    unowned let customer: Customer // 고객에 대한 미소유(UNOWNED) 참조 (비옵셔널)
                                   // 카드는 고객 없이 존재하지 않는다고 가정합니다.

    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer // 고객 인스턴스가 전달되며, 존재할 것으로 예상됩니다.
        print("신용카드 #\(number) (\(customer.name)님) 초기화됨.") // 문자열 리터럴 번역
    }
    deinit {
        print("신용카드 #\(number) 소멸화됨.") // 문자열 리터럴 번역
    }
}

var david: Customer?
david = Customer(name: "데이빗") // 데이빗 초기화됨. (문자열 리터럴 번역)

// 데이빗을 위한 카드 생성.
// 카드 초기화 구문은 Customer 인스턴스를 받습니다.
// 카드는 이 고객에 대한 미소유 참조를 유지합니다.
david!.card = CreditCard(number: 1234_5678_9012_3456, customer: david!)
// 신용카드 #1234567890123456 (데이빗님) 초기화됨.
// 데이빗은 카드에 대한 강한 참조를 가집니다. 카드는 데이빗에 대한 미소유 참조를 가집니다.

// 데이빗이 할당 해제되면 그의 카드도 할당 해제되어야 합니다.
david = nil
// 출력:
// 고객 데이빗 소멸화됨.
// 신용카드 #1234567890123456 소멸화됨.
// 순환이 끊어졌습니다. CreditCard의 `customer`가 강한 참조였다면 메모리 누수였을 것입니다.
// `customer`가 약한 참조였다면 작동했겠지만 옵셔널이어야 하고 확인이 필요했을 것입니다.
// CreditCard 인스턴스는 Customer 없이 유효하지 않으므로 여기서는 미소유가 적절합니다.


// --- 미소유 옵셔널 참조 ---
// 클래스에 대한 옵셔널 참조를 미소유로 표시할 수 있습니다.
// `unowned var/let propertyName: MyClass?`
// 때때로 nil일 수 있는 미소유 참조가 필요한 경우 유용합니다.
// 예: 학교 학과에는 제공하는 과정이 있을 수 있습니다. 과정은 하나의 학과에 속합니다.
// 학과는 과정에 의해 미소유됩니다. 그러나 과정이 아직 학과에 항상 할당되지는 않을 수 있습니다.
class Department { // 학과
    let name: String
    var courses: [Course] = [] // 과정
    init(name: String) { self.name = name; print("학과 \(name) 생성됨.") } // 문자열 리터럴 번역
    deinit { print("학과 \(name) 할당 해제됨.") } // 문자열 리터럴 번역
    func add(_ course: Course) {
        courses.append(course)
    }
}

class Course { // 과정
    let title: String // 제목
    unowned var department: Department? // 미소유 옵셔널: nil일 수 있지만, 그렇지 않으면 미소유입니다.
    init(title: String) { self.title = title; print("과정 \(title) 생성됨.") } // 문자열 리터럴 번역
    deinit { print("과정 \(title) 할당 해제됨.") } // 문자열 리터럴 번역
}

var compSci: Department? = Department(name: "컴퓨터 과학") // 문자열 리터럴 번역
var math: Department? = Department(name: "수학") // 문자열 리터럴 번역

var introToProgramming: Course? = Course(title: "프로그래밍 입문") // 문자열 리터럴 번역
introToProgramming!.department = compSci // Course는 compSci에 대한 미소유 참조를 가짐
compSci!.add(introToProgramming!)       // compSci는 course에 대한 강한 참조를 가짐

var calculus: Course? = Course(title: "미적분학 I") // 문자열 리터럴 번역
calculus!.department = math
math!.add(calculus!)

print("컴퓨터 과학 학과 할당 해제 중...") // 문자열 리터럴 번역
compSci = nil // 학과 및 해당 과정(학과에서만 참조되는 경우)이 할당 해제되어야 합니다.
// 출력:
// 학과 컴퓨터 과학 할당 해제됨.
// 과정 프로그래밍 입문 할당 해제됨. (유일한 강한 참조가 compSci.courses에서 왔기 때문)

// 이제 introToProgramming!.department에 접근하려고 하면 department가 옵셔널이 아니었다면 충돌했을 것입니다.
// `unowned var department: Department?`이므로, `compSci`가 할당 해제된 후 `introToProgramming!.department`에 접근하면
// `introToProgramming` 자체가 nil로 설정되지 않았다면 여전히 충돌합니다.
// 왜냐하면 미소유 참조가 할당 해제된 메모리를 가리키기 때문입니다.
// `unowned optional`의 옵셔널성은 주로 프로퍼티 자체가 nil일 수 있음을 의미하며,
// 객체가 할당 해제될 때 ARC가 이를 nil로 만드는 것(weak처럼)을 의미하지는 않습니다.
// 따라서 나중에 `introToProgramming`에 접근할 계획이라면 `compSci`가 할당 해제되기 전에
// `introToProgramming`도 nil로 설정하거나 해당 `department` 프로퍼티를 신중하게 처리해야 합니다.
introToProgramming = nil // 또는 해당 `department` 프로퍼티를 신중하게 처리합니다.

print("수학 학과 할당 해제 중...") // 문자열 리터럴 번역
math = nil
calculus = nil


// --- 클로저의 강한 참조 순환 ---
// 클래스 인스턴스의 프로퍼티에 클로저를 할당하고 해당 클로저의 본문이 인스턴스를 캡처하는 경우
// (예: `self` 또는 `self`의 프로퍼티 참조) 강한 참조 순환이 발생할 수도 있습니다.
// 클로저는 "인스턴스를 살아있게 유지"하고, 인스턴스는 "클로저를 살아있게 유지"합니다.

print("\n--- 클로저를 사용한 강한 참조 순환 ---") // 문자열 리터럴 번역
class HTMLElement {
    let name: String
    let text: String?

    // `asHTML`은 클로저 프로퍼티입니다.
    // 이 클로저가 `self`를 강하게 캡처하면 순환을 만들 수 있습니다.
    lazy var asHTML: () -> String = {
        // 순환을 끊으려면 캡처 목록을 사용합니다: `[weak self]` 또는 `[unowned self]`
        // [weak self] in // 이 줄을 추가하여 클로저 내에서 `self`를 약하게 만듭니다.
        // guard let self = self else { return "<!-- 할당 해제된 요소 -->" } // 약한 경우 nil 확인 (문자열 리터럴 번역)

        // [unowned self] in // 클로저의 수명 동안 `self`가 존재한다고 보장되는 경우 사용

        // 원래 문제 있는 코드 (self의 강한 캡처):
        if let text = self.text { // `self.text`는 `self`를 강하게 캡처합니다.
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
        print("HTMLElement \(name) 초기화됨.") // 문자열 리터럴 번역
    }
    deinit {
        print("HTMLElement \(name) 소멸화됨.") // 문자열 리터럴 번역
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "안녕하세요, 세상입니다") // 문자열 리터럴 번역
print(paragraph!.asHTML()) // asHTML에 접근하면 지연 프로퍼티(클로저)가 초기화됩니다.

// `asHTML` 클로저에 캡처 목록이 사용되지 않은 경우:
paragraph = nil
// HTMLElement "p"에 대한 DEINIT이 여기서 호출되지 않습니다.
// paragraph 인스턴스는 클로저(asHTML)에 대한 강한 참조를 유지합니다.
// 클로저는 paragraph 인스턴스(self)에 대한 강한 참조를 유지합니다. 순환!

// 이를 수정하려면 클로저에 캡처 목록을 사용합니다: `[weak self]` 또는 `[unowned self]`.
// 클로저에 `[weak self] in` 및 `guard let self = self else ...`가 추가되면:
// `paragraph`가 `nil`로 설정될 때 HTMLElement 인스턴스가 소멸화됩니다.
// 출력: HTMLElement p 소멸화됨.

// `[unowned self] in`을 사용하는 경우:
// 이는 클로저가 호출될 때 `self`가 항상 존재한다고 가정합니다.
// `paragraph`가 `nil`로 설정된 후 어떤 이유로든 `asHTML`이 호출되면 (예: 다른 곳에 저장된 경우)
// 충돌합니다. `unowned`는 클로저가 인스턴스보다 오래 존재할 수 없는 경우에 적합합니다.

// 수정된 HTMLElement 버전은 `learning_guide.md`를 참조하십시오.
// 이 예제 파일에서는 문제를 보여주기 위해 의도적으로 순환을 남겨둡니다.
// 플레이그라운드에서 이를 실행하면 위의 `paragraph = nil`에 대해 "HTMLElement p 소멸화됨."이 출력되지 않습니다.
```
