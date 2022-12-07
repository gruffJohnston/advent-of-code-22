//
//  Day4.swift
//  AdventOfCode
//
//  Created by Gruff Johnston on 04/12/2022.
//

import Foundation

final class Day4: Day {

    func part1(_ input: String) -> CustomStringConvertible {
        var score = 0
        input.split(separator: "\n").forEach { line in
            let pairs = String(line).split(separator: ",")

            let firstPairs = pairs.first!.split(separator: "-")
            let lastPairs = pairs.last!.split(separator: "-")
            
            let firstLower = Int(String(firstPairs.first!))
            let firstUpper = Int(String(firstPairs.last!))
            let lastLower = Int(String(lastPairs.first!))
            let lastUpper = Int(String(lastPairs.last!))
            
            let firstRange = firstLower!...firstUpper!
            let lastRange = lastLower!...lastUpper!
            
            if firstRange ~= lastRange || lastRange ~= firstRange {
                score += 1
            }
        }
        return score
    }

    func part2(_ input: String) -> CustomStringConvertible {
        var score = 0
        input.split(separator: "\n").forEach { line in
            let pairs = String(line).split(separator: ",")

            let firstPairs = pairs.first!.split(separator: "-")
            let lastPairs = pairs.last!.split(separator: "-")
            
            let firstLower = Int(String(firstPairs.first!))
            let firstUpper = Int(String(firstPairs.last!))
            let lastLower = Int(String(lastPairs.first!))
            let lastUpper = Int(String(lastPairs.last!))
            
            let firstRange = firstLower!...firstUpper!
            let lastRange = lastLower!...lastUpper!
            
            if firstRange ~= lastLower! || firstRange ~= lastUpper! || lastRange ~= firstLower! || lastRange ~= firstUpper! {
                score += 1
            }
        }
        return score
    }
}
