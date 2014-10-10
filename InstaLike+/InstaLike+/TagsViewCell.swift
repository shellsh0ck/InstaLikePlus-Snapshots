//
//  TagsViewCell.swift
//  InstaLike+
//
//  Created by Georgy Savatkov on 10/10/14.
//  Copyright (c) 2014 FIM Studio. All rights reserved.
//

import UIKit

class TagsViewCell: UITableViewCell {

    let tagsLabel: UILabel!
    let copyBtn: UIButton!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tagsLabel = UILabel()
        tagsLabel.numberOfLines = 4
        tagsLabel.textAlignment = .Center
        
        copyBtn = UIButton()
        copyBtn.layer.borderColor = UIColor(red: 138/255.0, green: 61/255.0, blue: 139/255.0, alpha: 1.0).CGColor
        copyBtn.layer.borderWidth = 0.8
        copyBtn.titleLabel?.textAlignment = .Center
        copyBtn.setTitleColor(UIColor(red: 138/255.0, green: 61/255.0, blue: 139/255.0, alpha: 1.0), forState: UIControlState.Normal)
        copyBtn.setTitle("Copy", forState: UIControlState.Normal)
        copyBtn.addTarget(self, action: "copyToClipboard:", forControlEvents: UIControlEvents.TouchUpInside)
        
        contentView.addSubview(tagsLabel)
        contentView.addSubview(copyBtn)
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // DAFAQ
    
    @IBAction func copyToClipboard(sender:UIButton)
    {
        UIPasteboard.generalPasteboard().string = self.tagsLabel.text
        UIView.animateWithDuration(0.5, animations: {
            self.copyBtn.backgroundColor = UIColor(red: 138/255.0, green: 61/255.0, blue: 139/255.0, alpha: 1.0)
            self.copyBtn.setTitle("Copied!", forState: UIControlState.Normal)
            self.copyBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            }, completion: {
                (value: Bool) in
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.copyBtn.setTitle("Copy", forState: UIControlState.Normal)
                    self.copyBtn.backgroundColor = UIColor.clearColor()
                    self.copyBtn.setTitleColor(UIColor(red: 138/255.0, green: 61/255.0, blue: 139/255.0, alpha: 1.0), forState: UIControlState.Normal)
                })
        })

    }
}
