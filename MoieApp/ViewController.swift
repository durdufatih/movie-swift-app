//
//  ViewController.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 5.01.2023.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    private let itemsList:[FilmModel]=[
        FilmModel(imageUrl: "1", title: "Spiderman: No Way Home", rateString: "9.2/10 IMDb",tag: "Horror",length: "1h 47m"),
        FilmModel(imageUrl: "2", title: "Eternals", rateString: "7.2/10 IMDb",tag: "Horror",length: "1h 47m"),
        FilmModel(imageUrl: "1", title: "Spiderman: No Way Home", rateString: "8.2/10 IMDb",tag: "Horror",length: "1h 47m"),
        FilmModel(imageUrl: "2", title: "Eternals", rateString: "9.5/10 IMDb",tag: "Horror",length: "1h 47m"),
        
    ]
    
    @IBOutlet weak var nowPlayingCell: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == nowPlayingCell{
            return self.itemsList.count
        }
        
        return self.itemsList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == nowPlayingCell{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath as IndexPath) as! MOCollectionViewCellNowPlaying
            let filmData : FilmModel = self.itemsList[indexPath.row]
            cell.posterImage.image = UIImage(named: "Poster-"+filmData.imageUrl)
            cell.filmTitle.text = filmData.title
            cell.filmRate.text = filmData.rateString
            //cell.starImage.image = UIImage(named: "Star")
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPopular", for: indexPath as IndexPath) as! MOCollectionViewCellPopular
            let filmData : FilmModel = self.itemsList[indexPath.row]
            cell.filmImagePopular.image = UIImage(named: "Poster-"+filmData.imageUrl)
            cell.labelFilmTitlePopular.text = filmData.title
            cell.labelRatePopular.text = filmData.rateString
            
            //cell.starImagepopular.image = UIImage(named: "Star")
            cell.tagTextPopular.setTitle(filmData.tag, for: .normal)
            cell.lengthLabelText.text = filmData.length
            //cell.imageLength.image = UIImage(named: "59252")
            
            return cell
        }
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nowPlayingCell.delegate = self
        nowPlayingCell.dataSource = self
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        nowPlayingCell.reloadData()
        popularCollectionView.reloadData()
        // Do any additional setup after loading the view.
    }


}

