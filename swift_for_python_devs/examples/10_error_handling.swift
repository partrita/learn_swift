// 파이썬 개발자를 위한 Swift - 예제 10: 오류 처리

// Swift는 런타임에 복구 가능한 오류를 발생시키고, 포착하고, 전파하고,
// 조작하기 위한 최상위 지원을 제공합니다.
// 파이썬은 예외 처리를 위해 try-except-finally 블록을 사용합니다.

import Foundation // 파일 작업과 같은 일부 예제에 필요

// --- 오류 표현 ---
// Swift에서 오류는 `Error` 프로토콜(빈 프로토콜)을 준수하는 타입의 값으로 표현됩니다.
// 열거형은 관련된 오류 조건 그룹을 모델링하는 데 종종 적합합니다.

enum SandwichError: Error { // 샌드위치 오류
    case outOfBread // 빵 부족
    case missingIngredient(ingredient: String) // 재료 누락
    case insufficientFunds(coinsNeeded: Int) // 자금 부족
    case machineBroken(reason: String) // 기계 고장
}

// --- 오류 발생시키기 ---
// 예기치 않은 일이 발생하여 정상적인 실행 흐름을 계속할 수 없음을 나타내기 위해 `throw`를 사용합니다.
// `throw SandwichError.outOfBread`

// --- `throws`를 사용하여 오류 전파하기 ---
// 오류를 발생시킬 수 있는 함수/메서드/초기화 구문은 선언부에 `throws` 키워드로 표시해야 합니다.
// `throws` 함수를 호출하는 경우 오류를 처리하거나 전파해야 합니다.

struct Sandwich { // 샌드위치
    var ingredients: [String] // 재료
    var price: Int // 가격
}

var availableBreadSlices = 4 // 사용 가능한 빵 조각
var availableIngredients = ["치즈": 3, "햄": 2, "상추": 5] // 사용 가능한 재료 (문자열 리터럴 번역)
var cashInRegister = 100 // 계산대의 현금

func makeSandwich(desiredIngredients: [String], payment: Int) throws -> Sandwich {
    print("\n샌드위치 만들기 시도: 재료 \(desiredIngredients), 지불액: \(payment)...") // 문자열 리터럴 번역

    guard availableBreadSlices >= 2 else {
        print("오류: 빵이 부족합니다!") // 문자열 리터럴 번역
        throw SandwichError.outOfBread // 오류 발생
    }

    for ingredient in desiredIngredients {
        guard let count = availableIngredients[ingredient], count > 0 else {
            print("오류: 재료 누락 - \(ingredient)!") // 문자열 리터럴 번역
            throw SandwichError.missingIngredient(ingredient: ingredient)
        }
    }

    let sandwichPrice = 5 + desiredIngredients.count // 기본 가격 + 재료당 $1
    guard payment >= sandwichPrice else {
        let needed = sandwichPrice - payment
        print("오류: 자금이 부족합니다! \(needed) 코인이 더 필요합니다.") // 문자열 리터럴 번역
        throw SandwichError.insufficientFunds(coinsNeeded: needed)
    }

    // 임의의 기계 고장 시뮬레이션
    if Bool.random() && Bool.random() { // ~25% 실패 확률
        let reasons = [" 걸림", " 과열됨", " 파업 중"] // 문자열 리터럴 번역
        let reason = reasons.randomElement() ?? "알 수 없는 문제" // 문자열 리터럴 번역
        print("오류: 기계 고장 - \(reason)!") // 문자열 리터럴 번역
        throw SandwichError.machineBroken(reason: reason)
    }

    // 모든 검사를 통과하면 샌드위치 만들기
    availableBreadSlices -= 2
    for ingredient in desiredIngredients {
        availableIngredients[ingredient]? -= 1
    }
    cashInRegister += sandwichPrice

    let newSandwich = Sandwich(ingredients: desiredIngredients, price: sandwichPrice)
    print("샌드위치 성공적으로 만듦: \(newSandwich.ingredients.joined(separator: ", ")). 가격: \(newSandwich.price).") // 문자열 리터럴 번역
    return newSandwich
}


// --- 오류 처리 ---
// 던지는 함수를 호출할 때 표현식 앞에 `try`를 붙입니다.
// Swift는 오류를 처리하는 여러 가지 방법을 제공합니다:

