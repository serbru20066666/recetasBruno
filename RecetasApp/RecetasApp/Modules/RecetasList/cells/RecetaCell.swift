//
//  RecetaCell.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//

import UIKit
import AlamofireImage

class RecetaCell: UITableViewCell {
    @IBOutlet weak var imageReceta: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
    }
    
    func customize(){
        imageReceta.layer.masksToBounds = true
        imageReceta.layer.borderColor = UIColor.lightGray.cgColor
        imageReceta.layer.borderWidth = 1.0 / UIScreen.main.scale
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageReceta.af_cancelImageRequest()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageReceta.layer.cornerRadius = imageReceta.frame.width / 2.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: RecetasViewItemInterface) {
        labelName.text = item.title

        if let url = item.imageURL {
            imageReceta.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "image-placeholder"))
        } else {
            imageReceta.image = #imageLiteral(resourceName: "image-placeholder")
        }
    }
    
}
