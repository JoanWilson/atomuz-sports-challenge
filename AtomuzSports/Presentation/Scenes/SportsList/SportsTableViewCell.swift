//
//  SportsTableViewCell.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

extension UIColor {
    var lightDarkDescription: String {
        let lightTraits = UITraitCollection.init(userInterfaceStyle: .light)
        let darkTraits = UITraitCollection.init(userInterfaceStyle: .dark)
        let lightColor = self.resolvedColor(with: lightTraits)
        let darkColor = self.resolvedColor(with: darkTraits)
        if lightColor == darkColor {
            return self.description
        } else {
            return "\(self), light: \(lightColor), dark: \(darkColor)"
        }
    }
}

final class SportsTableViewCell: UITableViewCell {

    static let indentifier: String = "SportsTableViewCell"
    public var shadowColor: CGColor = UIColor.label.cgColor

    private var sport: Sport? {
        didSet {
            sportsLabel.text = sport?.strSport
            guard let url = URL(string: sport!.strSportIconGreen) else {
                return
            }
            sportsIconImageView.load(url: url)
        }
    }

    fileprivate lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.backgroundColor = .systemBackground
        stackView.layoutMargins = UIEdgeInsets(top: 13, left: 20, bottom: 13, right: 20)
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.distribution = .equalSpacing
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.shadowOpacity = 0.3
        stackView.layer.shadowOffset = .zero
        stackView.layer.shadowRadius = 2
        stackView.layer.masksToBounds = false
        stackView.backgroundColor = UIColor(named: "shadowColor")
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    public lazy var sportsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        label.textColor = .systemGray

        return label
    }()

    public lazy var sportsIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.sport = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.sportsIconImageView.image = UIImage()
    }

    public func setSport(with sport: Sport) {
        self.sport = sport
    }

}

extension SportsTableViewCell: ViewCoding {

    func setupView() {
        self.backgroundColor = .clear
    }

    func setupHierarchy() {
        self.containerStackView.addArrangedSubview(sportsLabel)
        self.containerStackView.addArrangedSubview(sportsIconImageView)
        contentView.addSubview(containerStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            self.containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])

    }

}
