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
    transform = CGAffineTransform(rotationAngle: .pi)
    tableFooterView = UIView()
  }
  
  open override func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
    super.insertRows(at: indexPaths, with: animation.inverse())
  }
}

private extension UITableView.RowAnimation {
  func inverse() -> UITableView.RowAnimation {
    switch self {
    case .bottom:    return .top
    case .left:      return .right
    case .right:     return .left
    case .top:       return .bottom
    default: return self
    }
  }
}

