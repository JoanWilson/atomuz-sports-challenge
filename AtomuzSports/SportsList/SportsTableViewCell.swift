//
//  SportsTableViewCell.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

final class SportsTableViewCell: UITableViewCell {

    fileprivate lazy var rectangleContainer: UIView = {

    }()

    override func awakeFromNib() {
        super.awakeFromNib()
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

    }

    func setupConstraints() {

    }

}
