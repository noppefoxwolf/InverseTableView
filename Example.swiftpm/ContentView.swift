import UIKit
import SwiftUI
import InverseTableView

struct ContentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        UINavigationController(rootViewController: ViewController())
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

class ViewController: UIViewController {
    let inverseTableView: InverseTableView = .init(frame: .null, style: .plain)
    var dataSourceInverser: UITableViewDataSourceInverser? = nil
    var items = [String]()
    
    override func loadView() {
        view = inverseTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSourceInverser = UITableViewDataSourceInverser(dataSource: self)
        inverseTableView.delegate = self
        inverseTableView.dataSource = dataSourceInverser
        inverseTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        navigationItem.rightBarButtonItem = .init(
            systemItem: .add,
            primaryAction: UIAction(handler: { [self] _ in
                let index = IndexPath(row: 0, section: 0)
                items.insert("\(items.count)", at: 0)
                inverseTableView.insertRows(at: [index], with: .right)
            })
        )
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
}

