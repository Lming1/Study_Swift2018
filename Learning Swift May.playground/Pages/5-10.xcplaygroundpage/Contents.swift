import Foundation


enum DateParseError: Error {
    case overSizeString
    case underSizeString
    case incorrectFormat(part: String)
    case incorrectData(part: String)
}


struct Date {
    var year: Int
    var month: Int
    var date: Int
}

func parseDate(param: NSString) throws -> Date {
    guard param.length == 10 else {
        if param.length > 10 {
            throw DateParseError.overSizeString
        } else {
            throw DateParseError.underSizeString
        }
    }
    
    var dateResult = Date(year: 0, month: 0, date: 0)
    
    if let year = Int(param.substring(with: NSRange(location: 0, length: 4))) {
        dateResult.year = year
    } else {
        throw DateParseError.incorrectFormat(part: "year")
    }
    
    if let month = Int(param.substring(with: NSRange(location: 5, length: 2))) {
        guard month > 0 && month < 13 else {
            throw DateParseError.incorrectData(part: "month")
        }
        dateResult.month = month
    } else {
        throw DateParseError.incorrectFormat(part: "month")
    }
    
    if let date = Int(param.substring(with: NSRange(location: 8, length: 2))) {
        guard date > 0 && date < 32 else {
            throw DateParseError.incorrectData(part: "date")
        }
        dateResult.date = date
    } else {
        throw DateParseError.incorrectFormat(part: "date")
    }
    
    return dateResult
}

func getPartsDate(date: NSString, type: String) {
    do {
        let date = try parseDate(param: date)
        switch type {
        case "year":
            print("\(date.year)년")
        case "month":
            print("\(date.month)월")
        case "date":
            print("\(date.date)일")
        default:
            print("값을 잘못 입력했다. 다시 확인해라.")
        }
    } catch DateParseError.overSizeString {
        print("입력된 문자열이 너무 길어.")
    } catch DateParseError.underSizeString {
        print("입력된 문자열이 너무 짧아.")
    } catch DateParseError.incorrectFormat(let part){
        print("입력 값의 \(part)에 해당하는 형식이 잘못되었다.")
    } catch DateParseError.incorrectData(let part) {
        print("입력 값의 \(part)에 해당하는 값을 잘못 사용했으니 확인해봐.")
    } catch {
        print("내가 해결할 수 없는 오류.")
    }
}


getPartsDate(date: "2015-05-04", type: "month")
