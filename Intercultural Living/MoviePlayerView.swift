//
//  MoviePlayerView.swift
//  Intercultural Living
//
//  Created by Tomas Walander on 04/12/14.
//  Copyright (c) 2014 Intercultural Living AB. All rights reserved.
//

import UIKit
import MediaPlayer

class MoviePlayerView: UIViewController {

    var name : AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("clip")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path : String = NSBundle.mainBundle().pathForResource("stove_movie", ofType: "mp4")!
        let pathURL = NSURL.fileURLWithPath(path)
        let myPlayer = MPMoviePlayerViewController(contentURL: pathURL)
        myPlayer.moviePlayer.repeatMode = .None
        presentMoviePlayerViewControllerAnimated(myPlayer)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
