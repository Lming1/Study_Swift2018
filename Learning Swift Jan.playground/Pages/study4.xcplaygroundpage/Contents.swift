var capital = ["KR" : "Seoul", "EN" : "London", "FR":"Paris"]

capital["KR"]
capital["EN"]
capital["FR"]


// 딕셔너리 선언
//Dictionary<String, Int>()

//var capital1 = Dictionary<String, String>()
//var capital2 = [String : String]()

var capital1 : Dictionary<String, String>
capital1 = Dictionary()

var capital2 : [String : String]
capital2 = [String : String]()

var newCapital = [String : String]()
newCapital["JP"] = "Tokyo"

if newCapital.isEmpty {
    print("비어있습니다.")
}else {
    print("딕셔너리의 크기는 현재 \(newCapital.count)입니다.")
}

newCapital.updateValue("Seoul", forKey: "KR")
newCapital.updateValue("London", forKey: "EN")
newCapital.updateValue("Sapporo", forKey: "JP")

newCapital.updateValue("Ottawa", forKey: "CA")
newCapital.updateValue("Beijing", forKey: "CN")

newCapital["CN"] = nil
//newCapital.removeValue(forKey: "CA")
if let removedValue = newCapital.removeValue(forKey: "CA")
{
    print("삭제된 값은 \(removedValue)입니다.")
} else{
    print("아무 것도 삭제되지 않았습니다. ")
}


//for row in newCapital {
//    let (key, value) = row
//    print("현재 데이터는 \(key) : \(value)입니다.")
//}

for (key, value) in newCapital {
    print("현재 데이터는 \(key) : \(value)입니다.")
}






