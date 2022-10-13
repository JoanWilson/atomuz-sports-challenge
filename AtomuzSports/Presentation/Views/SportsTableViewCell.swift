//
//  SportsTableViewCell.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

final class SportsTableViewCell: UITableViewCell {

    static let indentifier: String = "SportsTableViewCell"

    fileprivate lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.backgroundColor = .systemBackground
        stackView.layoutMargins = UIEdgeInsets(top: 13, left: 20, bottom: 13, right: 20)
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.shadowColor = UIColor.label.cgColor
        stackView.layer.shadowOpacity = 0.3
        stackView.layer.shadowOffset = .zero
        stackView.layer.shadowRadius = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    public lazy var sportsLabel: UILabel = {
        let label = UILabel()
        label.text = "Soccer"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        label.textColor = .systemGray

        return label
    }()

    public lazy var sportsIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 31, height: 31)

        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

extension SportsTableViewCell: ViewCoding {

    func setupView() {

    }

    func setupHierarchy() {
        self.containerStackView.addArrangedSubview(sportsLabel)
        self.containerStackView.addArrangedSubview(sportsIconImageView)
        self.addSubview(containerStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])

    }

}
