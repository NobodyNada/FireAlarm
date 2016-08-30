//
//  CommandListRunning.swift
//  FireAlarm
//
//  Created by Jonathan Keller on 8/28/16.
//  Copyright © 2016 NobodyNada. All rights reserved.
//

import Cocoa

class CommandListRunning: Command {
    override class func usage() -> [String] {
        return ["running commands"]
    }
    
    override func run() throws {
        var users = [String]()
        var commands = [String]()
        for command in bot.runningCommands {
            users.append("\(command.message.user.name)")
            commands.append("\(command.message.content)")
        }
        
        bot.room.postReply("Running commands:", to: message)
        bot.room.postMessage(makeTable(["User", "Command"], contents: users, commands))
    }
}
