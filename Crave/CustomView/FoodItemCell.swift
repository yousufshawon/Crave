//
//  FoodItemCell.swift
//  Crave
//
//  Created by Yousuf on 5/8/23.
//

import UIKit

class FoodItemCell: UICollectionViewCell {
    
    static let identifierName = "FoodItemCell"

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageViewBanner: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(todaySpecial : TodaySpecial) {
        labelName.text = todaySpecial.name
        labelPrice.text = "\( todaySpecial.price)"
        loadImage(imageUrl: todaySpecial.imageUrl)
        labelDescription.text = todaySpecial.description
    }
    
    func bind(dessert: Dessert) {
        labelName.text = dessert.name
        labelPrice.text = "\( dessert.price)"
        loadImage(imageUrl: dessert.imageUrl)
        labelDescription.text = dessert.description
    }
    
    private func loadImage(imageUrl : String) {
        if(!imageUrl.isEmpty) {
            imageViewBanner.load(url:buildImageUrl(imageUrl: imageUrl))
        }
    }
    
    private func buildImageUrl(imageUrl:String) -> URL {
        return URL(string: imageUrl) ?? URL(fileURLWithPath: "donut")
    }
    
}
