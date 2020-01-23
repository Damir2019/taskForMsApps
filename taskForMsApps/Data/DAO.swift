//
//  DAO.swift
//  taskForMsApps
//
//  Created by damir hodez on 22/01/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import Foundation
import CoreData

// this class is the data managing helper
// contains all what is about core data
// all changes will be here

// Singleton contain only one instance of itself, and cannot make another one because of private init
class DAO {
    
    // MARK: Properties
    
    // statis property contains the only instance this class has
    // it is statis to allow us use it without making a reference of this object
    // which we cant cause we have private init
    static let shared = DAO()
    
    // getting the contect from CoreDataStack, for easy access for the context
    let context = CoreDataStack.shared.context
    
    typealias JSONObject = Dictionary<String, Any>
    
    // private init, nobody can create more instanses from this class
    private init () {}
    
    // get all MovieModel managedObjects records that exists in out context
    func fetchMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        // i want to get all records sorted by releaseYeas key
        let sortDescriptor = NSSortDescriptor(key: "releaseYear", ascending: false)
        
        // add the sort description to our request
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // trigger the request
        if let movies = try? context.fetch(fetchRequest) {
            return movies
        } else {
            print("error in fetching movies")
        }
        return []
    }
    
    // a function to delete all information of a choosen entity, MovieModel is this case
    func deleteAllMovies() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            try context.execute(deleteRequest)
        } catch {
            print("error deleting: \(error)")
        }
        
        saveContent()
    }
    
    func addMovie(stringValue: String) {
        // parsing the string value to a real movie object and than saving it to Core Data
        guard let data = stringValue.data(using: .utf8) else { return }
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? JSONObject else { return }
        
        let movie = Movie(context: context)
        movie.title = jsonObject["title"] as? String
        movie.image = jsonObject["image"] as? String
        movie.rating = jsonObject["rating"] as? Double ?? 0.0
        movie.releaseYear = jsonObject["releaseYear"] as? Int16 ?? 0
        movie.genre = jsonObject["genre"] as? [String]? ?? []
        
        saveContent()
    }
    
    // must saving context after any changes
    func saveContent() {
        do{
            try context.save()
        } catch {
            print("into error saving")
            print(error)
        }
    }
    
}
