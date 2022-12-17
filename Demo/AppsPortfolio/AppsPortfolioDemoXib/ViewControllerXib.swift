//
//  ViewControllerXib.swift
//  AppsPortfolio
//
//  Created by mahmud on 25/10/17.
//  Copyright © 2017 iThinkdiff. All rights reserved.
//

import UIKit

class ViewControllerXib: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPortfolio(_ sender: Any) {
        let bundle = Bundle(for: AppsPortfolioViewController.self)
        let storyboard = UIStoryboard(name: "AppsPortfolio", bundle: bundle)
        
        let appsPortfolioVC = storyboard.instantiateInitialViewController() as! AppsPortfolioViewController
        appsPortfolioVC.title     = "Portfolio"
        appsPortfolioVC.setAnalyticsDelegate(any: self) //assigning analytics delegates
        appsPortfolioVC.loadAppList(name: "sample_portfolio")
        self.navigationController?.pushViewController(appsPortfolioVC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
