//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Kyaw Thant Zin(George) on 1/4/25.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            //creates a storage for wish object
                .modelContainer(for: Wish.self)
        }
    }
}
