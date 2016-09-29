//
//  ViewController.swift
//  InverseTableView
//
//  Created by Tomoya Hirano on 09/09/2016.
//  Copyright (c) 2016 Tomoya Hirano. All rights reserved.
//

import UIKit
import InverseTableView

final class ViewController: UIViewController {
  @IBOutlet weak var inverseTableView: InverseTableView!
  private var dataSourceInverser: UITableViewDataSourceInverser? = nil
  fileprivate var items = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataSourceInverser = UITableViewDataSourceInverser(dataSource: self)
    inverseTableView.delegate = self
    inverseTableView.dataSource = dataSourceInverser
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func insertAction(_ sender: AnyObject) {
    let index = IndexPath(row: 0, section: 0)
    items.insert("\(items.count)", at: 0)
    inverseTableView.insertRows(at: [index], with: UITableViewRowAnimation.right)
  }
  
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
    cell.textLabel?.text = items[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
}

