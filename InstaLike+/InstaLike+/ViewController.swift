//
//  ViewController.swift
//  InstaLike+
//
//  Created by Vitaly Sulimov on 2014-10-10.
//  Copyright (c) 2014 FIM Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var collectionView: UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initUI()
        initHeader("Categories", image: nil)
        loadCategories()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    Function that init main UI
    */
    func initUI() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: self.view.frame.height * 0.15 + 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.width / 2 - 15 , height: self.view.frame.width / 2 - 15)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CategoriesCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
    }
    
    /*
    Function that calculate how many cell's need.
    */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fileSystem.Categories.count
    }
    
    /*
    Function that draw cell's
    */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as CategoriesCell
        var cellModel = fileSystem.Categories[indexPath.row]
        
        cell.textLabel.text = cellModel.Title
        cell.imageView.image = UIImage(named: cellModel.Image)

        return cell
    }
    
    /*
    Function that init app header with image, if image not passed - init header with label "Categories"
    */
    func initHeader(title: String, image:String?) {
        
        let headerBody: UIImageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height*0.15))
        
        /* Determining if image is not nil, if so init header with image else init with default color. */
        if image == nil {
            headerBody.backgroundColor = UIColor(red: 138/255.0, green: 61/255.0, blue: 139/255.0, alpha: 1.0)
        }
        else {
            headerBody.image = UIImage(named: image!)
            headerBody.contentMode = UIViewContentMode.ScaleAspectFill
        }
        /*End*/
        
        self.view.addSubview(headerBody)
        let headerTitle = UILabel(frame: CGRectMake(0, headerBody.frame.height / 2 - 10, headerBody.frame.width, 30))
        headerTitle.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        headerTitle.textColor = UIColor.whiteColor()
        headerTitle.textAlignment = NSTextAlignment.Center
        headerTitle.text = "\(title)"
        self.view.addSubview(headerTitle)
    }
    
    /*
    Load categories from filesystem
    */
    func loadCategories() {
        fileSystem.Categories = [
            Category(title: "Nature", image: "nature"),
            Category(title: "Love", image: "love"),
            Category(title: "Weather", image: "weather"),
            Category(title: "Sport", image: "sport"),
            Category(title: "Animals", image: "animals"),
            Category(title: "People", image: "people"),
            Category(title: "Selfies", image: "selfie"),
            Category(title: "Holidays", image: "holidays"),
            Category(title: "Party", image: "party"),
            Category(title: "Family", image: "family"),
            Category(title: "Monochrome", image: "b&w"),
            Category(title: "Urban", image: "urban"),
            Category(title: "Food", image: "food"),
            Category(title: "Drinks", image: "drinks"),
            Category(title: "Fashion", image: "fashion"),
            Category(title: "Entertainment", image: "music"),
            Category(title: "Electronics", image: "electronics"),
            Category(title: "Travel", image: "travel")
        ]
    }

}

