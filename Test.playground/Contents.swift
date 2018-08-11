//: Playground - noun: a place where people can play

import Foundation

//2. 만약 10, [2, 3, 8, 7] 을 인자로 받았을 경우 트럭의 최대용량은 10, 각 짐들의 무게는 2, 3, 8, 7 이다.
//3. 차례대로 2, 3을 싣고 8을 싣고 7을 싣는 경우라면 3대의 차가 필요하다. 하지만, 2, 8을 싣고 3, 7을 싣는 방법이라면 2대의 차가 필요하다. 즉 위와 같은 인자를 받았을 경우 답은 2가 된다.
//4. 트럭이 짐을 모두 싣고 가지 못하는 경우 -1을 반환한다.


class main {
    //    var m: Int = 10
    //    var m = 10
    //    var array: Array<Any>
    
    
    func solution(max m: Int, array a: [Int]) -> Int {
        var t = 0
        var count = 0
        //        let a = [2, 3, 8, 7]
        var n: Int = 0

        
        
        while a.count >= count {
//            n = a.reduce(0, +)
            n += a[count]
            count += 1
//            NSLog("\(n)" )
            print("\(n)")
            if (n > m) {
                t += 1
                print("\(t)gggg")
                break
            }
           
//            break
        }
        
//        if (m == n) {
//            t += 1
//        }
        return t
    }
    
    
}
let t = main()
//t.solution(max: 30, array: [2, 3, 4, 10, 12])
t.solution(max: 30, array: [2,3,4,5,10,20,30])
