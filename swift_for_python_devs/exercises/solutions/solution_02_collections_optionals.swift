// 연습문제 02 해답: 컬렉션 및 옵셔널

// 1. 배열:
print("--- 1. 배열 ---") // 문자열 리터럴 번역
//    a. `String` 타입의 배열 `favoriteFruits`를 만들고 좋아하는 과일 세 가지로 초기화하세요.
var favoriteFruits: [String] = ["사과", "바나나", "망고"] // 문자열 리터럴 번역 (예시)
print("a. 초기 과일: \(favoriteFruits)") // 문자열 리터럴 번역

//    b. 배열의 두 번째 과일을 출력하세요.
if favoriteFruits.count > 1 {
    print("b. 두 번째 과일: \(favoriteFruits[1])") // 문자열 리터럴 번역
} else {
    print("b. 배열에 두 번째 과일이 없습니다.") // 문자열 리터럴 번역
}

//    c. 배열 끝에 다른 과일을 추가하세요.
favoriteFruits.append("딸기") // 문자열 리터럴 번역 (예시)
print("c. 추가 후: \(favoriteFruits)") // 문자열 리터럴 번역

//    d. 배열 시작 부분에 과일을 삽입하세요.
favoriteFruits.insert("오렌지", at: 0) // 문자열 리터럴 번역 (예시)
print("d. 시작 부분에 삽입 후: \(favoriteFruits)") // 문자열 리터럴 번역

//    e. 배열에 있는 총 과일 수를 출력하세요.
print("e. 총 과일 수: \(favoriteFruits.count)") // 문자열 리터럴 번역

//    f. 인덱스 2에 있는 과일을 제거하세요.
if favoriteFruits.count > 2 {
    let removedFruit = favoriteFruits.remove(at: 2) // 오렌지, 사과, 바나나, 망고, 딸기 -> 바나나 제거
    print("f. 인덱스 2의 과일 제거됨 ('\(removedFruit)'): \(favoriteFruits)") // 문자열 리터럴 번역
} else {
    print("f. 인덱스 2에서 제거할 요소가 충분하지 않습니다.") // 문자열 리터럴 번역
}


//    g. 업데이트된 배열을 출력하세요.
print("g. 업데이트된 배열: \(favoriteFruits)") // 문자열 리터럴 번역


// 2. 딕셔너리:
print("\n--- 2. 딕셔너리 ---") // 문자열 리터럴 번역
//    a. 키가 `String`(국가 이름)이고 값이 `String`(수도 이름)인 딕셔너리 `capitals`를 만드세요.
//       최소 세 개의 국가-수도 쌍으로 초기화하세요.
var capitals: [String: String] = [
    "프랑스": "파리", // 문자열 리터럴 번역
    "일본": "도쿄",   // 문자열 리터럴 번역
    "캐나다": "오타와" // 문자열 리터럴 번역
]
print("a. 초기 수도: \(capitals)") // 문자열 리터럴 번역

//    b. 키를 사용하여 국가 중 하나의 수도를 출력하세요. 옵셔널 바인딩 또는 nil-병합 연산자를 사용하여 키가 존재하지 않을 수 있는 경우를 처리하세요.
let country = "일본" // 문자열 리터럴 번역
if let capital = capitals[country] {
    print("b. \(country)의 수도 (옵셔널 바인딩): \(capital)") // 문자열 리터럴 번역
} else {
    print("b. \(country)의 수도를 찾을 수 없습니다.") // 문자열 리터럴 번역
}
// nil-병합 연산자를 사용한 대안
let capitalOfGermany = capitals["독일"] ?? "찾을 수 없음" // 문자열 리터럴 번역
print("b. 독일의 수도 (nil-병합): \(capitalOfGermany)") // 문자열 리터럴 번역


//    c. 딕셔너리에 새 국가와 수도를 추가하세요.
capitals["브라질"] = "브라질리아" // 문자열 리터럴 번역
print("c. 브라질 추가 후: \(capitals)") // 문자열 리터럴 번역

