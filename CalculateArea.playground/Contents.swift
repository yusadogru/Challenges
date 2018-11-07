import Foundation
import XCTest


// Calculate total area of two rectangles
//
//         ______________(R,S)
//         |            |
//    _____|_____(M,N)  |
//    |    |    |       |
//    |    |____|_______|
//    |  (P,Q)  |
//    |         |
//    |_________|
// (K,L)
//
// K < M, L < N, P < R, Q < S


func calculateArea(K: Int, L: Int, M: Int, N: Int, P: Int, Q: Int, R: Int, S: Int) -> Int {
    let area = abs(M - K) * abs(N - L)
    let arae2 = abs(P - R) * abs(Q - S)
    
    let x1 = max(K, P)
    let x2 = min(M, R)
    let y1 = max(L, Q)
    let y2 = min(N, S)
    
    var intersectionArea = 0
    if x1 < x2 && y1 < y2 {
        intersectionArea = abs(x2 - x1) * abs(y2 - y1)
    }
    
    let totalArea = area + arae2 - intersectionArea
    return totalArea
}

// MARK: Test
class Tests: XCTestCase {
    func testCalculateArea() {
        var area = calculateArea(K: 5, L: 5, M: 15, N: 15, P: 10, Q: 10, R: 20, S: 20)
        XCTAssertEqual(area, 175)
        
        area = calculateArea(K: 5, L: 5, M: 15, N: 15, P: 25, Q: 10, R: 30, S: 20)
        XCTAssertEqual(area, 150)
        
        area = calculateArea(K: -5, L: 5, M: 5, N: 15, P: 0, Q: 10, R: 10, S: 20)
        XCTAssertEqual(area, 175)
        
        area = calculateArea(K: -10, L: -10, M: 20, N: 20, P: 0, Q: 0, R: 10, S: 10)
        XCTAssertEqual(area, 900)
        
        area = calculateArea(K: -10, L: -10, M: 20, N: 20, P: 20, Q: -10, R: 50, S: 20)
        XCTAssertEqual(area, 1800)
        
        area = calculateArea(K: 5, L: -15, M: 10, N: -5, P: 7, Q: -20, R: 9, S: -10)
        XCTAssertEqual(area, 60)
    }
}

Tests.defaultTestSuite.run()
