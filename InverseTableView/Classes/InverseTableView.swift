//
//  InverseTableView.swift
//  Pods
//
//  Created by Tomoya Hirano on 2016/09/09.
//
//

import UIKit

open class InverseTableView: UITableView {
  open override func awakeFromNib() {
    super.awakeFromNib()
    transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
    tableFooterView = UIView()
  }
  
  open override func insertRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
    super.insertRows(at: indexPaths, with: animation.inverse())
  }
}

private extension UITableViewRowAnimation {
  func inverse() -> UITableViewRowAnimation {
    switch self {
    case .bottom:    return .top
    case .left:      return .right
    case .right:     return .left
    case .top:       return .bottom
    default: return self
    }
  }
}

