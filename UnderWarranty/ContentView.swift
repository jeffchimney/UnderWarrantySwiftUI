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
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Folder.name, ascending: true)],
        animation: .default)
    private var folders: FetchedResults<Folder>
    
    @State private var shouldShowSheet: Bool = true
    @State private var shouldShowWelcome: Bool  = true
    
    @State private var selection = 0

    var body: some View {
        NavigationView {
            
            // use sidebar navigation if on iPad
            if UIDevice.current.userInterfaceIdiom == .pad {
                List {
                    NavigationLink(
                        destination:
                            AddItemView(),
                        label: {
                            Label("Everything", systemImage: "tray.2")
                    })
                    
                    NavigationLink(
                        destination:
                            AddItemView(),
                        label: {
                            Label("Expiring Soon", systemImage: "clock")
                    })
                    
                    NavigationLink(
                        destination:
                            AddItemView(),
                        label: {
                            Label("Flagged", systemImage: "flag")
                    })
                    
                    Section(header: Text("Folders")) {
                        ForEach(folders) { folder in
                            NavigationLink(
                                destination:
                                    FolderView(folder: folder)
                                        .environment(\.managedObjectContext, viewContext),
                                label: {
                                    Label(folder.wrappedName, systemImage: folder.wrappedIcon)
                            })
                        }
                    }
                }
                .listStyle(SidebarListStyle())
            }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
