//
//  NGWWDCViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 16/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGWWDCViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data : Array<WWDCDescriptor> = []
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        data = DataManager.shared.getWWDCData()
        self.collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView?.registerNib(UINib(nibName: "NGConferenceCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.navigationItem.title = "WWDC 2014".uppercaseString
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! NGConferenceCell
        
        let current : WWDCDescriptor = data[indexPath.row]
        
        cell.populate(current)
        
        return cell
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
