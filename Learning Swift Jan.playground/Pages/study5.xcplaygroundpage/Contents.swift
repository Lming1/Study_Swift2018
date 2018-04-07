// 옵셔널

let num = Int("123")
//var num : Int?
//num = ("123")
print(num)

var optInt : Int?
optInt = 3

var optStr : String?
optStr = "Swift"

var optDouble : Double?

var optArray : [String]?
optArray = ["C", "JAVA", "Objective-C", "SmallTalk"]

var optDic : Dictionary<String, Int>?
optDic = ["국어" : 94, "수학" : 88, "영어" : 96]

var optDic2: [String:String]?

var optClass : AnyObject?


// 옵셔널 언래핑

// 옵셔널 강제해제
print("옵셔널 자체 값 : \(optInt)")
print("옵셔널 강제 해제한 값 : \(optInt!)")

optInt! + 2

var str = "Swift"
var intFromStr = Int(str)

if intFromStr != nil {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr!) 입니다.")
} else {
    print("값 변환에 실패하였습니다.")
}

//옵셔널 바인딩

var str1 = "Swift"
if let intFromStr1 = Int(str1) {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr1)입니다.")
} else {
    print("값 변환에 실패했습니다.")
}


func intStr(str: String) {
    guard let intFromStr = Int(str) else {
        print("값 변환에 실패하였습니다...")
        return
    }
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr)입니다.")
}









