//
//  FamilyRootsApp.swift
//  FamilyRoots
//
//  Created by Apprenant 165 on 06/02/2025.
//

import SwiftUI

@main
struct FamilyRootsApp: App {
    @StateObject private var authManager = AuthManager()
    var body: some Scene {
        WindowGroup {
            if authManager.isLoggedIn {
                ArbreMainView()
                    .environmentObject(authManager)
            } else {
                Login()
                    .environmentObject(authManager)
            }
        }
    }
}
