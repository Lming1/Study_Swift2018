import Foundation
let arr = [1, 2, 3, 4, 5]
let k = 1
func findNumber(arr: [Int], k: Int) -> String {
    
    
    if arr.contains(k){
        return "Yes"
    } else {
        return "NO"
    }
}


findNumber(arr: arr, k: k)

var l = 2
var r = 9


func oddNumbers(l: Int, r: Int) -> [Int] {
    var odds = [Int]()
    for number in l...r where number % 2 == 1 {
        odds.append(number)
    }
    return odds
}


oddNumbers(l: l, r: 9)



var n = 5

for i in 1...n{
    var result = ""
    for _ in n - i ..< n{
        result += "*"
    }
    for _ in 0 ..< n - i {
        result += " "
    }
    print(result)
}


var array = [4, 5, 6, 1, 2]

for i in array.sorted() {
    print(i)
}
