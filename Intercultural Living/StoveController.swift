//
//  StoveController.swift
//  Intercultural Living
//
//  Created by Tomas Walander on 03/12/14.
//  Copyright (c) 2014 Intercultural Living AB. All rights reserved.
//

import UIKit
import MediaPlayer

class StoveController : UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var icons:[String] = []
    var clips:[String] = []
    
    var clip : AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("clip")
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue!,forKey:"clip")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        icons = [ "icon_stove_plate_size.png" , "icon_stove_handle.png" , "icon_stove_not_leave.png" , "icon_stove_fire.png" ]
        clips = [ "movie_stove_plate_size" , "" , "" , "" ]
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int{
        return 1
    }
    
    func collectionView(collectionView: UICollectionView,cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell : CustomCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewCell", forIndexPath: indexPath) as CustomCollectionViewCell
        cell.imageView.image=UIImage(named: icons[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        var clip = clips[indexPath.row]
        if ( clip != "" ) {
            let path : String = NSBundle.mainBundle().pathForResource(clip, ofType: "mp4")!
            let pathURL = NSURL.fileURLWithPath(path)
            let myPlayer = MPMoviePlayerViewController(contentURL: pathURL)
            myPlayer.moviePlayer.repeatMode = .None
            presentMoviePlayerViewControllerAnimated(myPlayer)
        } else {
            var alert = UIAlertController(title: "Not available", message: "This clip is not available in the demo version.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    
}