//    d. 기존 국가 중 하나의 수도를 업데이트하세요.
capitals["캐나다"] = "새 오타와 (업데이트됨)" // 또는 capitals.updateValue("새 오타와 (업데이트됨)", forKey: "캐나다") (문자열 리터럴 번역)
print("d. 캐나다 업데이트 후: \(capitals)") // 문자열 리터럴 번역

//    e. 딕셔너리에서 국가를 제거하세요.
let removedCapital = capitals.removeValue(forKey: "프랑스") // 문자열 리터럴 번역
print("e. 프랑스 제거됨 (수도는 \(removedCapital ?? "해당 없음")이었음). 현재: \(capitals)") // 문자열 리터럴 번역

//    f. 딕셔너리를 반복하면서 각 국가와 수도를 "[국가]의 수도는 [수도]입니다." 형식으로 출력하세요.
print("f. 딕셔너리 반복:") // 문자열 리터럴 번역
for (country, capital) in capitals {
    print("   \(country)의 수도는 \(capital)입니다.") // 문자열 리터럴 번역
}


// 3. 세트:
print("\n--- 3. 세트 ---") // 문자열 리터럴 번역
//    a. 일부 중복되고 일부 고유한 숫자를 가진 두 개의 정수 세트 `setA`와 `setB`를 만드세요.
//       `setA` = {1, 2, 3, 4, 5}
//       `setB` = {4, 5, 6, 7, 8}
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [4, 5, 6, 7, 8]
print("a. 세트 A: \(setA.sorted()), 세트 B: \(setB.sorted())") // 문자열 리터럴 번역

//    b. `setA`와 `setB` 모두의 모든 요소를 포함하는 새 세트 `unionSet`을 만드세요. (일관된 출력을 위해 정렬하여) 출력하세요.
let unionSet = setA.union(setB)
print("b. 합집합: \(unionSet.sorted())") // 문자열 리터럴 번역

//    c. `setA`와 `setB` 모두에 공통적인 요소만 포함하는 새 세트 `intersectionSet`을 만드세요. (정렬하여) 출력하세요.
let intersectionSet = setA.intersection(setB)
print("c. 교집합: \(intersectionSet.sorted())") // 문자열 리터럴 번역

//    d. `setA`에는 있지만 `setB`에는 없는 요소를 포함하는 새 세트 `differenceSet`을 만드세요. (정렬하여) 출력하세요.
let differenceSet = setA.subtracting(setB) // A에 있고 B에는 없는 요소
print("d. 차집합 (A - B): \(differenceSet.sorted())") // 문자열 리터럴 번역

//    e. `setA`가 `{1, 2}`의 상위 집합인지 확인하세요. 결과를 출력하세요.
let subsetToCheck: Set<Int> = [1, 2]
let isSuperset = setA.isSuperset(of: subsetToCheck)
print("e. 세트 A가 {1, 2}의 상위 집합입니까? \(isSuperset)") // 문자열 리터럴 번역


// 4. 옵셔널:
print("\n--- 4. 옵셔널 ---") // 문자열 리터럴 번역
//    a. 옵셔널 정수 `optionalAge`를 선언하고 초기화하지 마세요.
var optionalAge: Int?
// print(optionalAge) // "nil" 출력

//    b. 옵셔널 바인딩 (`if let`)을 사용하여 `optionalAge`에 값이 있는지 확인하세요.
//       값이 있으면 "나이: [값]"을 출력하고, 없으면 "나이가 지정되지 않았습니다."를 출력하세요.
if let age = optionalAge {
    print("b. 나이: \(age)") // 문자열 리터럴 번역
} else {
    print("b. 나이가 지정되지 않았습니다.") // 문자열 리터럴 번역
}

//    c. `optionalAge`에 값(예: 25)을 할당하세요.
optionalAge = 25
print("c. optionalAge에 25 할당됨.") // 문자열 리터럴 번역

