//
//    Copyright (c) 2016 Max Sokolov https://twitter.com/max_sokolov
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

class CribbleWindow: UIWindow {

    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return false
    }
}

public struct CribbleOptions {

    let horizontalStep: CGFloat
    let verticalStep: CGFloat
    let color: UIColor
    
    static func defaultOptions() -> CribbleOptions {
        return CribbleOptions(horizontalStep: 8, verticalStep: 8, color: UIColor.redColor().colorWithAlphaComponent(0.5))
    }
}

public class Cribble {
    
    public static let shared = Cribble()

    private var window: CribbleWindow?
    public var hidden: Bool = true {
        didSet {
            if !hidden {
                display()
            } else {
                hide()
            }
        }
    }

    public init(options: CribbleOptions = CribbleOptions.defaultOptions()) {
        
    }
    
    public func display() {
        
        if window != nil {
            return
        }
        
        window = CribbleWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = UIStoryboard(name: "Cribble", bundle: NSBundle(forClass: self.dynamicType)).instantiateViewControllerWithIdentifier("CribbleController")
        window?.makeKeyAndVisible()
    }
    
    public func hide() {
        
        if window == nil {
            return
        }

        window?.removeFromSuperview()
        window = nil
    }
}