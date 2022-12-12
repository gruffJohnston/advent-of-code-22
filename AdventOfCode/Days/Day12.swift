//
//  Day12.swift
//  AdventOfCode
//
//  Created by Gruff Johnston on 12/12/2022.
//

import Foundation

final class Day12: Day {
    
    func part1(_ input: String) -> CustomStringConvertible {
        let lines = input.lines

        let score = getShortestPathFrom(lines: lines)

        return score
    }
    
    func getShortestPathFrom(lines: [Substring]) -> Int {
        let startingTile = getStartTile(lines: lines)!

        var seen :Set<Tile> = [startingTile]
        var queue = [startingTile]
        
        while queue.isEmpty == false {
            let move = queue.removeFirst()

            let possibleMoves = getPossibleMovesFrom(tile: move, lines: lines)
            for tile in possibleMoves {

                if tile.letter == "z" {
                    return move.distance + 2
                } else {
                    if !seen.contains(tile) {
                        seen.insert(tile)
                        queue.append(Tile(letter: tile.letter, x: tile.x, y: tile.y, distance: move.distance + 1))
                    }
                }
            }
        }
        
        return 0
    }
    
    func getStartTile(lines: [Substring]) -> Tile? {
        for (lineIndex, line) in lines.enumerated() {
            for (rowIndex, letter) in line.enumerated() {
                if letter == "S" {
                    return Tile(letter: "S", x: rowIndex, y: lineIndex)
                }
            }
        }
        
        return nil
    }
    
    func getEndTile(lines: [Substring]) -> Tile? {
        for (lineIndex, line) in lines.enumerated() {
            for (rowIndex, letter) in line.enumerated() {
                if letter == "E" {
                    return Tile(letter: "E", x: rowIndex, y: lineIndex)
                }
            }
        }
        
        return nil
    }
    
    func getPossibleMovesFrom(tile: Tile, lines: [Substring]) -> [Tile] {
        
        var tiles = [Tile]()
        if tile.x != 0 {
            let before = Tile(letter: lines[tile.y][tile.x - 1], x: tile.x - 1, y: tile.y)
            if before.letter.letterValue! <= tile.letter.letterValue! + 1 {
                tiles.append(before)
            }
        }
        if tile.x != lines[tile.y].count - 1 {
            let after = Tile(letter: lines[tile.y][tile.x + 1], x: tile.x + 1, y: tile.y)
            if after.letter.letterValue! <= tile.letter.letterValue! + 1 {
                tiles.append(after)
            }
        }
        if tile.y != 0 {
            let above = Tile(letter: lines[tile.y - 1][tile.x], x: tile.x, y: tile.y - 1)
            if above.letter.letterValue! <= tile.letter.letterValue! + 1 {
                tiles.append(above)
            }
        }
        if tile.y != lines.count - 1 {
            let below = Tile(letter: lines[tile.y + 1][tile.x], x: tile.x, y: tile.y + 1)
            if below.letter.letterValue! <= tile.letter.letterValue! + 1 {
                tiles.append(below)
            }
        }
        
        return tiles
    }
    
    func part2(_ input: String) -> CustomStringConvertible {

        return 0
    }
    
}

struct Tile: Hashable {
    let letter: Character
    let x: Int
    let y: Int
    var distance: Int = 0
}

extension Tile {
    var desctiption: String {
        return "\(letter) - x: \(x), y: \(y), distance: \(distance)"
    }
}
