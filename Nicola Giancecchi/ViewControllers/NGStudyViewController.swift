//
//  NGStudyViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 14/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class NGStudyViewController: UIViewController, WebBrowserDelegate, ProjectsDelegate, UIScrollViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var data : Array<School> = []
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.registerNib(UINib(nibName: "NGStudyCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        
        self.navigationItem.title = "Study".uppercaseString
        
        data = DataManager.shared.getStudy()
        self.collectionView.reloadData()
        self.pageControl.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        self.pageControl.numberOfPages = data.count
        self.pageControl.currentPage = 0
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.navigationItem.title = "STUDY"
        self.navigationController?.navigationBar.barTintColor = UIColor().hexStringToUIColor("#467b46")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.y/self.view.frame.size.height)
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! NGStudyCell
        
        let current : School = data[indexPath.row]
        cell.delegate = self
        cell.populateSchool(current)
        cell.projects_delegate = self
        return cell
    }
    
    func openURL(url: String) {
        let browser : NGBrowserViewController = NGBrowserViewController(url: url)
        self.navigationController?.pushViewController(browser, animated: true)
    }
    
    func openProjects(ownershipGroup: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let projects : NGProjectsViewController = storyboard.instantiateViewControllerWithIdentifier("projects") as! NGProjectsViewController
        projects.ownership = ownershipGroup
        self.navigationController?.pushViewController(projects, animated: true)
    }

}
