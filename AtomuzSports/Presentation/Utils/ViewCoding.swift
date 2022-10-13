//
//  ViewCoding.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation

public protocol ViewCoding {
    func setupView()
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCoding {
    func buildLayout() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
}