// 1. 함수에서 해당 함수를 호출하는 코드로 오류를 전파합니다.
//    (호출하는 함수도 `throws`로 표시해야 함)
func buySandwich(ingredients: [String], amountPaid: Int) throws -> Sandwich {
    // makeSandwich가 오류를 발생시키면 buySandwich도 오류를 발생시킵니다.
    let sandwich = try makeSandwich(desiredIngredients: ingredients, payment: amountPaid)
    print("\(sandwich.ingredients.joined(separator: ", ")) 샌드위치를 맛있게 드세요!") // 문자열 리터럴 번역
    return sandwich
}

// 2. `do-catch` 문을 사용하여 오류를 처리합니다.
print("--- do-catch로 처리 ---") // 문자열 리터럴 번역
func tryToBuyASandwich(ingredients: [String], payment: Int) {
    do {
        let sandwich = try buySandwich(ingredients: ingredients, amountPaid: payment)
        // buySandwich가 성공하면 이 코드가 실행됩니다.
        print("Do-Catch: \(sandwich.ingredients.joined(separator: ", ")) 구매 성공.") // 문자열 리터럴 번역
    } catch SandwichError.outOfBread {
        print("Do-Catch: 오류 - 죄송합니다, 오늘 빵이 다 떨어졌습니다.") // 문자열 리터럴 번역
    } catch SandwichError.missingIngredient(let ingredient) {
        print("Do-Catch: 오류 - 샌드위치에 \(ingredient) 재료가 없습니다.") // 문자열 리터럴 번역
    } catch SandwichError.insufficientFunds(let coinsNeeded) {
        print("Do-Catch: 오류 - 돈이 부족합니다. \(coinsNeeded) 코인이 더 필요합니다.") // 문자열 리터럴 번역
    } catch SandwichError.machineBroken(let reason) {
        print("Do-Catch: 오류 - 샌드위치 기계가 \(reason)(으)로 고장났습니다. 나중에 다시 시도해주세요.") // 문자열 리터럴 번역
    } catch { // 일반적인 catch 블록 (다른 모든 오류 포착)
        // `error`는 `Error` 타입의 암시적으로 사용 가능한 지역 상수입니다.
        print("Do-Catch: 예기치 않은 오류 발생: \(error)") // 문자열 리터럴 번역
        // 다음과 같이 캐스팅할 수도 있습니다: `if let unknownError = error as? MyCustomErrorType`
    }
    print("--- do-catch 시도 종료 ---") // 문자열 리터럴 번역
}

// do-catch 테스트
availableBreadSlices = 5
availableIngredients = ["치즈": 3, "햄": 2, "상추": 5] // 문자열 리터럴 번역
cashInRegister = 100

tryToBuyASandwich(ingredients: ["치즈", "햄"], payment: 10) // 성공해야 함 (기계 고장 제외) (문자열 리터럴 번역)
tryToBuyASandwich(ingredients: ["칠면조"], payment: 8)        // 재료 누락 (문자열 리터럴 번역)
availableBreadSlices = 1
tryToBuyASandwich(ingredients: ["치즈"], payment: 6)         // 빵 부족 (문자열 리터럴 번역)
availableBreadSlices = 4
tryToBuyASandwich(ingredients: ["상추"], payment: 1)        // 자금 부족 (문자열 리터럴 번역)


// 3. `try?`를 사용하여 오류를 옵셔널 값으로 처리합니다.
// 오류가 발생하면 표현식은 `nil`이 됩니다.
print("\n--- try?로 처리 ---") // 문자열 리터럴 번역
func tryToGetSandwichSilently(ingredients: [String], payment: Int) -> Sandwich? {
    let sandwich = try? makeSandwich(desiredIngredients: ingredients, payment: payment)
    // `sandwich`는 Sandwich? (옵셔널 Sandwich)입니다.
    // makeSandwich가 오류를 발생시키면 sandwich는 nil이 됩니다.

    if let s = sandwich {
        print("Try?: 샌드위치 성공적으로 생성됨: \(s.ingredients.joined(separator: ", ")).") // 문자열 리터럴 번역
    } else {
        print("Try?: 샌드위치 생성 실패 (오류가 nil로 변환됨).") // 문자열 리터럴 번역
    }
    return sandwich
}
availableBreadSlices = 1
let s1 = tryToGetSandwichSilently(ingredients: ["치즈"], payment: 10) // 실패 (빵 부족), s1은 nil (문자열 리터럴 번역)
availableBreadSlices = 4
availableIngredients["토마토"] = 0 // 문자열 리터럴 번역
let s2 = tryToGetSandwichSilently(ingredients: ["토마토"], payment: 10) // 실패 (토마토 누락), s2는 nil (문자열 리터럴 번역)
availableIngredients["토마토"] = 2 // 문자열 리터럴 번역
let s3 = tryToGetSandwichSilently(ingredients: ["토마토", "치즈"], payment: 10) // 성공해야 함 (기계 고장 제외) (문자열 리터럴 번역)
print("s1: \(String(describing: s1)), s2: \(String(describing: s2)), s3: \(String(describing: s3))")


