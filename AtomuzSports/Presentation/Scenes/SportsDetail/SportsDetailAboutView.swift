//
//  SportsDetailAboutView.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 15/10/22.
//

import UIKit
import SwiftUI

final class SportsDetailAboutView: UIView {

    private let sportAboutLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        label.text = "About the sport"
        label.textColor = UIColor(red: 0.039, green: 0.561, blue: 0.333, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
        button.setImage(image, for: .normal)
        button.tintColor = .systemRed
        button.addTarget(self, action: #selector(favoriteSport), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    lazy var sportGreenIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "soccer")
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var sportFormatLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 14)
        label.text = "TeamVsTeam"
        label.textColor = UIColor(red: 0.371, green: 0.371, blue: 0.371, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    lazy var sportDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Field hockey is a team game of the hockey family. The earliest origins."
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.604, green: 0.604, blue: 0.604, alpha: 1)
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()

    }

    @objc func favoriteSport() {
        if self.favoriteButton.imageView?.image == UIImage(
            systemName: "heart",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)
        ) {
            self.favoriteButton.setImage(
                UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)),
                for: .normal
            )
        } else {
            self.favoriteButton.setImage(
                UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)),
                for: .normal
            )
        }
    }

}

extension SportsDetailAboutView: ViewCoding {

    func setupView() {
        self.backgroundColor = .clear
    }

    func setupHierarchy() {
        self.addSubview(sportAboutLabel)
        self.addSubview(sportGreenIcon)
        self.addSubview(sportFormatLabel)
        self.addSubview(sportDescriptionLabel)
        self.addSubview(favoriteButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.sportAboutLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportAboutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.sportAboutLabel.widthAnchor.constraint(equalToConstant: 153),
            self.sportAboutLabel.heightAnchor.constraint(equalToConstant: 27),

            self.sportGreenIcon.centerYAnchor.constraint(equalTo: sportAboutLabel.centerYAnchor),
            self.sportGreenIcon.leadingAnchor.constraint(equalTo: sportAboutLabel.trailingAnchor, constant: 6),
            self.sportGreenIcon.heightAnchor.constraint(equalToConstant: 17),
            self.sportGreenIcon.widthAnchor.constraint(equalToConstant: 17),

            self.sportFormatLabel.topAnchor.constraint(equalTo: sportAboutLabel.bottomAnchor),
            self.sportFormatLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.sportFormatLabel.heightAnchor.constraint(equalToConstant: 19),

            self.sportDescriptionLabel.topAnchor.constraint(equalTo: sportFormatLabel.bottomAnchor, constant: 19),
            self.sportDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.sportDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.sportDescriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            self.favoriteButton.topAnchor.constraint(equalTo: self.topAnchor),
            self.favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),


        ])
    }

}
