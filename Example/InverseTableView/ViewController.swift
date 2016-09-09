//
//  ViewController.swift
//  InverseTableView
//
//  Created by Tomoya Hirano on 09/09/2016.
//  Copyright (c) 2016 Tomoya Hirano. All rights reserved.
//

import UIKit
import InverseTableView

class ViewController: UIViewController {
  @IBOutlet weak var inverseTableView: InverseTableView!
  private var dataSourceInverser: UITableViewDataSourceInverser? = nil
  private var strings = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataSourceInverser = UITableViewDataSourceInverser(dataSource: self)
    inverseTableView.delegate = self
    inverseTableView.dataSource = dataSourceInverser
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func insertAction(sender: AnyObject) {
    let index = NSIndexPath(forRow: 0, inSection: 0)
    strings.insert("\(strings.count)", atIndex: 0)
    inverseTableView.insertRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimation.Right)
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return strings.count
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
    cell.textLabel?.text = strings[indexPath.row]
    return cell
  }
}

