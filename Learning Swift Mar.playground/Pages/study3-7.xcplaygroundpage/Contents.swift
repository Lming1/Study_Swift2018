import Foundation

// willSet : 프로퍼티의 값이 변경되기 직전에 호출되는 옵저버
// didSet : 프로퍼티의 값이 변경된 직후에 호출되는 옵저버

//var <프로퍼티명> : <타입> [ = <초기값> ] {
//    wilSet [(<인자명>)] {
//        <프로퍼티 값이 변경되기 전에 실행할 내용>
//    }
//}

//[]는 생략 가능
// 값의 변화를 주시하고 있어야 할 때, 혹은 값의 변화에 따른 처리가 필요할 때 요긴하게 사용되는 기능

struct Job {
    var income: Int = 0 {
    willSet(newIncome){
            print("이번달 월급은 \(newIncome)원 입니다.")
        }
        didSet {
            if income > oldValue {
                print("월급이 \(income - oldValue)원 증가하셨네요. 소득세가 상향조정될 예정입니다.")
            } else {
                print("저런, 월급이 삭감되었군요. 이직하실 때가 온 것 같습니다.")
            }
        }
    }
}

var job = Job(income: 1000000)
job.income = 2000000
job.income = 1500000

