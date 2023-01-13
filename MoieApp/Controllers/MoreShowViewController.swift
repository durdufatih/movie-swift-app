//
//  MoreShowViewController.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 12.01.2023.
//

import UIKit

class MoreShowViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var stateOfActualSection = ""
    let vm = MoreShowViewModel()
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var showMoreCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showMoreCollectionView.delegate = self
        showMoreCollectionView.dataSource = self
        DispatchQueue.main.async {
            self.showMoreCollectionView.reloadData()
            self.vm.fetchDetailOfData(moModelType: self.stateOfActualSection)
            self.showMoreCollectionView.reloadData()
        }
        
        self.setTitle()
        

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.vm.resultOfData.count-1{
            DispatchQueue.main.async {
                self.vm.fetchDetailOfData(moModelType: self.stateOfActualSection)
                self.showMoreCollectionView.reloadData()
            }
        }
    }
    
    func setTitle(){
        if stateOfActualSection == "morePlaying"{
            self.navBar.topItem?.title = "Now Playing"
        }
        else{
            self.navBar.topItem?.title = "Popular"
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.resultOfData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moreCell", for: indexPath as IndexPath) as! MOShowMoreCollectionViewCell
        
        let filmData : FilmData? = self.vm.resultOfData[indexPath.row]
        let url:URL = URL(string: "https://image.tmdb.org/t/p/original/"+(filmData?.poster_path ?? "gLhu8UFPZfH2Hv11JhTZkb9CVl.jpg"))!
        MOImageLoader.shared.downloadImage(url: url, completation: { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data:data)
                    cell.showMoreImage.image = image
                }
                
            case .failure(let failure):
                print(String(describing: failure))
                break
            }
        })
        cell.showMoreTitle.text = filmData?.title
        cell.showMoreDescription.text = filmData?.overview

        
        /*cell.showMoreImage.image = UIImage(named: "Poster-1")
        cell.showMoreTitle.text = "Hello"
        cell.showMoreDescription.text = "Detail More"*/
        return cell
    }


}
