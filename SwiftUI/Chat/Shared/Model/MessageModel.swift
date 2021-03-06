//
//  MessageModel.swift
//  Chat
//
//  Created by Mahmud Ahsan on 6/3/21.
//

import Foundation

struct MessageModel: Hashable, Identifiable {
    var id = UUID()
    var message: String
    var time: Date = Date()
    var isAuthor: Bool
}

// MARK:- Random Questions
extension MessageModel {
    static func getRandomAnswer() -> String {
        [
            "If You Had Three Wishes, What Would You Wish For?",
            "What Would You Rather Throw Away: Love Or Money?",
            "What's The Most Beautiful Place You've Ever Seen?",
            "What Was Your Fondest Memory Of High School?",
            "What's Your Favorite TV Show?"
        ].randomElement()!
    }
}
