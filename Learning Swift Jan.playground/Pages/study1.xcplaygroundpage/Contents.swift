//: Playground - noun: a place where people can play


//static 배열선언
var cities = ["Seoul", "New York", "LA", "Santiago"]
var genres : Set = ["Classsic", "Rock", "Balad"]
var countries : [String]
countries = [String]()
var list = [String]()
list.append("city")
list.append("home")
list.insert("test", at: 0)
list.append(contentsOf: ["korea", "ruby"])
var temps : [Int] = []
let length = cities.count
cities[0]
cities[1]
cities[2]
cities[3]

cities
//cities.count
// 배열순회 첫번째
for i in 0..<length {
    print("\(i)번째 배열 원소는 \(cities[i])입니다")
}

//// 배열순회 두번째 - 이터레이터
//
//for row in cities {
//    let index = cities.index(of: row)
//    print("\(index!)번째 배열 원소는 \(row)입니다")
//}
//
//if list.isEmpty {
//    print("배열이 비어있다")
//}else{
//    print("배열에는 \(list.count)개의 아이템이 저장되어 있습니다.")
//}

for g in genres.sorted() {
    print("\(g)")
}

if let removedItem = genres.remove("Rock") {
    print("아이템 \(removedItem)의 삭제가 완료되었습니다")
}else{
    print("삭제할 값이 집합에 추가되어 있지 않습니다.")
}
// 집합의 모든 아이템 삭제
genres.removeAll()

// 집합 아이템 추가
genres.insert("hello")

if genres.isEmpty {
    print("모든 아이템이 삭제되었습니다.")
}else{
    print("아직 \(genres.count)개의 아이템이 남아있습니다.")
}

// 집합에 특정 아이템이 있는지 확인하는 contains
if genres.contains("hello") {
    print("hello item이 저장되어 있다.")
} else{
    print("hello item이 저장되어 있지 않다.")
}
