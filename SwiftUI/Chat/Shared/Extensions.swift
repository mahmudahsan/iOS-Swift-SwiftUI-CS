//
//  Extensions.swift
//  Chat
//
//  Created by Mahmud Ahsan on 6/3/21.
//

import SwiftUI

// MARK:- View extension
extension View {
    public func flip() -> some View {
        return self
            .rotationEffect(.radians(.pi))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}
