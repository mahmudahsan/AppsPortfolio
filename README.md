# AppsPortfolio
To showcase multiple apps of a developer for cross promotion. Its an offline way to show user about other apps and it's also possible to know which app users are having more interest. I have been using this UI in all of my iOS apps for cross promoting my other apps. This is a complete project but any improvements are welcome.

In plist data, if there is only one category mention for example games, then the segmented tab at top will not be shown. To show segmented tab with categories you must have to provide at least 2 categories of apps. Please check the plist file structure to know how to provide app list.

<p align="center">
    <a href="https://cocoapods.org/pods/AppsPortfolio">
        <img src="https://img.shields.io/badge/pods-v1.1.1-orange.svg" alt="CocoaPods" />
    </a>
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <a href="https://twitter.com/mahmudahsan">
        <img src="https://img.shields.io/badge/contact%40-mahmudahsan-green.svg" alt="Twitter: @mahmudahsan" />
    </a>
</p>

<p align="center">
    <img src="preview.gif" width="375" max-width="50%" alt="Apps Portfolio" />
</p>	

## Features

- [X] Showcase apps for cross promotion
- [X] Delegate to integrate analytics to see which app user visits in app store
- [X] Works in both iPhone and iPad


## Examples

Integrate within a UIViewController:
```swift
let bundle = Bundle(for: AppsPortfolioViewController.self)
let storyboard = UIStoryboard(name: "AppsPortfolio", bundle: bundle)
        
let appsPortfolioVC = storyboard.instantiateInitialViewController() as! AppsPortfolioViewController
appsPortfolioVC.title     = "Portfolio"
appsPortfolioVC.loadAppList(name: "sample_portfolio")
self.navigationController?.pushViewController(appsPortfolioVC, animated: true)
```

Add a custom back button to top left if by default navigation bar is hidden:
```swift
let backButton = UIButton(frame: CGRect(x: 10, y: 7, width: 74, height: 30))
backButton.setImage(UIImage(named: "btnBack"), for: UIControlState.normal)
backButton.addTarget(self, action: #selector(goBackFromPortfolio), for: UIControlEvents.touchUpInside)
appsPortfolioVC.view.addSubview(backButton)
```

```swift
@objc private func goBackFromPortfolio(){
    self.navigationController?.popViewController(animated: true)
}
```

<p align="center">
    <img src="custom_back_button.jpg" width="300" alt="Apps Portfolio" />
</p>    


Implement delegate to inform when user tap an app:
```swift
let bundle = Bundle(for: AppsPortfolioViewController.self)
let storyboard = UIStoryboard(name: "AppsPortfolio", bundle: bundle)
        
let appsPortfolioVC = storyboard.instantiateInitialViewController() as! AppsPortfolioViewController
appsPortfolioVC.title     = "Portfolio"

//assigning analytics delegates
appsPortfolioVC.setAnalyticsDelegate(any: self) 

appsPortfolioVC.loadAppList(name: "sample_portfolio")
self.navigationController?.pushViewController(appsPortfolioVC, animated: true)
```

One delegate method need to implement to know user interaction:
```swift
extension ViewController : Analytics{
    func appClicked(appNamed: String) {
        print("App: \(appNamed) clicked.")
    }
}
```

sample_portfolio.plist file structure:
<p align="center">
    <img src="plist_file.png" width="1624" max-width="50%" alt="plist flie stucture" />
</p>

## Usage in an iOS application

Either

- Drag the folders AppsPortfolio/Sources folder into your application's Xcode project. 

or

- Use CocoaPods or the Swift Package manager to include AppsPortfolio as a dependency in your project.

```Ruby
pod 'AppsPortfolio', :git => 'https://github.com/mahmudahsan/AppsPortfolio.git'
```

* In your project create a new **apps_portfolio.plist** file and provide your apps list. Follow the sample_portfolio.plist file format provided in AppsPortfolio/Data.

* In your project add the icons of your cross promoting apps and mention them in your plist file. Better use Images.assets to add apps's icons.

<p align="center">
    <img src="Images.png" width="992" max-width="50%" alt="Images" />
</p>

## Questions or feedback?

Feel free to [open an issue](https://github.com/mahmudahsan/AppsPortfolio/issues/new), or find me [@mahmudahsan on Twitter](https://twitter.com/mahmudahsan).
