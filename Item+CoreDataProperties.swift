//
//  Item+CoreDataProperties.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-13.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var about: String?
    @NSManaged public var endDate: Date?
    @NSManaged public var startDate: Date?
    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String?
    @NSManaged public var folder: Folder?
    
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    public var wrappedAbout: String {
        about ?? ""
    }
    
    public var wrappedStartDate: Date {
        startDate ?? Date()
    }
    
    public var wrappedEndDate: Date {
        endDate ?? Date()
    }
    
    public var wrappedFolder: Folder {
        folder ?? Folder()
    }

}

extension Item : Identifiable {

}
