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
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
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

#Preview("Full List") {
    let container = try! ModelContainer(for: Wish.self,configurations: ModelConfiguration(isStoredInMemoryOnly: true))
                                        
    container.mainContext.insert(Wish(title: "Master SwiftDatat"))
    container.mainContext.insert(Wish(title: "Practice SwiftUI"))
    container.mainContext.insert(Wish(title: "Learn SwiftUI"))
    
     return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self,inMemory: true)
}
