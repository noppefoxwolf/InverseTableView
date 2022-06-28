# InverseTableView

## Example

Open `Example.swiftpm` on your Xcode or iPad Playground.

## Requirements

- iOS13+
- Swift5.6+

## Installation

Add package your Package.swift

```swift
.package(url: "https://github.com/noppefoxwolf/InverseTableView", from: "0.9.0")
```

##Usage

```swift
let inverseTableView: InverseTableView = { ... }()
var dataSourceInverser: UITableViewDataSourceInverser? = nil

override func viewDidLoad() {
    super.viewDidLoad()
    dataSourceInverser = UITableViewDataSourceInverser(dataSource: self)
    inverseTableView.delegate = self
    inverseTableView.dataSource = dataSourceInverser
}
```


## Author

noppefoxwolf, noppelabs@gmail.com

## License

InverseTableView is available under the MIT license. See the LICENSE file for more info.
