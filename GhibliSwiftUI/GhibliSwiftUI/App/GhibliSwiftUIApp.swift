//
//  GhibliSwiftUIApp.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 27/06/26.
//

import SwiftUI

@main
struct GhibliSwiftUIApp: App {
    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            coordinator.start()
        }
    }
}
