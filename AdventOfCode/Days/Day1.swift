//
//  Day1.swift
//  AdventOfCode
//

import Algorithms
import Foundation

final class Day1: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        return input
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let lines = input.split(separator:"\n", omittingEmptySubsequences: false)
        
        var totalCalories: [Int] = []
        var currentElf = 0
        for food in lines {
            if food == "" {
                totalCalories.append(currentElf)
                currentElf = 0
            } else {
                currentElf += Int(food)!
            }
        }
        
        totalCalories.append(currentElf)
        
        let sum = totalCalories.sorted()[totalCalories.count - 3...totalCalories.count - 1].reduce(0, +)

        return sum
    }
}
