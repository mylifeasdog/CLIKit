//
//  HelpCommand.swift
//  CLIKit
//
//  Created by Kyle Fuller on 05/07/2014.
//  Copyright (c) 2014 Cocode. All rights reserved.
//

class HelpCommand : Command {
    init() {
        super.init("help", "Show help for the given command.")
    }

    override func run(manager: Manager, arguments: ARGV) {
        if let commandName = arguments.shift() {
            if let command = manager.findCommand(commandName) {
                print("\(command.name):\n")
                print("    \(command.description)")
            } else {
                print("\(commandName) not found.")
            }
        } else {
            for command in manager.commands {
                print("- \(command.name): \(command.description)")
            }
        }
    }
}
