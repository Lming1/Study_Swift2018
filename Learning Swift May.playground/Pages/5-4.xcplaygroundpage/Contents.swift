import Foundation

// Enumeration

// 집단 자료형 : 할당 개념
// 열거형 : 정의 개념

// 컴파일러가 미리 인지할 수 있고 없고의 차이. 런타임 오류, 컴파일 오류 차이

enum Direction {
    
    // swift 3부터 enum 멤버는 소문자로 시작함.
    case north
    case south
    case east, west
}

let N = Direction.north
let S = Direction.south
let E = Direction.east
let W = Direction.west

//var directionToHead: Direction = Direction.west
var directionToHead: Direction = .west
//directionToHead = .east


switch directionToHead {
case .north:
    print("북쪽")
case .south:
    print("남쪽")
case .east:
    print("동쪽")
case .west:
    print("서쪽")
}

enum HTTPCode: Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
    
    var value: String {
        return "HTTPCode number is \(self.rawValue)"
    }
    
    func getDescription() -> String {
        switch self {
        case .OK:
            return "응답 성공. HTTP 코드는 \(self.rawValue)입니다."
        case .NOT_MODIFY:
            return "변경된 내역이 없습니다. HTTP 코드는 \(self.rawValue)입니다."
        case .INCORRECT_PAGE:
            return "존재하지 않는 페이지입니다. HTTP 코드는 \(self.rawValue)입니다."
        case .SERVER_ERROR:
            return "서버 에러입니다. HTTP 코드는 \(self.rawValue)입니다."
        }
    }
        
    static func getName() -> String {
        return "This Enum is HTTPCode"
    }
    
}


//HTTPCode.OK.rawValue
var response = HTTPCode.OK
response = .NOT_MODIFY

response.value
response.getDescription()
HTTPCode.getName()



enum Rank: Int {
    case one = 1
    case two, three, four, five
}

Rank.two.rawValue


enum ImageFormat {
    case JPEG
    case PNG(Bool)
    case GIF(Int, Bool)
}



var newImage = ImageFormat.PNG(true)
newImage = .GIF(256, false)

