//
//  MovieCell.swift
//  taskForMsApps
//
//  Created by damir hodez on 22/01/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var loadingCircle: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setMovie(for movie: Movie) {
        loadingCircle.startAnimating()
        
        let imageURL = URL(string: movie.image!)!
        movieImage.sd_setImage(with: imageURL) { (image, error, imageType, URL) in
            if image == nil {
                self.movieImage.image = UIImage(named: "no_image")
                self.loadingCircle.stopAnimating()
                self.loadingCircle.isHidden = true
            } else {
                self.movieImage.image = image!
                self.loadingCircle.stopAnimating()
                self.loadingCircle.isHidden = true
            }
        }
        movieTitle.text = movie.title
        movieRating.text = String(movie.rating)
        }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

