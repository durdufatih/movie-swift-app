//
//  ViewController.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 5.01.2023.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    private let viewModel = MainPageViewModel()
    private var showMoreValue = ""
    
    
    @IBOutlet weak var nowPlayingCell: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    private let nvc = UINavigationController()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == nowPlayingCell{
            return self.viewModel.nowPlaying?.results.count ?? 10
        }
        
        return self.viewModel.popularMovies?.results.count ?? 10
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == nowPlayingCell{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath as IndexPath) as! MOCollectionViewCellNowPlaying
            let filmData : FilmData? = self.viewModel.nowPlaying?.results[indexPath.row]
            let url:URL = URL(string: "https://image.tmdb.org/t/p/original/"+(filmData?.poster_path ?? "gLhu8UFPZfH2Hv11JhTZkb9CVl.jpg"))!
            MOImageLoader.shared.downloadImage(url: url, completation: { result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        let image = UIImage(data:data)
                        cell.posterImage.image = image
                    }
                    
                case .failure(let failure):
                    print(String(describing: failure))
                    break
                }
            })
            cell.filmTitle.text = filmData?.title
            cell.filmRate.text = "\(filmData?.vote_average ?? 0.0 )"

            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPopular", for: indexPath as IndexPath) as! MOCollectionViewCellPopular
            let filmData : FilmData? = self.viewModel.popularMovies?.results[indexPath.row]
            
            let url:URL = URL(string: "https://image.tmdb.org/t/p/original/"+(filmData?.poster_path ?? "gLhu8UFPZfH2Hv11JhTZkb9CVl.jpg"))!
            MOImageLoader.shared.downloadImage(url: url, completation: { result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        let image = UIImage(data:data)
                        cell.filmImagePopular.image = image
                    }
                    
                case .failure(let failure):
                    print(String(describing: failure))
                    break
                }
            })
            cell.labelFilmTitlePopular.text = filmData?.title
            cell.labelRatePopular.text = "\(filmData?.vote_average ?? 0.0 )"
            
            
            let genre = (String(describing: filmData!.genre_ids[0].description));
            cell.tagTextPopular.setTitle(genre, for: .normal)
        
            return cell
        }
        
    }
    


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? MoreShowViewController
        if segue.identifier == "morePlaying"{
            destinationVC?.stateOfActualSection = "morePlaying"
            destinationVC?.navigationItem.title = "Now Playing"
        }
        else{
            destinationVC?.stateOfActualSection = "morePopular"
            destinationVC?.title = "Popular"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nowPlayingCell.delegate = self
        nowPlayingCell.dataSource = self
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        viewModel.getPopular()
        viewModel.fetchCharacter()
        nowPlayingCell.reloadData()
        popularCollectionView.reloadData()
        // Do any additional setup after loading the view.
    }


}

