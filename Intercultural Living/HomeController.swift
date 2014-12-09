//
//  HomeController.swift
//  Intercultural Living
//
//  Created by Tomas Walander on 04/12/14.
//  Copyright (c) 2014 Intercultural Living AB. All rights reserved.
//

import UIKit

class HomeController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var icons:[String] = []
    var modules:[String] = []
    var progress:[Float] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        icons = [ "icon_home_migration_office.png" , "icon_home_work_office.png" , "icon_home_living.png" , "icon_home_sweden.png" , "icon_home_other.png" ]
        progress = [ 0.5 , 0.6 , 0.0 , 0.2 , 0.3 ]
        modules = [ "" , "" , "apartmentView" , "", "" ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int{
        return 1
    }
    
    func collectionView(collectionView: UICollectionView,cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell : CustomHomeCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("homeCollectionViewCell", forIndexPath: indexPath) as CustomHomeCollectionViewCell
        cell.imageView.image=UIImage(named: icons[indexPath.row]) //UIImage(named: icons[indexPath.row])
        cell.progressBar.setProgress(progress[indexPath.row], animated: true)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
//        var goto : String = modules[indexPath.row]
//        if ( goto != "" ) {
//            let stoveMainView = self.storyboard?.instantiateViewControllerWithIdentifier(goto) as StoveController
//            self.navigationController?.pushViewController(stoveMainView, animated: true)
//        }
    }
    
}