// 4. `try!`를 사용하여 오류 전파를 비활성화합니다.
// 던지는 함수가 런타임에 절대로 오류를 발생시키지 않을 것이라고 확신할 때만 `try!`를 사용합니다.
// 만약 오류를 발생시키면 프로그램이 충돌합니다. (옵셔널을 강제 언래핑하는 `!`와 유사).
print("\n--- try!로 처리 (매우 주의해서 사용!) ---") // 문자열 리터럴 번역
// 예시: 앱 번들에 있는 것으로 알려진 리소스 로드
// let imageData = try! Data(contentsOf: URL(fileURLWithPath: "path/to/known/image.jpg"))
// image.jpg가 없거나 경로가 잘못되면 충돌합니다.

// try!를 사용하기 전에 샌드위치 만들기가 성공할 것인지 확인합시다.
availableBreadSlices = 10
availableIngredients = ["치즈": 10, "햄": 10] // 문자열 리터럴 번역
cashInRegister = 200
// 이 try! 데모에서는 기계 고장이 없다고 가정합니다.
// (실제 코드에서는 machineBroken과 같은 임의의 오류를 가정할 수 없습니다)
// 이 예제에서는 `makeSandwich`가 임의의 오류를 발생시키지 않도록 일시적으로 수정합니다.
func makeGuaranteedSandwich(desiredIngredients: [String], payment: Int) throws -> Sandwich {
    guard availableBreadSlices >= 2 else { throw SandwichError.outOfBread }
    for ingredient in desiredIngredients {
        guard let count = availableIngredients[ingredient], count > 0 else {
            throw SandwichError.missingIngredient(ingredient: ingredient)
        }
    }
    let sandwichPrice = 5 + desiredIngredients.count
    guard payment >= sandwichPrice else {
        throw SandwichError.insufficientFunds(coinsNeeded: sandwichPrice - payment)
    }
    // 이 버전에서는 임의의 machineBroken 오류 없음
    availableBreadSlices -= 2
    for ingredient in desiredIngredients { availableIngredients[ingredient]? -= 1 }
    cashInRegister += sandwichPrice
    let newSandwich = Sandwich(ingredients: desiredIngredients, price: sandwichPrice)
    print("보장된 샌드위치 만들어짐: \(newSandwich.ingredients.joined(separator: ", ")). 가격: \(newSandwich.price).") // 문자열 리터럴 번역
    return newSandwich
}

// 이제 이러한 특정 조건에서는 실패하지 않을 것이라고 "확신"하므로 try!를 사용할 수 있습니다.
let definitelyGoodSandwich = try! makeGuaranteedSandwich(desiredIngredients: ["햄", "치즈"], payment: 20) // 문자열 리터럴 번역
print("Try!: '확실히 좋은 샌드위치' 성공적으로 얻음: \(definitelyGoodSandwich.ingredients.joined(separator: ", "))") // 문자열 리터럴 번역
// 만약 makeGuaranteedSandwich가 오류를 발생시켰다면 (예: 이전에 availableBreadSlices = 0으로 설정했다면), 이 줄에서 충돌했을 것입니다.


// --- `defer`를 사용하여 정리 작업 지정 ---
// `defer` 문은 실행이 현재 범위를 벗어나기 직전에 코드 블록을 실행합니다
// (예: 함수가 정상적으로 반환되거나, 오류가 발생하거나, 루프가 중단될 때).
// 파일 닫기와 같은 리소스 정리에 유용합니다.
// 여러 개의 `defer` 문이 있는 경우 나타난 순서의 역순으로 실행됩니다.
// 파이썬: try-except-finally의 `finally` 블록.

print("\n--- Defer 문 ---") // 문자열 리터럴 번역
enum FileError: Error { case openFailed, writeFailed, closeFailed } // 파일 오류: 열기 실패, 쓰기 실패, 닫기 실패

