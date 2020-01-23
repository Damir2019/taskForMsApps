//
//  Movie+CoreDataClass.swift
//  taskForMsApps
//
//  Created by damir hodez on 22/01/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Movie)
public class Movie: NSManagedObject, Codable {
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        case rating = "rating"
        case releaseYear = "releaseYear"
        case genre = "genre"
    }
    
    // need to write it manually cause of the decoder init
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    // codable requires confirmation
    
    // converting the JSON object into a Movie object
    public required convenience init(from decoder: Decoder) throws {
        // init for core data
        
        // we need the context
        let context = DAO.shared.context
        
        // we also need to get the entity
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: context)!
        
        // and we instanciate the entity
        self.init(entity: entity, insertInto: context)
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            title = try values.decode(String.self, forKey: .title)
            image = try values.decode(String.self, forKey: .image)
            rating = try values.decode(Double.self, forKey: .rating)
            releaseYear = try values.decode(Int16.self, forKey: .releaseYear)
            genre = try values.decode([String]?.self, forKey: .genre)
        } catch {
            print(error.localizedDescription)
        }
        DAO.shared.saveContent()
    }
    
    
    // converting the Movie object into a JSON object
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(image, forKey: .image)
        try container.encode(rating, forKey: .rating)
        try container.encode(releaseYear, forKey: .releaseYear)
        try container.encode(genre, forKey: .genre)
    }

    func allGenres() -> String {
        var genreDescription: String = ""
        for eachGenre in genre! {
            genreDescription.append("\(eachGenre)")
            if eachGenre != genre!.last {
                genreDescription.append(", ")
            }
        }
        return genreDescription
    }
}
