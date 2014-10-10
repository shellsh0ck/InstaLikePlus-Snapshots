//
//  CategoriesCell.swift
//  InstaLike+
//
//  Created by Vitaly Sulimov on 2014-10-10.
//  Copyright (c) 2014 FIM Studio. All rights reserved.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    /*
    Categories fields (Label and image)
    */
    let textLabel: UILabel!
    let imageView: UIImageView!
    
    /*
    Init function
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(imageView)
        
        let textFrame = CGRect(x: 0, y: imageView.frame.size.height, width: frame.size.width, height: frame.size.height/3)
        textLabel = UILabel(frame: textFrame)
        textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        textLabel.textAlignment = .Center
        contentView.addSubview(textLabel)
    }
    
    /*
    Add-on to init function
    */
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
