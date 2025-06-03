//
//  MangaFlow.swift
//  MangaFlow
//
//

import SwiftUI

@main
struct MangaFlow: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentViewListViewOnly()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
