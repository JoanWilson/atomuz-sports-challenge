//
//  SportsDetailViewController.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

final class SportsDetailViewController: UIViewController {

    private var viewModel: SportsDetailViewModel
    public var sport: Sport = Sport(idSport: "", strSport: "", strFormat: StrFormat.teamvsTeam, strSportThumb: "", strSportIconGreen: "", strSportDescription: "")

    lazy var label: UILabel = {
        let label = UILabel()
        label.text = sport.strSport
        label.textColor = .black
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    init(viewModel: SportsDetailViewModel, sport: Sport) {
        self.viewModel = viewModel
        self.sport = sport
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildLayout()
        navigationItem.backButtonTitle = ""
    }

    private func addBinders() {
        self.viewModel.helloWorld()
    }

    @objc func backView() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension SportsDetailViewController: ViewCoding {
    func setupView() {
        self.addBinders()
        self.view.backgroundColor = .green
    }

    func setupHierarchy() {
        self.view.addSubview(label)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
