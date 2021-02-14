//
//  FolderView.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-13.
//

import SwiftUI
import CoreData

struct FolderView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var useCompactCards: Bool  = false
    
    var columns: [GridItem] = [
        GridItem(spacing: 20),
        GridItem(spacing: 20),
        GridItem(spacing: 20)
    ]
    
    var iPhoneColumns: [GridItem] = [
        GridItem(spacing: 20)
    ]
    
    var folder: Folder
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: UIDevice.current.userInterfaceIdiom == .pad ? columns : iPhoneColumns,
                alignment: .center,
                spacing: 20,
                pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                ForEach(folder.itemArray) { item in
                    if useCompactCards {
                        CompactItemCard(item: item)
                    } else {
                        ItemCard(item: item)
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
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            let defaultFolderRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Folder")
            defaultFolderRequest.predicate = NSPredicate(format: "name = %@", "Items")
            
            do {
                let results = try viewContext.fetch(defaultFolderRequest)
                if results.count > 0 {
                    for defaultFolder in results as! [Folder] {
                        newItem.folder = defaultFolder
                    }
                } else {
                    let newFolder = Folder(context: viewContext)
                    newFolder.icon = "folder"
                    newFolder.name = "Items"
                    
                    do {
                        try viewContext.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                    
                    newItem.folder = newFolder
                }
            } catch {
                
                print("Failed")
            }

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
            offsets.map { folder.itemArray[$0] }.forEach(viewContext.delete)

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

struct FolderView_Previews: PreviewProvider {
    static var previews: some View {
        FolderView(folder: Folder())
    }
}
