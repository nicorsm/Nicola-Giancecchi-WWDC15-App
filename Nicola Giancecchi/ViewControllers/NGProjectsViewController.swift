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
    var viewControllers : NSMutableArray
    var projects : Array<Project>
    var currentViewController : NGProjectDetailViewController
    var startingIndex : Int
    var rtl : Bool = false
    @IBOutlet weak var pageContainerView: UIView!
    
    required init(coder aDecoder: NSCoder) {
        self.viewControllers = NSMutableArray()
        self.currentViewController = NGProjectDetailViewController()
        self.startingIndex = 0
        self.projects = Array<Project>()
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.registerNib(UINib(nibName: "NGProjectCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        
        self.navigationItem.title = "Projects".uppercaseString
        
        self.pageController = UIPageViewController(transitionStyle: .Scroll , navigationOrientation: .Horizontal , options: nil)
        self.pageController!.dataSource = self
        self.pageController!.delegate = self
        
        self.pageController!.view.frame = self.pageContainerView.bounds;
        self.addChildViewController(self.pageController!)
        self.pageContainerView.addSubview(self.pageController!.view)
        self.pageController?.didMoveToParentViewController(self)
        
        self.projects = DataManager.shared.getProjects()
        
        for var i = 0; i < projects.count; i++ {
            let vc : NGProjectDetailViewController = NGProjectDetailViewController(project:self.projects[i])
            self.viewControllers.addObject(vc)
        }
        
        currentViewController = self.viewControllers[self.startingIndex] as! NGProjectDetailViewController
        self.pageController!.setViewControllers([currentViewController], direction:UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        let idx : Int = self.viewControllers.indexOfObject(currentViewController)
        if(indexPath.item == idx){
            cell.backgroundColor = UIColor().hexStringToUIColor(project.appColor)
            cell.lblAppName.textColor = UIColor().hexStringToUIColor(project.textColor)
        } else {
            cell.backgroundColor = UIColor.clearColor()
            cell.lblAppName.textColor = UIColor.whiteColor()
        }
        return cell
        
    }
    
    // MARK controllare indici
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let idx : Int = self.viewControllers.indexOfObject(currentViewController)
        currentViewController = self.viewControllers[indexPath.item] as! NGProjectDetailViewController
        self.pageController!.setViewControllers([currentViewController], direction: idx>indexPath.row ? .Reverse : .Forward, animated: true) { (Bool) -> Void in
            collectionView.reloadData()
        }
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject], transitionCompleted completed: Bool) {
        if finished{
            collectionView.reloadData()
            let idx : Int = self.viewControllers.indexOfObject(previousViewControllers.last!)
            //self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: idx+1, inSection: 0), atScrollPosition: .Left, animated: true)
            //MARK: CONTROLLARE FUNZIONAMENTO
        }
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let idx : Int = self.viewControllers.indexOfObject(viewController)
        if idx < self.projects.count-1 {
            rtl = true
            currentViewController = self.viewControllers[idx+1] as! NGProjectDetailViewController
            return currentViewController
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let idx : Int = self.viewControllers.indexOfObject(viewController)
        if idx > 0 {
            rtl = false
            currentViewController = self.viewControllers[idx-1] as! NGProjectDetailViewController
            return currentViewController
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.viewControllers.count
    }
    

}
