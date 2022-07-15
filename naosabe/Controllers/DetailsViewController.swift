//
//  detailsViewController.swift
//  naosabe
//
//  Created by livia on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let movie = movie else {
            return
        }
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            backdropImage.image = imagem // UIImage(named: movie.backdropPath)
        }
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let poster = UIImage(data: imageData) ?? UIImage()
            posterImage.image = poster
        }
        
        self.title = movie.title
//        chamei o backdrop com o "nome" do arquivo pq é uma String
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        

        
    }
    
}
