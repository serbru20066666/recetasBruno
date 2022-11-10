//
//  recetaInfoCell.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//

import UIKit

protocol recetaInfoCellProtocol{
    func showMapWithReceta(receta:RecetasViewItemInterface)
}

class recetaInfoCell: UITableViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageReceta: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    var delegate:recetaInfoCellProtocol?
    var recetaInterface:RecetasViewItemInterface?
    override func awakeFromNib() {
        super.awakeFromNib()
        labelTitle.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: RecetasViewItemInterface) {
        self.recetaInterface = item
        labelTitle.text = item.title?.capitalized

        if let url = item.imageURL {
            imageReceta.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "image-placeholder"))
        } else {
            imageReceta.image = #imageLiteral(resourceName: "image-placeholder")
        }
        
        labelDescription.text = item.description
    }
    
    @IBAction func onTapShowMap(_ sender: Any) {
        guard let receta = self.recetaInterface else {return}
        delegate?.showMapWithReceta(receta: receta)
    }
}
