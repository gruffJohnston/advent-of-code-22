//
//  Day10.swift
//  AdventOfCode
//
//  Created by Gruff Johnston on 10/12/2022.
//

import Foundation

final class Day10: Day {
    
    func part1(_ input: String) -> CustomStringConvertible {
        return run(program: getInstructionsFor(input: input))
    }
    
    func part2(_ input: String) -> CustomStringConvertible {
        draw(program: getInstructionsFor(input: input))
        return 0
    }
    
    func getInstructionsFor(input: String) -> [Program] {
        let lines = input.lines.map { String($0) }
        var instructions = [Program]()

        for line in lines {
            let instruction = line.split(separator: " ")
            instructions.append(Program(instruction: String(instruction.first!), amount: Int(instruction.last!)))
        }
        
        return instructions
    }
    
    func pixelFor(cycle: Int, x: Int, line: Int) -> String {
        let y = cycle - (40 * line)
        if y == x || y == (x - 1) || y == (x + 1) {
            return "#"
        } else {
            return "."
        }
    }
    
    func draw(program: [Program]) {
        var cycle = 0
        var x = 1
        var pixels :[[String]] = [[], [], [], [], [], []]
        
        for line in program {
            switch line.instruction {
                
            case "addx":
                for _ in 1...2 {
                    let line = cycle / 40
                    pixels[line].append(pixelFor(cycle: cycle, x: x, line: line))
                    cycle += 1
                }
                x += line.amount!
                
            case "noop":
                let line = cycle / 40
                pixels[line].append(pixelFor(cycle: cycle, x: x, line: line))
                cycle += 1

            default:
                print("invalid input")
                exit(1)
            }
        }
        
        for line in pixels {
            print(line.joined())
        }
    }
    
    func run(program: [Program]) -> Int {
        var cycle = 0
        var x = 1
        var signalStrength = 0
        let cycles = [20, 60, 100, 140, 180, 220]
        
        for line in program {
            switch line.instruction {
            case "addx":
                for _ in 1...2 {
                    cycle += 1
                    if cycles.contains(cycle) {
                        signalStrength += (cycle * x)
                    }
                }
                x += line.amount!
                
            case "noop":
                cycle += 1
                if cycles.contains(cycle) {
                    signalStrength += (cycle * x)
                }

            default:
                print("invalid input")
                exit(1)
            }
        }
        
        return signalStrength
    }
}

struct Program {
    let instruction: String
    let amount: Int?
}

extension Program {
    var description: String {
        return "Instruction: \(instruction) - \(amount ?? 0) ) "
    }
}
