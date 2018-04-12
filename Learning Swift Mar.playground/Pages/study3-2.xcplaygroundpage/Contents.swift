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

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema instance의 width 값은 \(cinema.width)입니다.")
print("hd instance의 width 값은 \(hd.width)입니다.")

let video = VideoMode()
video.name = "Original Video Instance"
print("video 인스턴스 name 값은 \(video.name!)입니다.")

let dvd = video
dvd.name = "DVD Video Instance"
print("video 인스턴스 name 값은 \(video.name!)입니다.")

func changeName(v: VideoMode) {
    v.name = "Function Video Instance"
}

changeName(v: video)
print("video 인스턴스 name 값은 \(video.name!)입니다.")

if (video === dvd) {
    print("동일 VideoMode 인스턴스 참조")
} else {
    print("다른 인스턴스 참조")
}


