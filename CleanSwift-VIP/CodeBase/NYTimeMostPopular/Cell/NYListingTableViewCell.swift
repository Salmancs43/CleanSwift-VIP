//
//  NYListingTableViewCell.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import UIKit
import Kingfisher
import AVFoundation

class NYListingTableViewCell: UITableViewCell {

    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelAuthor: UILabel!
    @IBOutlet var labelHeading: UILabel!
    @IBOutlet var mediaImage: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData(object : NYMostPopularResult)
    {
        labelHeading.text = object.title
        labelAuthor.text  = object.byline
        labelDate.text = object.published_date
        
        mediaImage.makeImageViewCircle()
        mediaImage.backgroundColor = UIColor.lightGray
        
        
        if object.media.count > 0
        {
            let mediaObject = object.media.first
            
            if let mediaMetaData = mediaObject?.mediametadata.first
            {
                if var imageUrl = mediaMetaData.url
                {
                    mediaImage.downloadImageUsingkingfisher(url: &imageUrl, placeholder: nil)
                }
                
               
           }
        }
        
    }

}
