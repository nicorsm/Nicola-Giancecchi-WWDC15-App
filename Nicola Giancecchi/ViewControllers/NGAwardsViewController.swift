//
//  NGAwardsViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 17/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

let anotherIdentifier : String = "anotherIdentifier"

class NGAwardsViewController: UIViewController , WebBrowserDelegate, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate{

    var awards : Array<Award> = Array<Award>()
    private var wwdcAwardsReaded : Bool = false
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.registerNib(UINib(nibName: "NGWWDCAwardCell", bundle: nil), forCellWithReuseIdentifier: anotherIdentifier)
        self.collectionView!.registerNib(UINib(nibName: "NGAwardsCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.awards = DataManager.shared.getAwards()
        
        self.pageControl.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        self.pageControl.numberOfPages = self.awards.count+1
        self.pageControl.currentPage = 0
        
        self.collectionView?.reloadData()
        
        self.navigationItem.title = "AWARDS"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBar.barTintColor = UIColor().hexStringToUIColor("#ff5253")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.y/self.view.frame.size.height)
    }


    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.awards.count+1
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if(indexPath.row==0){
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(anotherIdentifier, forIndexPath: indexPath) as! NGWWDCAwardCell
            if(!self.wwdcAwardsReaded){
                cell.animate()
                self.wwdcAwardsReaded = true
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! NGAwardsCell
            
            let award : Award = self.awards[indexPath.row-1]
            cell.populate(award)
            cell.delegate = self
            
            if !award.animation_visited {
                award.animation_visited = true
                cell.animate()
            }
            
            
            return cell
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row==0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let wwdc : NGWWDCViewController = storyboard.instantiateViewControllerWithIdentifier("wwdc") as! NGWWDCViewController
            self.navigationController?.pushViewController(wwdc, animated: true)
        }
    }
    
    func openURL(url: String) {
        let browser : NGBrowserViewController = NGBrowserViewController(url: url)
        self.navigationController?.pushViewController(browser, animated: true)
    }
    

}
