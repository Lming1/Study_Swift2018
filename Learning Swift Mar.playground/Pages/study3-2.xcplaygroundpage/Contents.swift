struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        return "Resolution 구조체"
    }
    
}

class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    var res = Resolution()
    func desc() -> String {
        return "VideoMode Class"
    }
}

let insRes = Resolution()

let width = insRes.width
print("insRes 인스턴스의 width 값은 \(width)입니다.")

let vMode = VideoMode()
vMode.name = "Sample"
vMode.res.width = 1280
print("\(vMode.name!) 인스턴스의 width 값은 \(vMode.res.width)입니다.")

let defaultRes = Resolution(width: 1024, height: 768)

print("width:\(defaultRes.width), height: \(defaultRes.height)")

