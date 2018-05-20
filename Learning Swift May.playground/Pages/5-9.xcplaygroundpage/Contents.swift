import Foundation


protocol SomeClassOnlyProtocol: class {
    // 클래스 전용 프로토콜
    // 메소드 정의할 시 mutating 키워드 붙일 수 없음(구조체나 열거형이 구현할 수 없는 클래스 전용 프로토콜에서는 사용할 필요가 없음)
    // 다른 프로토콜 상속 받을 경우, 프로토콜 이름 나열하기 전에 class 키워드를 맨 앞에 작성해야함
    
}

// optional
// Optional Requirement
// @objc - objective-c 코드에서도 참조할 수 있도록 노출 / 구조체, 열거형 구현 불가.


@objc
protocol MsgDelegate {
    @objc optional func onReceive(new:Int)
}

class MsgCenter {
    var delegate: MsgDelegate?
    var newMsg: Int = 0
    
    func msgCheck()  {
        if newMsg > 0 {
            // optional 키워드가 붙은 메소드를 호출할 때, optional chain 처럼 사용할 것.
            self.delegate?.onReceive?(new: self.newMsg)
            self.newMsg = 0
        }
    }
    
}

class Watch: MsgDelegate {
    var msgCenter: MsgCenter?
    init(msgCenter: MsgCenter) {
        self.msgCenter = msgCenter
    }
    func onReceive(new: Int) {
        print("\(new) 건의 메시지가 도착했습니다.")
    }
    
}



