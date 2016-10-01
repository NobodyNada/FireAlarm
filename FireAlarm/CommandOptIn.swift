//
//  CommandOptIn.swift
//  FireAlarm
//
//  Created by NobodyNada on 10/1/16.
//  Copyright © 2016 NobodyNada. All rights reserved.
//

import Foundation

class CommandOptIn: Command {
	override class func usage() -> [String] {
		return ["notify ...", "opt in ...", "opt-in ..."]
	}
	
	override func run() throws {
		message.user.notified = true
		
		for tag in arguments {
			if !message.user.notificationTags.contains(tag) {
				message.user.notificationTags.append(tag)
			}
		}
		
		if arguments.count == 0 {
			message.user.notificationTags = []
			bot.room.postReply("You will now be notified of all reports.", to: message)
		}
		else {
			var string = ""
			if message.user.notificationTags.count == 1 {
				string = "[tag:\(arguments.first!)]"
			}
			else {
				for tag in message.user.notificationTags {
					if tag == message.user.notificationTags.last {
						string.append("or [tag:\(tag)]")
					}
					else {
						string.append("[tag:\(tag), ")
					}
				}
			}
			bot.room.postReply("You will now be notified of reports tagged \(string).", to: message)
		}
	}
}
