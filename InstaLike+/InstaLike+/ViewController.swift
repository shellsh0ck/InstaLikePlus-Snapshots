//
//  ViewController.swift
//  InstaLike+
//
//  Created by Vitaly Sulimov on 2014-10-10.
//  Copyright (c) 2014 FIM Studio. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
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
    Set light statusBar Style
    */
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc = TagsViewController()
        vc.category = fileSystem.Categories[indexPath.row]
        self.showViewController(vc, sender: vc)
    }
    
    /*
    Load categories from filesystem
    */
    func loadCategories() {
        fileSystem.Categories = [
            Category(title: "Nature", image: "nature", tagSets:
                [
                    TagsSet(tags: "Смерть в глазах, в душе Аллах"),
                    TagsSet(tags: "Смерть в глазах, в душе Аллах")
                ]
            ),
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

class TagsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var category: Category?
    var tagsSetsTableView: UITableView!
    override func viewDidLoad() {
        initHeader(category!.Title, image: category?.Image)
         initTableView()
        
    }
    // Rendering each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tagsSetsTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as TagsViewCell
        let dataModel = category?.TagSets[indexPath.row]
        cell.tagsLabel.text = dataModel?.Tags
        
        
        cell.tagsLabel.frame = CGRectMake(10, 10, cell.frame.width-20, cell.frame.height * 0.6)
        cell.copyBtn.frame = CGRectMake(cell.frame.width / 2 - 60, cell.tagsLabel.frame.height + 20, 120, 40)
        return cell

    }
    // Returns number of rows to render, depending on category.TagsSets.count
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category!.TagSets.count
    }
    
    func initTableView() {
        tagsSetsTableView = UITableView(frame: CGRectMake(0, self.view.frame.height * 0.15, self.view.frame.width, self.view.frame.height * 0.85))
        tagsSetsTableView.backgroundColor = UIColor.whiteColor()
        tagsSetsTableView!.dataSource = self
        tagsSetsTableView!.delegate = self
        tagsSetsTableView!.registerClass(TagsViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tagsSetsTableView!)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180
    }
    /*
    Function that init app header with image, if image not passed - init header with label "Categories"
    */
    func initHeader(title: String, image:String?) {
        /* Implementing header image */
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
        
        /* End */
        
        /* Implementing header title label */
        let headerTitle = UILabel(frame: CGRectMake(0, headerBody.frame.height / 2 - 16, headerBody.frame.width, 30))
        headerTitle.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        headerTitle.textColor = UIColor.whiteColor()
        headerTitle.textAlignment = NSTextAlignment.Center
        headerTitle.text = "\(title)"
        /* end */
        
        /* Implementing back btn */
        
        let backBtn = UIButton(frame: CGRectMake(10, headerBody.frame.height / 2 - 16, 70, 32))
        backBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        backBtn.layer.borderWidth = 0.8
        backBtn.layer.borderColor = UIColor.whiteColor().CGColor
        backBtn.setTitle("Back", forState: UIControlState.Normal)
        backBtn.titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        /* End */
        
        
        self.view.addSubview(headerBody)
        self.view.addSubview(headerTitle)
        self.view.addSubview(backBtn)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}

