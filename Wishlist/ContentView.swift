//
//  ContentView.swift
//  Wishlist
//
//  Created by Kyaw Thant Zin(George) on 1/4/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    var body: some View {
        NavigationStack{
            List{
                ForEach(wishes){ wish in
                    Text(wish.title)
                }
            }//:List
            .navigationTitle("Wishes")
            .overlay{
                if wishes.isEmpty{
                    ContentUnavailableView("My WishList", systemImage: "heart.circle",description: Text("No wish yet"))
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Wish.self,inMemory: true)
}
