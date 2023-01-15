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
    var loadingMore = false
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var showMoreCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showMoreCollectionView.delegate = self
        showMoreCollectionView.dataSource = self
        showMoreCollectionView.register(IndicatorCell.self, forCellWithReuseIdentifier: "indicator")
        self.showMoreCollectionView.reloadData()
        self.vm.fetchDetailOfData(moModelType: self.stateOfActualSection)
        self.showMoreCollectionView.reloadData()
        self.setTitle()
        

        // Do any additional setup after loading the view.
    }
    
    /*func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        //self.vm.fetchDetailOfData(moModelType: self.stateOfActualSection)
        for indexPath in indexPaths {
              print("Hello: \(indexPath)")
              // veriyi önceden yükle
        }
    }*/
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.vm.resultOfData.count-1{
                self.vm.fetchDetailOfData(moModelType: self.stateOfActualSection)
                self.showMoreCollectionView.reloadData()
            
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
        return vm.resultOfData.count>0 ? vm.resultOfData.count + 1 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row != vm.resultOfData.count){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moreCell", for: indexPath as IndexPath) as! MOShowMoreCollectionViewCell
            
            let filmData : FilmData? = self.vm.resultOfData[indexPath.row]
            let url:URL = URL(string: "https://image.tmdb.org/t/p/original/"+(filmData?.poster_path ?? "gLhu8UFPZfH2Hv11JhTZkb9CVl.jpg"))!
            cell.showMoreImage.kf.setImage(with: url)
            cell.showMoreTitle.text = filmData?.title
            cell.showMoreDescription.text = filmData?.overview
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "indicator", for: indexPath) as! IndicatorCell
        
            cell.inidicator.startAnimating()
            return cell
        }
    }
    
   /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = collectionView.frame.size
        let cellHeight =  (indexPath.row == vm.resultOfData.count && loadingMore) ? 100 : (size.height / 3)
            return CGSize(width: size.width , height: cellHeight)
        }*/


}
