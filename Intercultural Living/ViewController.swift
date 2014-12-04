//
//  ViewController.swift
//  Intercultural Living
//
//  Created by Marcus Nygren on 2014-11-19.
//  Copyright (c) 2014 Intercultural Living AB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var test: UINavigationItem!
    @IBOutlet weak var apartmentImage: UIImageView!
    @IBOutlet weak var xPos: UILabel!
    @IBOutlet weak var yPos: UILabel!
    @IBOutlet weak var xPercentage: UILabel!
    @IBOutlet weak var yPercentage: UILabel!
    
    let tap = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //init tap
        tap.addTarget(self, action: "tappedView")
        apartmentImage.addGestureRecognizer(tap)
        apartmentImage.userInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedView() {
        //get tapping positiong
        var pos : CGPoint = tap.locationInView(apartmentImage)
        var x : CGFloat = pos.x
        var y : CGFloat = pos.y
        
        //get image information
        var imageBounds : CGRect = apartmentImage.bounds
        var image : UIImage = apartmentImage.image!
        var imageScale : CGFloat = image.scale

        //calculate image width and height in pixels from bounds and scale
        var width : CGFloat = imageBounds.size.width * imageScale
        var height : CGFloat = imageBounds.size.height * imageScale
        
        //calculate tapping position in percentage of image width and height
        var xPer : CGFloat = 100 * x / width
        var yPer : CGFloat = 100 * y / height
        
        //print stuff for now
//        xPos.text = pos.x.description
//        yPos.text = pos.y.description
//        xPercentage.text = xPer.description
//        yPercentage.text = yPer.description
        
        if ( 79 <= xPer && xPer <= 86 && 85 <= yPer && yPer <= 94 ) {
            let stoveMainView = self.storyboard?.instantiateViewControllerWithIdentifier("stoveMainView") as StoveController
            self.navigationController?.pushViewController(stoveMainView, animated: true)
        }
        
    }


}

