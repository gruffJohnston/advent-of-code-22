//
//  Day5.swift
//  AdventOfCode
//
//  Created by Gruff Johnston on 05/12/2022.
//

import Foundation


final class Day5: Day {

    func part1(_ input: String) -> CustomStringConvertible {
        let lines = input.split(separator: "\n")
        let stackLines = lines.filter { $0.contains("[") }
        let instructions = lines.filter{ $0.contains("move") }

        var stacks :[[String]] = []
        stackLines.forEach { stack in
            for (index, char) in stack.enumerated() {
                if char.isLetter {
                    while stacks.count <= index / 4 {
                        stacks.append([])
                    }
                    stacks[index / 4].insert(String(char), at: 0)
                }
            }
        }
        
        for line in instructions {
            let elements = line.split(separator: " ")
            
            let count = Int(elements[1])!
            let source = Int(elements[3])!
            let destination = Int(elements[5])!
            
            for _ in 1...count {
                stacks[destination - 1].append(stacks[source - 1].popLast()!)
            }
        }
        
        var answer = ""
        for stack in stacks {
            if let instruction = stack.last {
                answer.append(instruction)
            }
        }
    
        return answer
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let lines = input.split(separator: "\n")
        let stackLines = lines.filter { $0.contains("[")}
        let instructions = lines.filter{ $0.contains("move") }

        var stacks :[[String]] = []
        stackLines.forEach { stack in
            for (index, char) in stack.enumerated() {
                if char.isLetter {
                    while stacks.count <= index / 4 {
                        stacks.append([])
                    }
                    stacks[index / 4].insert(String(char), at: 0)
                }
            }
        }
        
        for line in instructions {
            let elements = line.split(separator: " ")
            
            let count = Int(elements[1])!
            let source = Int(elements[3])!
            let destination = Int(elements[5])!
            
            var moving: [String] = []
            for _ in 1...count {
                moving.append(stacks[source - 1].popLast()!)
            }
            for _ in 1...count {
                stacks[destination - 1].append(moving.popLast()!)
            }
        }
        
        var answer = ""
        for stack in stacks {
            if let instruction = stack.last {
                answer.append(instruction)
            }
        }
    
        return answer
    }
}
