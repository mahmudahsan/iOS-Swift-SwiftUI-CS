//
//  AppStates.swift
//  Pop-To-Root-View-Navigation
//
//  Created by mahmud on 11/4/20.
//  Copyright © 2020 iThinkdiff. All rights reserved.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var moveToDashboard: Bool = false
}