//    d. 강제 언래핑 (`!`)을 사용하여 `optionalAge`의 값을 출력하세요. (연습을 위해 이 작업을 수행하기 전에 값이 있는지 확인하되 위험성을 인지하세요).
//    위험성 인지: 강제 언래핑은 optionalAge가 nil이면 충돌합니다.
if optionalAge != nil {
    print("d. 나이 (강제 언래핑됨): \(optionalAge!)") // 문자열 리터럴 번역
} else {
    print("d. 강제 언래핑할 수 없음, optionalAge가 nil입니다 (이 부분은 이 특정 흐름에서 이상적으로 도달해서는 안 됩니다).") // 문자열 리터럴 번역
}


//    e. 다른 옵셔널 정수 `anotherOptionalAge`를 선언하고 값으로 초기화하세요.
var anotherOptionalAge: Int? = 30

//    f. Nil-병합 연산자 (`??`)를 사용하여 `anotherOptionalAge`가 `nil`인 경우 기본값 0을 제공하고 결과를 출력하세요.
//       그런 다음 `anotherOptionalAge`를 `nil`로 설정하고 nil-병합 연산자를 사용하여 결과를 다시 출력하세요.
print("f. 다른 옵셔널 나이 (값이 있음): \(anotherOptionalAge ?? 0)") // 문자열 리터럴 번역
anotherOptionalAge = nil
print("f. 다른 옵셔널 나이 (nil로 설정됨): \(anotherOptionalAge ?? 0)") // 문자열 리터럴 번역


// 5. 옵셔널 체이닝:
print("\n--- 5. 옵셔널 체이닝 ---") // 문자열 리터럴 번역
//    `Address?` 타입의 옵셔널 프로퍼티 `address`를 가진 간단한 구조체 `User`를 정의하세요.
//    `String?` 타입의 옵셔널 프로퍼티 `streetName`을 가진 다른 구조체 `Address`를 정의하세요.
struct Address {
    var streetName: String?
}
struct User {
    var name: String
    var address: Address?
}

//    a. `User` 인스턴스를 만드세요.
let user1 = User(name: "사용자1", address: nil) // 문자열 리터럴 번역

//    b. 옵셔널 체이닝을 사용하여 `streetName`을 출력해보세요. 어느 시점에서든 `nil`이면 충돌해서는 안 됩니다.
//       "도로명: [이름]" 또는 "도로명을 사용할 수 없습니다."와 같은 메시지를 출력하세요.
if let street = user1.address?.streetName {
    print("b. 사용자1 도로명: \(street)") // 문자열 리터럴 번역
} else {
    print("b. 사용자1 도로명을 사용할 수 없습니다.") // 문자열 리터럴 번역
}

//    c. 다른 `User` 인스턴스를 만들고, 이번에는 `Address` 인스턴스도 만들되 `streetName`은 `nil`로 두세요. 도로명을 출력하세요.
let user2 = User(name: "사용자2", address: Address(streetName: nil)) // 문자열 리터럴 번역
if let street = user2.address?.streetName {
    print("c. 사용자2 도로명: \(street)") // 문자열 리터럴 번역
} else {
    print("c. 사용자2 도로명을 사용할 수 없습니다 (주소는 있지만 도로명은 nil).") // 문자열 리터럴 번역
}

//    d. 세 번째 `User` 인스턴스를 만들고, `Address`와 `streetName`을 제공하세요. 도로명을 출력하세요.
let user3 = User(name: "사용자3", address: Address(streetName: "123 메인 스트리트")) // 문자열 리터럴 번역
if let street = user3.address?.streetName {
    print("d. 사용자3 도로명: \(street)") // 문자열 리터럴 번역
} else {
    print("d. 사용자3 도로명을 사용할 수 없습니다 (이런 일은 없어야 함).") // 문자열 리터럴 번역
}
// 또는 표시를 위해 nil-병합과 함께 더 직접적으로:
let user3Street = user3.address?.streetName ?? "도로명이 지정되지 않음" // 문자열 리터럴 번역
print("d. 사용자3 도로 (?? 직접 사용): \(user3Street)") // 문자열 리터럴 번역
```
