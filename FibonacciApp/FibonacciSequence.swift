//
//  FibonacciSequence.swift
//  FibonacciApp
//
//  Created by Marius on 5/4/15.
//  Copyright (c) 2015 Marius Mukunzi. All rights reserved.
//

import UIKit


class FibonacciSequence {
    
    let includesZero: Bool
    let values: [UInt64]
    
    init(maxNumber: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        //TODO: Create an array which contains the numbers in the Fibonacci sequence, but don't add any numbers to the array which exceed the maxNumber. For example, if the maxNumber is 10 then the array should contain [0,1,1,2,3,5,8] because the next number is 13 which is higher than the maxNumber. If includesZero is false then you should not include the number 0 in the sequence.
        self.values = [0,1]
        
        var next:UInt64 = 0
        while next <= maxNumber{
            var last:UInt64 = self.values.last!
            var lastLast = self.values[self.values.count-2]
            next = last + lastLast
            //self.values.append(next)
            if next <= maxNumber { // for some reason this does get checked in the while loop
                self.values.append(next)
            }
        }
        // check zero include
        if !self.includesZero{
            self.values.removeAtIndex(0)
        }
        
    }
    
    init(numberOfItemsInSequence: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        //TODO: Create an array which contains the numbers in the Fibonacci sequence, and the array should contain this many items: numberOfItemsInSequence. For example, if numberOfItemsInSequence is 10 then the array should contain [0,1,1,2,3,5,8,13,21,34] if inlcudesZero is true, or [1,1,2,3,5,8,13,21,34,55] if includesZero is false.
        self.values = [0,1]
        var next:UInt64 = 0
        for index in 0..<numberOfItemsInSequence - 2{
            let last = self.values.last!
            let lastLast = self.values[self.values.count-2]
            let (next, didOverflow) = UInt64.addWithOverflow(last, lastLast)
            if didOverflow == true {
                println("Overflow! The next number is too big to store in a UInt!")
                break
            }
            //next = last + lastLast
            self.values.append(next)
        }
        // check zero include
        if !self.includesZero{
            self.values.removeAtIndex(0)
        }
    }
}

//class FibonacciSequence {
//    
//    let includesZero: Bool
//    let values: [UInt]
//    
//    init(maxNumber: UInt, includesZero: Bool) {
//        self.includesZero = includesZero
//        if maxNumber == 0 && includesZero == false {
//            values = []
//        } else if maxNumber == 0 {
//            values = [0]
//        } else {
//            var sequence: [UInt] = [0,1,1]
//            var nextNumber: UInt = 2
//            while nextNumber <= maxNumber {
//                sequence.append(nextNumber)
//                let lastNumber = sequence.last!
//                let secondToLastNumber = sequence[sequence.count-2]
//                let (sum, didOverflow) = UInt.addWithOverflow(lastNumber, secondToLastNumber)
//                if didOverflow == true {
//                    println("Overflow! The next number is too big to store in a UInt!")
//                    break
//                }
//                nextNumber = sum
//            }
//            if includesZero == false {
//                sequence.removeAtIndex(0)
//            }
//            values = sequence
//        }
//    }
//    
//    init(numberOfItemsInSequence: UInt, includesZero: Bool) {
//        self.includesZero = includesZero
//        if numberOfItemsInSequence == 0 {
//            values = []
//        } else if numberOfItemsInSequence == 1 {
//            if includesZero == true {
//                values = [0]
//            } else {
//                values = [1]
//            }
//        } else {
//            var sequence: [UInt]
//            if includesZero == true {
//                sequence = [0,1]
//            } else {
//                sequence = [1,1]
//            }
//            for var i = 2; i < Int(numberOfItemsInSequence); i++ {
//                let lastNumber = sequence.last!
//                let secondToLastNumber = sequence[sequence.count-2]
//                let (nextNumber, didOverflow) = UInt.addWithOverflow(lastNumber, secondToLastNumber)
//                if didOverflow == true {
//                    println("Overflow! The next number is too big to store in a UInt!")
//                    break
//                }
//                sequence.append(nextNumber)
//            }
//            values = sequence
//        }
//    }
//}
