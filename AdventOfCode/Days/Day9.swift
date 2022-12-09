//
//  Day9.swift
//  AdventOfCode
//
//  Created by Gruff Johnston on 09/12/2022.
//

import Foundation

final class Day9: Day {
    
    func part1(_ input: String) -> CustomStringConvertible {
        
        var lines = [Instruction]()
        
        for line in input.lines {
            let instruction = line.split(separator: " ")
            lines.append(Instruction(direction: Direction(rawValue: String(instruction.first!))!, distance: Int(instruction.last!)!))
        }

        let headMoves = getHeadMovesFrom(instructions: lines)
        
        return  Set(calculateTailMovesFrom(headMoves: headMoves, ropeLength: 1)).count
    }
    
    
    func part2(_ input: String) -> CustomStringConvertible {

        var lines = [Instruction]()

        for line in input.lines {
            let instruction = line.split(separator: " ")
            lines.append(Instruction(direction: Direction(rawValue: String(instruction.first!))!, distance: Int(instruction.last!)!))
        }

        let headMoves = getHeadMovesFrom(instructions: lines)
        var ropeMoves = [headMoves]

        for _ in 1...9 {
            ropeMoves.append(calculateTailMovesFrom(headMoves: ropeMoves.last!, ropeLength: 1))
        }

        return  Set(ropeMoves.last!).count
    }
    
    func getHeadMovesFrom(instructions: [Instruction]) -> [Position] {
        var currentPosition = Position(x: 0, y: 0)
        var visited: [Position] = [currentPosition]
        
        for instruction in instructions {
            
            for _ in 1...instruction.distance {
                switch instruction.direction {
                case .left:
                    let newPosition = Position(x: currentPosition.x - 1, y: currentPosition.y)
                    visited.append(newPosition)
                    currentPosition = newPosition
                case .right:
                    let newPosition = Position(x: currentPosition.x + 1, y: currentPosition.y)
                    visited.append(newPosition)
                    currentPosition = newPosition
                    
                case .up:
                    let newPosition = Position(x: currentPosition.x, y: currentPosition.y + 1)
                    visited.append(newPosition)
                    currentPosition = newPosition
                case .down:
                    let newPosition = Position(x: currentPosition.x, y: currentPosition.y - 1)
                    visited.append(newPosition)
                    currentPosition = newPosition
                }
            }
        }
        return visited
    }
    
    func calculateTailMovesFrom(headMoves: [Position], ropeLength: Int) -> [Position] {
        var tailPosition = Position(x: 0, y: 0)
        var tailMoves = [tailPosition]

        for move in headMoves {

            switch move.x - tailPosition.x {
            case -(ropeLength + 1):
                let newPosition = Position(x: move.x + ropeLength, y: move.y)
                tailMoves.append(newPosition)
                tailPosition = newPosition
            case (ropeLength + 1):
                let newPosition = Position(x: move.x - ropeLength, y: move.y)
                tailMoves.append(newPosition)
                tailPosition = newPosition
            default: break
            }
            
            switch move.y - tailPosition.y {
            case -(ropeLength + 1):
                let newPosition = Position(x: move.x, y: move.y + ropeLength)
                tailMoves.append(newPosition)
                tailPosition = newPosition
            case (ropeLength + 1):
                let newPosition = Position(x: move.x, y: move.y - ropeLength)
                tailMoves.append(newPosition)
                tailPosition = newPosition
            default: break
            }
            
        }
        
        return tailMoves
    }
}

struct Instruction {
    let direction: Direction
    let distance: Int
}

enum Direction: String {
    case up = "U"
    case down = "D"
    case left = "L"
    case right = "R"
}
