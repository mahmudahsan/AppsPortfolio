# AppsPortfolio
To showcase multiple apps of a developer for cross promotion. Its an offline way to show user about other apps and it's also possible to know which app users are having more interest. I have been using this UI in all of my iOS apps for cross promoting my other apps. This is a complete project but any improvements are welcome.

<p align="center">
    <img src="preview.gif" width="375" max-width="50%" alt="Apps Portfolio" />
</p>	

<p align="center">
    <a href="https://cocoapods.org/pods/AppsPortfolio">
        <img src="https://img.shields.io/badge/pods-v1.0.3-orange.svg" alt="CocoaPods" />
    </a>
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <a href="https://twitter.com/mahmudahsan">
        <img src="https://img.shields.io/badge/contact%40-mahmudahsan-green.svg" alt="Twitter: @mahmudahsan" />
    </a>
</p>

## Features

- [X] Showcase apps for cross promotion
- [X] Delegate to integrate analytics to see which app user visits in app store
- [X] Works in both iPhone and iPad


## Examples

Integrate within a UIViewController:
```swift
let bundle = Bundle(for: AppsPortfolioViewController.self)
let appsPortfolioVC = AppsPortfolioViewController(nibName: "AppsPortfolioViewController", bundle: bundle)
appsPortfolioVC.title     = "Portfolio"  //you can give whatever name you like
appsPortfolioVC.loadAppList(name: "sample_portfolio") //provide your custom portfolio plist file name here
self.navigationController?.pushViewController(appsPortfolioVC, animated: true)
```

Implement delegate to inform when user tap an app:
```swift
let bundle = Bundle(for: AppsPortfolioViewController.self)
let appsPortfolioVC = AppsPortfolioViewController(nibName: "AppsPortfolioViewController", bundle: bundle)
appsPortfolioVC.title     = "Portfolio"
appsPortfolioVC.analytics = self
appsPortfolioVC.loadAppList(name: "sample_portfolio")
self.navigationController?.pushViewController(appsPortfolioVC, animated: true)
```

One delegate method to get notification:
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

- Drag the folders AppsPortfolio/AppsPortfolio into your application's Xcode project. AppsPortfolio has 2 sub folders Data and Sources.

or

- Use CocoaPods or the Swift Package manager to include AppsPortfolio as a dependency in your project.


* In your project create a new **apps_portfolio.plist** file and provide your apps list. Follow thesample_portfolio.plist file format provided in here.

* In your project add the images of your cross promoting apps and mention them in your plist file.

## Questions or feedback?

Feel free to [open an issue](https://github.com/mahmudahsan/AppsPortfolio/issues/new), or find me [@mahmudahsan on Twitter](https://twitter.com/mahmudahsan).
