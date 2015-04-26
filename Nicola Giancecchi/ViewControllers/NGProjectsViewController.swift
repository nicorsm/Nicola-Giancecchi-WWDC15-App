//
//  NGProjectsViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 15/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit
import Swift

let identifier = "cell"

class NGProjectsViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, UICollectionViewDataSource, UICollectionViewDelegate{

    
    @IBOutlet weak var collectionView: UICollectionView!
    var pageController : UIPageViewController?
    var viewControllers : NSMutableArray = NSMutableArray()
    var projects : Array<Project> = Array<Project>()
    var ownership : String?
    var currentIndex : Int = 0
    @IBOutlet weak var pageContainerView: UIView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.registerNib(UINib(nibName: "NGProjectCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        
        self.navigationItem.title = "Projects".uppercaseString
        
        self.pageController = UIPageViewController(transitionStyle: .Scroll , navigationOrientation: .Horizontal , options: nil)
        self.pageController!.dataSource = self
        self.pageController!.delegate = self
        self.pageController!.view.backgroundColor = UIColor.darkGrayColor()
        
        self.pageController!.view.frame = self.pageContainerView.bounds;
        self.addChildViewController(self.pageController!)
        self.pageContainerView.addSubview(self.pageController!.view)
        self.pageController?.didMoveToParentViewController(self)
        
        self.projects = DataManager.shared.getProjects()
        
        if ownership != nil && ownership != "" {
            self.projects = self.projects.filter() { $0.ownershipGroup == self.ownership }
        }
        
        
        for var i = 0; i < projects.count; i++ {
            let vc : NGProjectDetailViewController = NGProjectDetailViewController(project:self.projects[i])
            vc.pageIndex = i
            self.viewControllers.addObject(vc)
        }
        
        self.pageController!.setViewControllers([self.viewControllers[self.currentIndex]], direction:UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        self.navigationItem.title = "PROJECTS"
        self.navigationController?.navigationBar.barTintColor = UIColor().hexStringToUIColor("#a01e00")
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject], transitionCompleted completed: Bool) {
        if completed{
            let vc : NGProjectDetailViewController = pageViewController.viewControllers.last as! NGProjectDetailViewController
            self.currentIndex = vc.pageIndex
            collectionView.reloadData()
            self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: self.currentIndex, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        }
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let idx : Int = self.viewControllers.indexOfObject(viewController)
        if idx < self.projects.count-1 {
            return self.viewControllers[idx+1] as! NGProjectDetailViewController
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let idx : Int = self.viewControllers.indexOfObject(viewController)
        if idx > 0 {
            return self.viewControllers[idx-1] as! NGProjectDetailViewController
        }
        return nil
    }
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.viewControllers.count
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.projects.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : NGProjectCell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! NGProjectCell
        let project : Project = self.projects[indexPath.item]
        cell.populate(project)
        
        let idx : Int = self.currentIndex;
        if(indexPath.item == idx){
            cell.backgroundColor = UIColor().hexStringToUIColor(project.appColor)
            cell.lblAppName.textColor = UIColor().hexStringToUIColor(project.textColor)
        } else {
            cell.backgroundColor = UIColor.clearColor()
            cell.lblAppName.textColor = UIColor.whiteColor()
        }
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.currentIndex = indexPath.item
        self.pageController!.setViewControllers([self.viewControllers[self.currentIndex]], direction: self.currentIndex>indexPath.row ? .Reverse : .Forward, animated: true) { (Bool) -> Void in
            collectionView.reloadData()
            self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: self.currentIndex, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
