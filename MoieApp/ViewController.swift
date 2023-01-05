//
//  ViewController.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 5.01.2023.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    private let itemsList:[FilmModel]=[
        FilmModel(imageUrl: "1", title: "Hello Test", rateString: "9.2/10 IMDb"),
        FilmModel(imageUrl: "2", title: "Fatih Durdu", rateString: "7.2/10 IMDb"),
        FilmModel(imageUrl: "1", title: "Handenur Durdu", rateString: "8.2/10 IMDb"),
        FilmModel(imageUrl: "2", title: "Can Uraz Durdu", rateString: "9.5/10 IMDb"),
        
    ]
    
    @IBOutlet weak var nowPlayingCell: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.itemsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath as IndexPath) as! MOCollectionViewCellNowPlaying
        let filmData : FilmModel = self.itemsList[indexPath.row]
        cell.posterImage.image = UIImage(named: "Poster-"+filmData.imageUrl)
        cell.filmTitle.text = filmData.title
        cell.filmRate.text = filmData.rateString
        return cell
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nowPlayingCell.delegate=self
        nowPlayingCell.dataSource=self
        nowPlayingCell.reloadData()
        // Do any additional setup after loading the view.
    }


}

