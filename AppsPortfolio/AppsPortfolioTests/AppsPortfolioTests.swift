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

import XCTest
@testable import AppsPortfolio

class AppPortfolioTests: XCTestCase {
    // MARK: - Test Sample Files
    let sampleFileName        = "sample_portfolio"
    let sampleFileOneCategory = "sample_portfolio_one_category"
    
    // MARK: - Tests
    
    func testAppListDataFromNoPlist(){
        let appList = AppList()
        appList.loadAppList(listName: nil)
        XCTAssertNil(appList.portfolioList)
    }
    
    func testAppListDataFromWrongPlist(){
        let appList = AppList()
        appList.loadAppList(listName: "wrong_file_name")
        XCTAssertNil(appList.portfolioList)
    }
    
    func testAppListDataFromSamplePortfolio(){
        let appList = AppList()
        appList.loadAppList(listName: sampleFileName)
        XCTAssertTrue(appList.portfolioList!.count == 3)
    }
    
    func testAppListProcessAppListPortfolioCategory(){
        let appList = AppList()
        appList.loadAppList(listName: sampleFileName)
        appList.processAppList()
        XCTAssertTrue(appList.portfolioCategory!.count == 3)
    }
    
    func testAppListProcessAppListPortfolioListDetails(){
        let appList = AppList()
        appList.loadAppList(listName: sampleFileName)
        appList.processAppList()
        XCTAssertTrue(appList.portfolioListDetails!.count == 3)
    }
    
    func testAppListProcessAppListPortfolioListDetailsFirstItem(){
        let appList = AppList()
        appList.loadAppList(listName: sampleFileName)
        appList.processAppList()
        let itemArray = appList.portfolioListDetails! as NSArray
        let itemFirst = itemArray.object(at: 0) as! NSArray
        XCTAssertTrue(itemFirst.count == 3)
    }
    
    func testAppListProcessAppListPortfolioListDetailsFirstItemDetailsCheck(){
        let appList = AppList()
        appList.loadAppList(listName: sampleFileName)
        appList.processAppList()
        let itemArray = appList.portfolioListDetails! as NSArray
        let itemFirst = itemArray.object(at: 0) as! NSArray
        let itemFirstFirstElement = itemFirst.object(at: 0) as! NSDictionary
        
        let name      = itemFirstFirstElement.value(forKey: "name") as! String
        let image     = itemFirstFirstElement.value(forKey: "image") as! String
        let url       = itemFirstFirstElement.value(forKey: "url") as! String
        
        XCTAssertEqual(name, "Math Mastery Multiplayer")
        XCTAssertEqual(image, "math_search")
        XCTAssertEqual(url, "itms-apps://itunes.apple.com/app/id1024469928")
    }
    
    func testAppListDataFromSamplePortfolioOneCategory(){
        let appList = AppList()
        appList.loadAppList(listName: sampleFileOneCategory)
        XCTAssertTrue(appList.portfolioList!.count == 1)
    }
}
