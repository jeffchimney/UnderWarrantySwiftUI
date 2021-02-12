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
    @State private var shouldShowSheet: Bool = true
    @State private var shouldShowWelcome: Bool  = true
    @State private var useCompactCards: Bool  = true
    
    private var columns: [GridItem] = [
        GridItem(spacing: 20),
        GridItem(spacing: 20),
        GridItem(spacing: 20)
    ]
    
    private var iPhoneColumns: [GridItem] = [
        GridItem(spacing: 20)
    ]

    var body: some View {
        NavigationView {
            
            // use sidebar navigation if on iPad
            if UIDevice.current.userInterfaceIdiom == .pad {
                List {
                    NavigationLink(
                        destination: AddItemView(),
                        label: {
                            Text("House")
                    })
                    NavigationLink(
                        destination: AddItemView(),
                        label: {
                            Text("Work")
                    })
                    NavigationLink(
                        destination: AddItemView(),
                        label: {
                            Text("Fun")
                    })
                }
                .listStyle(SidebarListStyle())
            }
            
            ScrollView {
                LazyVGrid(
                    columns: UIDevice.current.userInterfaceIdiom == .pad ? columns : iPhoneColumns,
                    alignment: .center,
                    spacing: 20,
                    pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    ForEach(items) { item in
                        if useCompactCards {
                            CompactItemCard(item: item)
                                .shadow(radius: 5)
                        } else {
                            ItemCard(item: item)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(10)
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
        .sheet(isPresented: $shouldShowSheet, onDismiss: {
            shouldShowSheet = false
            shouldShowWelcome = false
        }, content: {
            if (shouldShowWelcome) {
                IntroductionView(shouldShowWelcome: $shouldShowSheet)
            } else {
                AddItemView()
            }
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
