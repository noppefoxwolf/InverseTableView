//
//  InverseTableView.swift
//  Pods
//
//  Created by Tomoya Hirano on 2016/09/09.
//
//

import UIKit

public class InverseTableView: UITableView {
  public override func awakeFromNib() {
    super.awakeFromNib()
    transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
    tableFooterView = UIView()
  }
  
  public override func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
    super.insertRowsAtIndexPaths(indexPaths, withRowAnimation: animation.inverse())
  }
}

private extension UITableViewRowAnimation {
  func inverse() -> UITableViewRowAnimation {
    switch self {
    case .Bottom:    return .Top
    case .Left:      return .Right
    case .Right:     return .Left
    case .Top:       return .Bottom
    default: return self
    }
  }
}

