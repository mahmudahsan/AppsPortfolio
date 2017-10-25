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

import UIKit

public class AppsPortfolioViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var segmentControl:UISegmentedControl!
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    
    var animDuration:Double = 0.3
    var animDelay:Double    = 0.1
    var appList:AppList     = AppList()
    var segmentIndex        = 0 //default tab
    
    var analytics:Analytics? // defined in AppList
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // In UI design it has 2 segment so removed those at initialization
        segmentControl.removeAllSegments()
        segmentControl.isHidden = true
        segmentIndex = 0
        
        if let category = appList.portfolioCategory{
            // We don't show portfolio category at the top, if there is only one category in .plist
            if category.count > 1 {
                for (index, title) in category.enumerated(){
                    segmentControl.insertSegment(withTitle: title, at: index, animated: false)
                }
                segmentControl.isHidden = false
                segmentControl.selectedSegmentIndex = 0
            }
            else {
                //if provideo one category then adjust the constrain to place within segmented area
                tableViewTopConstraint.constant = -28.0
            }
        }
    }
    
    // MARK:-- Load the portfolio from plist file
    /**
     *  Protocol to detect whether user tap an app in the portfolio
     */
    public func loadAppList(name:String){
        appList.loadAppList(listName: name)
        appList.processAppList()
    }
    
    public func setAnalyticsDelegate(any: Any){
        analytics = any as? Analytics
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rootArrList = appList.portfolioListDetails as NSArray?
        if rootArrList != nil{
            let categoryWiseItemList = rootArrList?.object(at: segmentIndex) as! NSArray
            return categoryWiseItemList.count
        }
        
        return 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:AppsPortfolioTableViewCell?  = tableView.dequeueReusableCell(withIdentifier: "cell") as? AppsPortfolioTableViewCell
        
        if (cell == nil){
            let bundle = Bundle(for: AppsPortfolioViewController.self)
            cell = bundle.loadNibNamed("AppsPortfolioTableViewCell", owner: self, options: nil)?[0] as? AppsPortfolioTableViewCell
        }
        
        let rootArrList = appList.portfolioListDetails as NSArray?
        if rootArrList != nil{
            let categoryWiseItemList = rootArrList?.object(at: segmentIndex) as! NSArray
            let appDetail = categoryWiseItemList.object(at: indexPath.row) as! NSDictionary
            
            cell?.title!.text            = appDetail.value(forKey: "name") as? String
            cell?.imgIcon.image          = UIImage(named: appDetail.value(forKey: "image") as! String)
        }
        
        /**
         *  Animation to show the table items in style
         */
//        if (!cell!.isAnimationDone){
//            cell!.alpha = 0.0
//
//            ModelEffect.sharedInstance.bouneEffectAnimation(duration: animDuration, delay: animDelay, view: cell!, vOrH: false, animVal: 30.0, pOn: false)
//            cell!.isAnimationDone = true
//            animDuration += 0.1
//            animDelay    += 0.01
//        }
 
        return cell!
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: self.tableView.indexPathForSelectedRow!, animated: true)
        
        var appUrl:String   = ""
        var appTitle:String = ""
        
        let rootArrList = appList.portfolioListDetails as NSArray?
        if rootArrList != nil{
            let categoryWiseItemList = rootArrList?.object(at: segmentControl.selectedSegmentIndex) as! NSArray
            
            let appDetail = categoryWiseItemList.object(at: indexPath.row) as! NSDictionary
            appUrl = (appDetail.value(forKey: "url") as? String)!
            appTitle = (appDetail.value(forKey: "name") as? String)!
        }
        
        //analytics call delegate
        analytics?.appClicked(appNamed: appTitle)
        UIApplication.shared.openURL(NSURL(string : appUrl)! as URL)
    }

    /**
     *  When segmented tab changed, the table view reload
     */
    @IBAction func reloadList(sender: AnyObject) {
        segmentIndex = segmentControl.selectedSegmentIndex
        tableView.reloadData()
    }
}
