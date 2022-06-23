//
//  HomeCollectionViewCell.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    func setValues(name:String,image:String){
        self.textlabel.text = name
        self.imageview.loadFrom(URLAddress: "image")
    }

}
