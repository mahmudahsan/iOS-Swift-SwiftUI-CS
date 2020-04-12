//
//  AppState.swift
//  Demo
//
//  Created by mahmud on 11/4/20.
//  Copyright © 2020 iThinkdiff. All rights reserved.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    func reloadDashboard() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.reloadDashboard()
    }
}
