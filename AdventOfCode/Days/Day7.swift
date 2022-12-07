//
//  Day7.swift
//  AdventOfCode
//
//  Created by Gruff Johnston on 07/12/2022.
//

import Foundation

final class Day7: Day {

    func part1(_ input: String) -> CustomStringConvertible {
        let directory = parseInput(input: input)
        let size = getFoldersUnderSizeFrom(folder: directory, maxSize: 100000)
        return size
    }

    func part2(_ input: String) -> CustomStringConvertible {
        return calculateFreeSpace(root: parseInput(input: input))
    }
    
    func parseInput(input: String) -> Folder {
        let directory: Folder = Folder(parent: nil, name: "/", files: [], folders: [])
        var currentFolder = directory
        
        for line in input.lines {
            let commands = line.split(separator: " ").map { String($0) }

            switch commands.first {
            case "$":
                let target = commands.count == 3 ? commands[2] : nil
                if target != nil {
                    // move
                    switch target {
                    case "/":
                        currentFolder = directory
                        
                    case "..":
                        if currentFolder.parent?.name == "/" {
                            currentFolder = directory
                        } else {
                            currentFolder = currentFolder.parent!
                        }

                    default:
                        currentFolder = getFolderContaining(folderName: target!, directory: currentFolder)!
                    }
                }
                
            case "dir":
                let name = commands[1]

                if let _ = getFolderContaining(folderName: name, directory: currentFolder) {

                } else {
                    let newFolder = Folder(parent: currentFolder, name: name, files: [], folders: [])
                    currentFolder.folders.append(newFolder)
                }
                
            default:
                let size = Int(commands[0])!
                let name = commands[1]
                if let _ = currentFolder.files.first(where: { $0.name == name } ) {
                } else {
                    let file = File(name: name, size: size)
                    currentFolder.files.append(file)
                }
            }
        }
    
        return directory
    }
}

func getFolderContaining(folderName: String, directory: Folder) -> Folder? {
    let folders = directory.folders.compactMap{ $0 }.filter { $0.name == folderName }
    return folders.first
}

func flattenedArray(root: Folder) -> [File] {
    var files = [File]()
    files.append(contentsOf: root.files)
    
    for folder in root.folders {
        let result = flattenedArray(root: folder)
        files.append(contentsOf: result)
    }
    
    return files
}

func flattenedFolderArray(root: Folder) -> [Folder] {
    var folders = [Folder]()
    folders.append(contentsOf: root.folders)
    
    for folder in root.folders {
        let result = flattenedFolderArray(root: folder)
        folders.append(contentsOf: result)
    }
    
    return folders
}

func calculateFreeSpace(root: Folder) -> Int {
    let totalSize = 70000000
    let requiredFreeSpace = 30000000
    let rootFolderSize = getSizeFor(folder: root)
    let unusedSpace = totalSize - rootFolderSize
    let neededSpace = requiredFreeSpace - unusedSpace
    let folders = getFoldersOverSizeFrom(folder: root, minSize: neededSpace)
    let spaceFreed = folders.map{ getSizeFor(folder: $0) }
    return spaceFreed.min()!
}


func getFoldersOverSizeFrom(folder: Folder, minSize: Int) -> [Folder] {

    var folders = [Folder]()
 
    let currrentFolderSize = getSizeFor(folder: folder)
    if currrentFolderSize > minSize {
        folders.append(folder)
    }
    
    let childFolders = flattenedFolderArray(root: folder)
    for folder in childFolders {
        let score = getSizeFor(folder: folder)
        if score > minSize {
            folders.append(folder)
        }
    }
    
    return folders
}

func getFoldersUnderSizeFrom(folder: Folder, maxSize: Int) -> Int {
    
    var total = 0
 
    let currrentFolderSize = getSizeFor(folder: folder)
    if currrentFolderSize < maxSize {
        total += currrentFolderSize
    }
    
    let childFolders = flattenedFolderArray(root: folder)
    for folder in childFolders {
        let score = getSizeFor(folder: folder)
        if score < maxSize {
            total += score
        }
    }
    
    return total
}

func getSizeFor(folder: Folder) -> Int {
    
    var total = 0
    let nestedFiles = flattenedArray(root: folder)
    let filesSize = nestedFiles.compactMap{$0.size}.reduce(0, +)
     
    total += filesSize

    return total
}

class File {
    let name: String
    let size: Int
    
    init(name: String, size: Int) {
        self.name = name
        self.size = size
    }
}

class Folder {
    let parent: Folder?
    let name: String
    var files: [File]
    var folders: [Folder]
    
    init(parent: Folder?, name: String, files: [File], folders: [Folder]) {
        self.parent = parent
        self.name = name
        self.files = files
        self.folders = folders
    }
}

extension Folder: CustomStringConvertible {
    var description: String {
        "parentName: \(parent?.name ?? "nil"), name: \(name), folders: \(folders.description), files: \(files.description)"
    }
}

extension File: CustomStringConvertible {
    var description: String {
        " name: \(name), size: \(size)"
    }
}
