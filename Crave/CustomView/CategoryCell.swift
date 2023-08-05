//
//  CategoryCell.swift
//  Crave
//
//  Created by Yousuf on 29/7/23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifierName = "CategoryCell"

    @IBOutlet weak var imageViewCategory: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        initView()
    }
    
    private func initView() {
        imageViewCategory.makeCircleShape()
    }
    
    func bindView(category:Category) {
        labelName.text = category.name
        let url = buildImageUrl(imageUrl: category.imageUrl)
        imageViewCategory.load(url: url)
    }
    
    private func buildImageUrl(imageUrl:String) -> URL {
       // if(imageUrl.isEmpty) {
       //     return URL(fileURLWithPath: "donut")
       // }
        return URL(string: imageUrl) ?? URL(fileURLWithPath: "donut")
    }
    
    static func getCellSize() -> CGSize{
        let cellWidth = 5 + 80 + 5
        let cellHeight = 5 + 80 + 35 + 5
        return CGSize(width: cellWidth, height: cellHeight)
        
        
    }
    
}
