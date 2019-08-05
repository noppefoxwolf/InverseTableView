# InverseTableView

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![](https://raw.githubusercontent.com/noppefoxwolf/InverseTableView/master/sample.gif)

## Requirements

## Installation

InverseTableView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "InverseTableView"
```

##Usage

```
@IBOutlet weak var inverseTableView: InverseTableView!
private var dataSourceInverser: UITableViewDataSourceInverser? = nil

override func viewDidLoad() {
    super.viewDidLoad()
    dataSourceInverser = UITableViewDataSourceInverser(dataSource: self)
    inverseTableView.delegate = self
    inverseTableView.dataSource = dataSourceInverser
}
```
  

## Author

Tomoya Hirano, cromteria@gmail.com

## License

InverseTableView is available under the MIT license. See the LICENSE file for more info.
