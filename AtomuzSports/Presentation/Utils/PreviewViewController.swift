//
//  PreviewViewController.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 14/10/22.
//

import Foundation
import SwiftUI

struct PreviewViewController: UIViewRepresentable {
    private var uiView: UIView

    init(uiView: UIView) {
        self.uiView = uiView
    }

    func makeUIView(context: Context) -> some UIView {
        return uiView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }


}
