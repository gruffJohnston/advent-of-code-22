//
//  Day2.swift
//  AdventOfCode
//

import Foundation

final class Day2: Day {
    
    enum Move {
        case Rock, Paper, Scissors
    }
    
    enum Instruction {
        case Win, Lose, Draw
    }
    
    func part1(_ input: String) -> CustomStringConvertible {
        var move1: [String] = []
        var move2: [String] = []
        let lines = input.split(separator:"\n", omittingEmptySubsequences: false)
        for line in lines {
            let moves = line.split(separator: " ")
            if moves.isEmpty == false {
                move1.append(String(moves[0]))
                move2.append(String(moves[1]))
            }
        }
        
        var score = 0
        for (index, move) in move1.enumerated() {
            let move1 = getMoveFrom(string: move)
            let move2 = getMoveFrom(string: move2[index])
            let roundScore = getVictoryPoints(move1: move1, move2: move2)
            score += roundScore
            score += getMoveScore(move: move2)
        }
        
        return score
    }

    func part2(_ input: String) -> CustomStringConvertible {
        var move1: [String] = []
        var move2: [String] = []
        let lines = input.split(separator:"\n", omittingEmptySubsequences: false)
        for line in lines {
            let moves = line.split(separator: " ")
            if moves.isEmpty == false {
                move1.append(String(moves[0]))
                move2.append(String(moves[1]))
            }
        }
        
        var score = 0
        for (index, move) in move1.enumerated() {
            let move1 = getMoveFrom(string: move)
            let instruction = getInstructionFrom(string: move2[index])
            let move2 = getMoveFrom(move: move1, instruction: instruction)
            let roundScore = getVictoryPoints(move1: move1, move2: move2)
            score += roundScore
            score += getMoveScore(move: move2)
        }
        
        return score
    }

    func getMoveScore(move: Move) -> Int {
        switch move{
        case .Rock:
            return 1
        case .Paper:
            return 2
        case .Scissors:
            return 3
        }
    }

    func getVictoryPoints(move1: Move, move2: Move) -> Int {
        switch (move1, move2) {
        case (.Rock, .Rock):
            return 3
        case (.Rock, .Paper):
            return 6
        case (.Rock, .Scissors):
            return 0
        case (.Paper, .Rock):
            return 0
        case (.Paper, .Paper):
            return 3
        case (.Paper, .Scissors):
            return 6
        case (.Scissors, .Rock):
            return 6
        case (.Scissors, .Paper):
            return 0
        case (.Scissors, .Scissors):
            return 3
        }
    }
    
    func getMoveFrom(string: String) -> Move {
        switch string {
        case "A":
            return .Rock
        case "X":
            return .Rock
        case "B":
            return .Paper
        case "Y":
            return .Paper
        case "C":
            return .Scissors
        case "Z":
            return .Scissors
        default:
            return .Rock
        }
    }
    
    func getInstructionFrom(string: String) -> Instruction {
        switch string {
        case "X":
            return .Lose
        case "Y":
            return .Draw
        case "Z":
            return .Win
        default:
            return .Win
        }
    }
    
    func getMoveFrom(move: Move, instruction: Instruction) -> Move {
        switch (move, instruction) {
        case (.Rock, .Win):
            return .Paper
        case (.Rock, .Draw):
            return .Rock
        case (.Rock, .Lose):
            return .Scissors
        case (.Paper, .Win):
            return .Scissors
        case (.Paper, .Draw):
            return .Paper
        case (.Paper, .Lose):
            return .Rock
        case (.Scissors, .Win):
            return .Rock
        case (.Scissors, .Draw):
            return .Scissors
        case (.Scissors, .Lose):
            return .Paper
        }
    }
}
