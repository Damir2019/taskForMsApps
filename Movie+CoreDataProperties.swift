//
//  Movie+CoreDataProperties.swift
//  taskForMsApps
//
//  Created by damir hodez on 22/01/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var genre: [String]?
    @NSManaged public var image: String?
    @NSManaged public var rating: Double
    @NSManaged public var releaseYear: Int16
    @NSManaged public var title: String?

}
