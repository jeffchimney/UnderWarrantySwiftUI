//
//  ContentView.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-01.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State var shouldShowWelcome: Bool  = true

    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(items) { item in
                        ItemRow(item: item)
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    #if os(iOS)
                    EditButton()
                    #endif

                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                
                .navigationTitle("Watchlist")
            }
            .zIndex(0)
            
            FloatingMenu()
                .zIndex(1)
        }
        .sheet(isPresented: $shouldShowWelcome, content: {
            IntroductionView(shouldShowWelcome: $shouldShowWelcome)
        })
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
