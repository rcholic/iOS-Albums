//
//  HorizontalScroller.swift
//  BlueLibrarySwift
//
//  Created by Guoliang Wang on 5/25/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.
//

import UIKit

//define a protocol named HorizontalScrollerDelegate
//make it use @optional delegate methods like in obj-c
@objc protocol HorizontalScrollerDelegate {
    // ask the delegate how many views he wants to present inside the horizontal scroller
    func numberOfViewsForHorizontalScroller(scroller: HorizontalScroller) -> Int
    // ask the delegate to return the view that should appear at <index>
    func horizontalScrollerViewAtIndex(scroller: HorizontalScroller, index:Int) -> UIView
    // inform the delegate what the view at <index> has been clicked
    func horizontalScrollerClickedViewAtIndex(scroller: HorizontalScroller, index:Int)
    // ask the delegate for the index of the initial view to display. this method is optional
    // and defaults to 0 if it's not implemented by the delegate
 //   optional func initialViewIndex(scroller: HorizontalScroller) -> Int
}

class HorizontalScroller: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    weak var delegate: HorizontalScrollerDelegate?
    
    // constants to make it easy to modify the layout at design time
    private let VIEW_PADDING = 10
    private let VIEW_DIMENSIONS = 100
    private let VIEWS_OFFSET = 100
    
    // create the scroll view containing the views
    private var scroller : UIScrollView!
    // create an array that holds all the album covers
    var viewArray = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeScrollView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeScrollView()
    }
    
    func initializeScrollView() {
        //1
        scroller = UIScrollView()
        addSubview(scroller)
        
        //2
        scroller.setTranslatesAutoresizingMaskIntoConstraints(false)
        //3
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        
        //4
        let tapRecognizer = UITapGestureRecognizer(target: self, action:Selector("scrollerTapped:"))
        scroller.addGestureRecognizer(tapRecognizer)
    }

}
