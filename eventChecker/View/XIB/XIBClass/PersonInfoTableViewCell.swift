import UIKit

final class PersonInfoTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var surnameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    // MARK: - Lyfecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.backgroundColor = AppColor.cellColor
        containerView.layer.cornerRadius = 16
        backgroundColor = .clear
        selectionStyle = .none
    }

    // MARK: - API
    func configure(using user: User) {
        nameLabel.text = user.name
        surnameLabel.text = user.surname
        dateLabel.text = "\(user.dateDescription)"
    }
}
