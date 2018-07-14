//: Playground - noun: a place where people can play
func solve(a: [Int], b: [Int]) -> [Int] {
    var alice = a
    var bob = b
    
    var score_alice = 0
    var score_bob = 0
    
    for i in 0...2 {
        if (alice[i] > bob[i]) {
            score_alice += 1
        }
        if (alice[i] < bob[i]) {
            score_bob += 1
        }
    }
    return [score_alice, score_bob]
    
}


solve(a: [2,3,4], b: [4,3,2])
func aVeryBigSum(ar: [Int]) -> Int {
    var sum = 0
    
    for i in ar {
        sum += i
    }
    return sum
}


aVeryBigSum(ar: [1000000001, 1000000002, 1000000003, 1000000004, 1000000005])


func diagonalDifference(arr: [[Int]]) -> Int {
    var preimaryDiagonalSum = 0
    var secondaryDiagonalSum = 0
    for index in 0..<n {
        preimaryDiagonalSum = preimaryDiagonalSum + arr[index][index]
        secondaryDiagonalSum = secondaryDiagonalSum + arr[index][n-index-1]
    }
    
    print(abs(preimaryDiagonalSum - secondaryDiagonalSum))
    
}
