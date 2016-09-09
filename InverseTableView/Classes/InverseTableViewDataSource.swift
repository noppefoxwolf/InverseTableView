//
//  InverseTableViewDataSource.swift
//  Pods
//
//  Created by Tomoya Hirano on 2016/09/09.
//
//

import UIKit

public class UITableViewDataSourceInverser: NSObject, UITableViewDataSource {
  private var dataSource: UITableViewDataSource
  
  public init (dataSource: UITableViewDataSource) {
    self.dataSource = dataSource
  }
  
  @available(iOS 2.0, *)
  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = dataSource.tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell.transform = CGAffineTransformMakeRotation(-CGFloat(M_PI))
    return cell
  }
}

extension UITableViewDataSourceInverser {
  @available(iOS 2.0, *)
  public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return dataSource.numberOfSectionsInTableView?(tableView) ?? 0
  }
  
  @available(iOS 2.0, *)
  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.tableView(tableView, numberOfRowsInSection: section)
  }
  
  @available(iOS 2.0, *)
  public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return dataSource.tableView?(tableView, titleForHeaderInSection: section)
  }
  
  @available(iOS 2.0, *)
  public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return dataSource.tableView?(tableView, titleForFooterInSection: section)
  }
  
  // Editing
  
  // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
  @available(iOS 2.0, *)
  public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return dataSource.tableView?(tableView, canEditRowAtIndexPath: indexPath) ?? false
  }
  
  // Moving/reordering
  
  // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
  @available(iOS 2.0, *)
  public func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return dataSource.tableView?(tableView, canMoveRowAtIndexPath: indexPath) ?? false
  }
  
  // Index
  
  @available(iOS 2.0, *)
  public func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? { // return list of section titles to display in section index view (e.g. "ABCD...Z#")
    return dataSource.sectionIndexTitlesForTableView?(tableView)
  }
  @available(iOS 2.0, *)
  public func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int { // tell table which section corresponds to section title/index (e.g. "B",1))
    return dataSource.tableView?(tableView, sectionForSectionIndexTitle: title, atIndex: index) ?? 0
  }
  
  // Data manipulation - insert and delete support
  
  // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
  // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
  @available(iOS 2.0, *)
  public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    dataSource.tableView?(tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath)
  }
  
  // Data manipulation - reorder / moving support
  
  @available(iOS 2.0, *)
  public func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    dataSource.tableView?(tableView, moveRowAtIndexPath: sourceIndexPath, toIndexPath: destinationIndexPath)
  }
}