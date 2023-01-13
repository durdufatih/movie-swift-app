//
//  MOShowMoreCollectionViewCell.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 13.01.2023.
//

import UIKit

class MOShowMoreCollectionViewCell: UICollectionViewCell {
    
    @IBAction func clickedDetailButton(_ sender: Any) {
        print("Detail Button")
    }
    @IBOutlet weak var showMoreDescription: UILabel!
    @IBOutlet weak var showMoreTitle: UILabel!
    @IBOutlet weak var showMoreImage: UIImageView!
}
