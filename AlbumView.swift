//
//  AlbumView.swift
//  BlueLibrarySwift
//
//  Created by Guoliang Wang on 5/19/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.

/**

tutorial link: http://www.raywenderlich.com/86477/introducing-ios-design-patterns-in-swift-part-1
part 2: http://www.raywenderlich.com/90773/introducing-ios-design-patterns-in-swift-part-2

*/

//

import UIKit

class AlbumView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    private var coverImage: UIImageView!
    private var indicator: UIActivityIndicatorView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = UIColor.blackColor()
        coverImage = UIImageView(frame: CGRect(x : 5, y: 5, width: frame.size.width - 10, height: frame.size.height - 10))
        addSubview(coverImage)
        indicator = UIActivityIndicatorView()
        indicator.center = center
        indicator.activityIndicatorViewStyle = .WhiteLarge
        indicator.startAnimating()
        addSubview(indicator)
    }
    
    func highlightAlbum(#didHighlightView: Bool) {
        if didHighlightView == true {
            backgroundColor = UIColor.whiteColor()
        } else {
            backgroundColor = UIColor.blackColor()
        }
    }

}
