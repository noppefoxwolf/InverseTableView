//
//  InverseTableViewDataSource.swift
//  Pods
//
//  Created by Tomoya Hirano on 2016/09/09.
//
//

import UIKit

open class UITableViewDataSourceInverser: NSObject {
  weak fileprivate var dataSource: UITableViewDataSource!
  
  public init (dataSource: UITableViewDataSource) {
    self.dataSource = dataSource
  }
}

extension UITableViewDataSourceInverser: UITableViewDataSource {
  @available(iOS 2.0, *)
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = dataSource.tableView(tableView, cellForRowAt: indexPath)
    cell.transform = CGAffineTransform(rotationAngle: -CGFloat(M_PI))
    return cell
  }
  
  @available(iOS 2.0, *)
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.tableView(tableView, numberOfRowsInSection: section)
  }
  
  @available(iOS 2.0, *)
  public func numberOfSections(in tableView: UITableView) -> Int{
   return dataSource.numberOfSections?(in: tableView) ?? 1 // Default is 1 if not implemented
  }
  
  @available(iOS 2.0, *)
  public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return dataSource.tableView?(tableView, titleForHeaderInSection: section)
  }
  
  @available(iOS 2.0, *)
  public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return dataSource.tableView?(tableView, titleForFooterInSection: section)
  }
  
  @available(iOS 2.0, *)
  public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return dataSource.tableView?(tableView, canEditRowAt: indexPath) ?? false
  }
  
  @available(iOS 2.0, *)
  public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return dataSource.tableView?(tableView, canMoveRowAt: indexPath) ?? false
  }

  @available(iOS 2.0, *)
  public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return dataSource.sectionIndexTitles?(for: tableView)
  }
  
  @available(iOS 2.0, *)
  public func tableView(_ tableView: UITableView,
                        sectionForSectionIndexTitle title: String,
                        at index: Int) -> Int {
    return dataSource.tableView?(tableView, sectionForSectionIndexTitle: title, at: index) ?? 0
  }
  
  @available(iOS 2.0, *)
  public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    dataSource.tableView?(tableView, commit: editingStyle, forRowAt: indexPath)
  }
  
  @available(iOS 2.0, *)
  public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    dataSource.tableView?(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
  }
}


