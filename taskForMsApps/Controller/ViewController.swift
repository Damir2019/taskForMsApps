//
//  ViewController.swift
//  taskForMsApps
//
//  Created by damir hodez on 22/01/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MovieDelegate{
    
    
    let movieDataSource = MovieDataSource.shared
    let dao = DAO.shared
    var isThereData: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // deleting all the data from Core Data -> for tests
//        dao.deleteAllMovies()
        
        // MovieDataSource cheking if there is data in CoreData if ther's no data
        // it starts to make session tasks to the provided URL to recieve the data and saving it in Core Data
        // by sending view instance i can use moviesSaved() that executed after the movies recieved ans saved
        movieDataSource.delegate = self
        
        // this method returns true if there is data in Core Data
        // and returns false if there is not data, and starts to make request to provided URL
        isThereData = movieDataSource.coreDataCheck()
        
        // if we get true we movie to the tableView page
        // else after the data recieved we will move to tableView page by moviesSaved() method
        if isThereData {
            goToList()
        }
    }

    // leading to the next page where the table is
    func goToList() {
        print("got to list")
        self.performSegue(withIdentifier: "goToList", sender: self)
    }
    
    // this function will execute only if there is no data in core data
    // and only after all data was recived from network and saved to core data.
    // basically confirmation of MovieDelegate protocol notifying when the process
    // of reciving information is over
    func moviesSaved() {
        goToList()
    }

}

