let A : Set = [1, 3, 5, 7, 9]
let B : Set = [3, 5]
let C : Set = [3, 5]
let D : Set = [2, 4, 6]

B.isSubset(of: A)
A.isSuperset(of: B)
C.isStrictSubset(of: A)
C.isStrictSubset(of: B)
A.isDisjoint(with: D)

var E = [4, 2, 5, 1, 7, 4, 9, 11, 3, 5, 4]
//let F = Set(E)
//E = Array(F)

//중복 제거 -> 집합 -> 배열
E = Array(Set(E))

//튜플
let tupleValue = ("a", "b", 1, 2.5, true)
tupleValue.0
tupleValue.1
tupleValue.2
tupleValue.3
tupleValue.4

// 튜플 어노테이션 정의 (타입 추론에서 원치않는 타입으로 추론되는 것을 방지하기 위해 사용)

var tpl01 : (Int, Int) = (100, 200)
var tpl02 : (Int, String, Int) = (100, "a", 200)
var tpl03 : (Int, (String, String)) = (100, ("t", "v"))
var tpl04 : (String) = ("sample string")

tpl01.0

let tupleValue1:(String, Character, Int, Float, Bool) = ("a", "b", 1, 2.5, true)

// 튜플 바인딩
let tupleValue2:(String, Character, Int, Float, Bool) = ("c", "d", 3, 3.14, false)
let (a, b, c, d, e) = tupleValue2

print(a)
print(b)
print(c + 2)
print(d * 2)
print(e)

// 결과 값으로 튜플을 반환하는 함수

func getTupleVaule() -> (String, String, Int)
{
    return ("t", "v", 100)
}

let (f,g,_) = getTupleVaule()
