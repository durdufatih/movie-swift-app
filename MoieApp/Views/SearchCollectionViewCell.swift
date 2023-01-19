//
//  SearchCollectionViewCell.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 16.01.2023.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    
    private let coreDataService = CoreDataService()
    @IBOutlet weak var searchDescription: UILabel!
    @IBOutlet weak var searchTitle: UILabel!
    @IBOutlet weak var seardImageView: UIImageView!
    
    
    @IBOutlet weak var favoriteButton: UIButton!
    var parentVC: UIViewController!
    
    
    @IBAction func favoriteActionClick(_ sender: UIButton) {
        
        coreDataService.saveData(title: self.searchTitle!.text!, description: self.searchDescription!.text!) { result in
            if result{
                self.showAlertAction(title: "Favorite", message: "Item has been added to list")
            }
        }
    }
    
    func showAlertAction(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        if parentVC != nil{
            parentVC!.present(alert, animated: true, completion: .none)
        }
    }
    
    
    
    
}
