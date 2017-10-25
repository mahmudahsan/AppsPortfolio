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

/**
 *  Protocol to detect whether user tap an app in the portfolio
 */
public protocol Analytics {
    func appClicked(appNamed: String)
}

/**
 *  Struct describe an app's mandatory properties
 */
struct AppDetail{
    var name:String
    var image:String
    var url:String
}

class AppList{
    var portfolioList:NSArray?
    var portfolioCategory:[String]? = [String]()
    var portfolioListDetails:[NSArray]?
    
    /**
     *  Read raw .plist formatted data and assigned in portfolioList
     */
    func loadAppList(listName: String?){
        guard let listName = listName else {
            portfolioList = nil
            return
        }
        
        var appListArray: NSArray?
        if let path = Bundle.main.path(forResource: listName, ofType: "plist") {
            appListArray = NSArray(contentsOfFile: path)
        }
        
        guard let arr = appListArray else {
            portfolioList = nil
            return
        }
        
        portfolioList = arr
    }
    
    
    /**
     *  Process portfolioList array
     *  Read the category name and assigned in portfolioCategory as Array
     *  Read each category's app list and assign them in portfolioListDetails as Array of Dictionary
     */
    func processAppList(){
        guard let portfolioList = portfolioList else {
            return
        }
        
        portfolioListDetails = [NSArray]()
        
        for item in portfolioList {
            let listOfItems = NSMutableArray()
            let item = item as! NSArray
            
            for (perIndex, perItem) in item.enumerated(){
                if perIndex == 0{
                    portfolioCategory?.append(perItem as! String)
                }
                if perIndex >= 1 {
                    let itemDic = perItem as! NSDictionary
                    listOfItems.add(itemDic)
                }
            }
            portfolioListDetails?.append(listOfItems)
        }
    }
}
