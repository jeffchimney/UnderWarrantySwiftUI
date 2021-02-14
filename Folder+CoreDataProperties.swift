//
//  Folder+CoreDataProperties.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-13.
//
//

import Foundation
import CoreData


extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var name: String?
    @NSManaged public var icon: String?
    @NSManaged public var items: NSSet
    
    public var wrappedName: String {
        name ?? "Unknown Folder"
    }
    
    public var wrappedIcon: String {
        icon ?? "folder"
    }
    
    public var itemArray: [Item] {
        let set = items as? Set<Item> ?? []
        return set.sorted {
            $0.wrappedTitle < $1.wrappedTitle
        }
    }

}

extension Folder : Identifiable {

}
