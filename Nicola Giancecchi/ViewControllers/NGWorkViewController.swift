//
//  NGWorkViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 17/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGWorkViewController: UIViewController, WebBrowserDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var works : Array<Work> = Array<Work>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView?.registerNib(UINib(nibName: "NGWorkCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.automaticallyAdjustsScrollViewInsets = false

        self.works = DataManager.shared.getWork()
        self.collectionView.reloadData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.works.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! NGWorkCell
        
        let work : Work = self.works[indexPath.row]
        
        cell.populate(work)
        cell.delegate = self
        
        return cell
    }
    
    func openURL(url: String) {
        let browser : NGBrowserViewController = NGBrowserViewController(url:url)
        self.navigationController?.pushViewController(browser, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
