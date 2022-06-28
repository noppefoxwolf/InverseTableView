import UIKit

open class InverseTableView: UITableView {
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
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

