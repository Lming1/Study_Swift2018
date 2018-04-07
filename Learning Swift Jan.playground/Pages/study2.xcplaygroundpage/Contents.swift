var oddDigits : Set = [ 1 , 3 , 5 , 7 , 9]
let evenDigits : Set = [ 0 , 2 , 4 , 6 , 8 ]
let primeDigits : Set = [ 2 , 3 , 5 , 7 ]
// 교집합
oddDigits.intersection(evenDigits).sorted()
// 배타적 합집합
oddDigits.symmetricDifference(primeDigits).sorted()
// 합집합
oddDigits.union(evenDigits).sorted()
// 차집합
oddDigits.subtract(primeDigits)
oddDigits.sorted()

