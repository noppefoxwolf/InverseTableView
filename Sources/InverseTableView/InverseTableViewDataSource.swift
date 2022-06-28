import UIKit

open class UITableViewDataSourceInverser: NSObject {
    private weak var dataSource: UITableViewDataSource!
    
    public init(dataSource: UITableViewDataSource) {
        self.dataSource = dataSource
    }
}

extension UITableViewDataSourceInverser: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataSource.tableView(tableView, cellForRowAt: indexPath)
        UIView.setAnimationsEnabled(false)
        cell.transform = CGAffineTransform(rotationAngle: -.pi)
        UIView.setAnimationsEnabled(true)
        return cell
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.tableView(tableView, numberOfRowsInSection: section)
    }
    
    @available(iOS 2.0, *)
    public func numberOfSections(in tableView: UITableView) -> Int {
        // Default is 1 if not implemented
        dataSource.numberOfSections?(in: tableView) ?? 1
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dataSource.tableView?(tableView, titleForHeaderInSection: section)
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        dataSource.tableView?(tableView, titleForFooterInSection: section)
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        dataSource.tableView?(tableView, canEditRowAt: indexPath) ?? false
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        dataSource.tableView?(tableView, canMoveRowAt: indexPath) ?? false
    }
    
    @available(iOS 2.0, *)
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        dataSource.sectionIndexTitles?(for: tableView)
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView,
                          sectionForSectionIndexTitle title: String,
                          at index: Int) -> Int {
        dataSource.tableView?(tableView, sectionForSectionIndexTitle: title, at: index) ?? 0
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dataSource.tableView?(tableView, commit: editingStyle, forRowAt: indexPath)
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataSource.tableView?(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
    }
}


