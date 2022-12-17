/**
 *  Apps Portfolio
 *
 *  Copyright (c) 2017 Mahmud Ahsan. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

import Foundation
import SpriteKit

class ModelEffect : NSObject{
    @objc static let sharedInstance = ModelEffect()
    
    @objc var isWordListAnimDone = false

    /**
     *  Animation to show the table items in style
     */
    @objc func bouneEffectAnimation(duration:Double, delay:Double, view:UIView, vOrH:Bool, animVal:CGFloat, pOn:Bool){
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .allowUserInteraction, animations: {
            
            if (vOrH){
                if (pOn){
                    view.center.y += animVal
                }
                else {
                    view.center.y -= animVal
                }
            }
            else {
                if (pOn){
                    view.center.x += animVal
                }
                else {
                    view.center.x -= animVal
                }
            }
            
            view.alpha     = 1.0
        }, completion: nil)
    }
}
