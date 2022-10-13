//
//  SportsTableViewCell.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

final class SportsTableViewCell: UITableViewCell {

    static let indentifier: String = "SportsTableViewCell"

    private var sport: Sport = Sport(idSport: "", strSport: "", strFormat: StrFormat.teamvsTeam, strSportThumb: "", strSportIconGreen: "", strSportDescription: "")

    fileprivate lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.backgroundColor = .systemBackground
        stackView.layoutMargins = UIEdgeInsets(top: 13, left: 20, bottom: 13, right: 20)
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.distribution = .equalSpacing
        stackView.layer.shadowColor = UIColor.label.cgColor
        stackView.layer.shadowOpacity = 0.3
        stackView.layer.shadowOffset = .zero
        stackView.layer.shadowRadius = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    public lazy var sportsLabel: UILabel = {
        let label = UILabel()
        label.text = sport.strSport
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        label.textColor = .systemGray

        return label
    }()

    public lazy var sportsIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.load(url: URL(string: sport.strSportIconGreen)!)
        imageView.contentMode = .scaleAspectFit

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

    public func setSport(with sport: Sport) {
        self.sport = sport
    }

}

extension SportsTableViewCell: ViewCoding {

    func setupView() {

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
