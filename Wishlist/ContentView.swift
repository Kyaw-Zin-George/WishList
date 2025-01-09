//
//  ContentView.swift
//  Wishlist
//
//  Created by Kyaw Thant Zin(George) on 1/4/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //connect the modelContainer to the all views within the app
    @Environment(\.modelContext) private var modelContext
    //read all wish objects managed by SwiftData
    @Query private var wishes: [Wish]
    // for showing alert
    @State private var isAlertShowing: Bool = false
    // for holding the value of a new wish
    @State private var newWishTitle: String = ""
    var body: some View {
        NavigationStack{
            List{
                ForEach(wishes){ wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                    //adding delete functionality
                        .swipeActions{
                            Button(role: .destructive){
                                modelContext.delete(wish)
                            }label: {
                                Text("Delete")
                            }
                        }
                }
            }//:List
            .navigationTitle("Wishes")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        isAlertShowing.toggle()
                    }label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                // adding bottom text to show how many wishes i have made
                if wishes.isEmpty == false{
                    ToolbarItem(placement: .bottomBar){
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                    }
                }
            }
            .alert("Create a new wish",isPresented: $isAlertShowing){
                TextField("Enter a wish", text: $newWishTitle)
                Button{
                    //saves a new wish
                    modelContext.insert(Wish(title: newWishTitle))
                    newWishTitle = ""
                }label: {
                    Text("Save")
                }
            }
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
