//
//  IndicatorCell.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 15.01.2023.
//

import UIKit

class IndicatorCell: UICollectionViewCell {
    var inidicator : UIActivityIndicatorView = {
            let view = UIActivityIndicatorView()
            view.style = .large
            //view.backgroundColor = .green
            view.hidesWhenStopped = true
            //view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setup()
        }
        
        func setup(){
            contentView.addSubview(inidicator)
            inidicator.center = contentView.center
            //inidicator.widthAnchor.constraint(equalToConstant: 250).isActive = true
            //inidicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
            //inidicator.center. = CGPoint(x: contentView.centerXAnchor, y: contentView.centerYAnchor)
            //inidicator.center = contentView.convert(contentView.center, from: contentView)
    
            inidicator.startAnimating()
        }
    
}
