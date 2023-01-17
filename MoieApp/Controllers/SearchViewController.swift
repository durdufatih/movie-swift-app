//
//  SearchViewController.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 16.01.2023.
//

import UIKit

final class SearchViewController : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate{
    
    let vm = SearchPageViewModel()
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchInput: UITextField!
    
    @IBAction func searchButtonAction(_ sender: Any) {
        if searchInput.hasText {
            self.vm.fetchDetailOfData(title: self.searchInput.text!) { result in
                if !result{
                    DispatchQueue.main.async {
                        self.searchCollectionView.reloadData()
                    }
                }
            }
            
        }
        else{
            showAlertAction(title: "Text Error Problem", message: "Textfield doesn't have text")
        }
        
    }
    override func viewDidLoad() {
        self.searchInput.delegate = self;
        self.searchCollectionView.dataSource = self
        self.searchCollectionView.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.searchInput.text = "Search Movie..."
        self.searchInput.resignFirstResponder() 
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.vm.clearData()
        self.searchCollectionView.reloadData()
        
    }
    
    func showAlertAction(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            print("Action")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.text = ""
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.resultOfData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath as IndexPath) as! SearchCollectionViewCell
        
        let filmData : FilmData? = self.vm.resultOfData[indexPath.row]
        let url:URL = URL(string: "https://image.tmdb.org/t/p/original/"+(filmData?.poster_path ?? "gLhu8UFPZfH2Hv11JhTZkb9CVl.jpg"))!
    

        cell.seardImageView.kf.setImage(with: url)
        cell.searchTitle.text = filmData?.title
        cell.searchDescription.text = filmData?.overview
        

        return cell
    }
    
    
}
