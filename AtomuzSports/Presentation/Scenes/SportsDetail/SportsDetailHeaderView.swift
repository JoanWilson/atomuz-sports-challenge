//
//  SportsDetailHeaderView.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 14/10/22.
//

import UIKit
import SwiftUI

final class SportsDetailHeaderView: UIView {

    lazy var sportsHeaderImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.darkOverlay(
            color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.61),
            alpha: 0.6
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Soccer"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()
    }

}

extension SportsDetailHeaderView: ViewCoding {
    func setupView() {
        self.backgroundColor = .systemGray
    }

    func setupHierarchy() {
        self.addSubview(sportsHeaderImage)

        self.addSubview(headerLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.sportsHeaderImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportsHeaderImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.sportsHeaderImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.sportsHeaderImage.heightAnchor.constraint(equalToConstant: 198),
            self.headerLabel.centerXAnchor.constraint(equalTo: sportsHeaderImage.centerXAnchor),
            self.headerLabel.centerYAnchor.constraint(equalTo: sportsHeaderImage.centerYAnchor)
        ])
    }

}
