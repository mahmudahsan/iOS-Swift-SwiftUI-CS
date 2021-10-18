//
//  AppState.swift
//  EnvironmentObject
//
//  Created by Mahmud Ahsan on 18/10/21.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var name: String = "Bill Gates"
}
