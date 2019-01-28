import UIKit

class CalculateRisk {
   static func calculateRisk(p: Double?,q: Double?) -> String{
        var other: String = ""
        if var dominant = p {
            if dominant > 1 {
                dominant = dominant/100
            }
            let squareRootOfP = sqrt(dominant).rounded(toPosition: 2)
            let q = 1 - squareRootOfP
            let qPercentage = (q * q).rounded(toPosition: 2)
            let pq = (2 * (squareRootOfP * q)).rounded(toPosition: 2)
            let sum = dominant + qPercentage + pq
            other = "the square root of p is equal to \(squareRootOfP ) which means the probability of homozygous recessive is \((qPercentage * 100).rounded(toPosition: 2)) and heterozygous is \((pq * 100).rounded(toPosition: 2)) giving a sum of \(sum)"
        }
        if var recessive = q {
            
            if recessive > 1 {
                recessive = recessive/100
            }
            let squareRootOfQ = sqrt(recessive).rounded(toPosition:  2)
            let p = (1 - squareRootOfQ).rounded(toPosition:  2)
            let pPercentage = (p * p).rounded(toPosition:  2)
            let pq = (2 * (p * squareRootOfQ)).rounded(toPosition:  2)
            let sum = recessive + pPercentage + pq
            other = "the square root of q is equal to \(squareRootOfQ) which means the probability of homozygous dominant is \((pPercentage * 100).rounded(toPosition: 2)) percent and heterozygous is \((pq * 100).rounded(toPosition: 2)) percent giving a sum of \(sum)"
        }
    
    if p != nil && q != nil {
        other = "please use either p or q, not both"
    }
        
        return other
    }
}

extension Double {
    func rounded(toPosition number:Int) -> Double {
        let dividedBy = pow(10.0, Double(number)) // means 10 to the power of number
        let roundsTo = (self * dividedBy).rounded() / dividedBy
        return roundsTo
    }
}

let test = CalculateRisk.calculateRisk(p: nil, q: 7 )

print(test)
