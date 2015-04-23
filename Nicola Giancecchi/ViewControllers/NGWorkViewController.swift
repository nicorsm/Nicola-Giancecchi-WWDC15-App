//
//  NGWorkViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 17/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGWorkViewController: UIViewController, WebBrowserDelegate, ProjectsDelegate, UIScrollViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var works : Array<Work> = Array<Work>()
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView?.registerNib(UINib(nibName: "NGWorkCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.automaticallyAdjustsScrollViewInsets = false

        self.works = DataManager.shared.getWork()
        self.collectionView.reloadData()
        
        self.pageControl.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        self.pageControl.numberOfPages = self.works.count
        self.pageControl.currentPage = 0
        
        self.navigationItem.title = "WORK"
        self.navigationController?.navigationBar.barTintColor = UIColor().hexStringToUIColor("#4082bd")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.y/self.view.frame.size.height)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.works.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! NGWorkCell
        
        let work : Work = self.works[indexPath.row]
        
        cell.populate(work)
        cell.delegate = self
        cell.projects_delegate = self
        
        return cell
    }
    
    func openURL(url: String) {
        let browser : NGBrowserViewController = NGBrowserViewController(url:url)
        self.navigationController?.pushViewController(browser, animated: true)
    }
    
    func openProjects(ownershipGroup: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let projects : NGProjectsViewController = storyboard.instantiateViewControllerWithIdentifier("projects") as! NGProjectsViewController
        projects.ownership = ownershipGroup
        self.navigationController?.pushViewController(projects, animated: true)
    }


}