func processFile(filename: String, data: String) throws {
    print("파일 여는 중: \(filename)") // 문자열 리터럴 번역
    // 파일 열기 시뮬레이션 (C에서는 파일 디스크립터를 반환함)
    let fileDescriptor = 1 // 더미 디스크립터
    var fileIsOpen = true

    defer {
        // 이 블록은 processFile이 어떻게 종료되든 실행됩니다.
        print("Defer: 파일 \(filename) 닫는 중...") // 문자열 리터럴 번역
        if fileIsOpen {
            // 파일 닫기 시뮬레이션
            fileIsOpen = false
            print("Defer: 파일 \(filename) 닫힘.") // 문자열 리터럴 번역
            // 실제 C 상호 운용에서는 close() 호출도 오류를 발생시킬 수 있습니다.
            // Defer 블록 자체는 범위를 벗어나는 오류를 발생시킬 수 없습니다.
        } else {
            print("Defer: 파일 \(filename)이(가) 이미 닫혔거나 열리지 않았습니다.") // 문자열 리터럴 번역
        }
    }

    defer {
        print("Defer: 두 번째 defer 문 (위의 첫 번째 문보다 먼저 실행됨).") // 문자열 리터럴 번역
    }

    // 파일 작업 시뮬레이션
    if filename.isEmpty {
        print("오류: 파일 이름이 비어 있습니다.") // 문자열 리터럴 번역
        // 실제 시나리오에서는 이 검사 전에 열기가 실패하면 fileIsOpen이 false일 수 있습니다.
        // 이 예제에서는 파일 이름이 비어 있지 않으면 열기가 성공했다고 가정합니다.
        throw FileError.openFailed // defer 블록 트리거
    }

    print("\(filename)에 데이터 '\(data)' 쓰는 중...") // 문자열 리터럴 번역
    if data == "손상됨" { // 문자열 리터럴 번역
        print("오류: 데이터가 손상되어 쓸 수 없습니다.") // 문자열 리터럴 번역
        throw FileError.writeFailed // defer 블록 트리거
    }

    print("\(filename) 처리 완료.") // 문자열 리터럴 번역
    // 정상 종료도 defer 블록 트리거
}

do {
    try processFile(filename: "document.txt", data: "안녕하세요, Swift!") // 문자열 리터럴 번역
} catch {
    print("파일 오류 포착: \(error)") // 문자열 리터럴 번역
}
print("---")
do {
    try processFile(filename: "report.pdf", data: "손상됨") // 문자열 리터럴 번역
} catch {
    print("파일 오류 포착: \(error)") // 문자열 리터럴 번역
}
print("---")
do {
    try processFile(filename: "", data: "빈 파일 이름 테스트") // 문자열 리터럴 번역
} catch {
    print("파일 오류 포착: \(error)") // 문자열 리터럴 번역
}

// `rethrows`
// 함수나 메서드는 던지는 클로저를 매개변수로 받고 해당 클로저가 오류를 발생시키는 경우에만
// 오류를 발생시키는 경우 `rethrows`로 선언될 수 있습니다.
// 자체적으로 오류를 발생시킬 수 없습니다.
print("\n--- Rethrows ---") // 문자열 리터럴 번역
func performOperation(_ operation: () throws -> String) rethrows -> String {
    // 이 함수 자체는 오류를 발생시키지 않습니다. `operation`이 오류를 발생시키는 경우에만 다시 발생시킵니다.
    print("PerformOperation: operation 호출 예정.") // 문자열 리터럴 번역
    let result = try operation() // operation이 오류를 발생시키면 performOperation이 다시 발생시킵니다.
    print("PerformOperation: operation 성공.") // 문자열 리터럴 번역
    return "결과: " + result // 문자열 리터럴 번역
}

func successfulTask() -> String { // 오류를 발생시키지 않음
    print("SuccessfulTask: 실행 중.") // 문자열 리터럴 번역
    return "성공!" // 문자열 리터럴 번역
}

func failingTask() throws -> String { // 오류 발생
    print("FailingTask: 실행 중, 오류 발생 예정.") // 문자열 리터럴 번역
    throw SandwichError.machineBroken(reason: "전력 급증") // 문자열 리터럴 번역
}

// 오류를 발생시키지 않는 클로저로 performOperation 호출:
// successfulTask가 오류를 발생시키지 않으므로 performOperation이 다시 발생시키지 않기 때문에 `try`가 필요하지 않습니다.
let r1 = performOperation(successfulTask)
print(r1)

// 오류를 발생시키는 클로저로 performOperation 호출:
// failingTask가 오류를 발생시킬 수 있으므로 performOperation이 다시 발생시킬 수 있기 때문에 `try`가 필요합니다.
do {
    let r2 = try performOperation(failingTask)
    print(r2) // 도달하지 않음
} catch {
    print("performOperation(failingTask)에서 오류 포착: \(error)") // 문자열 리터럴 번역
}
```
