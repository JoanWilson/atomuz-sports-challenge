//
//  SportsDetailViewController.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

final class SportsDetailViewController: UIViewController {

    private var viewModel: SportsDetailViewModel

    public var sport: Sport = Sport(
        idSport: "",
        strSport: "",
        strFormat: StrFormat.teamvsTeam,
        strSportThumb: "",
        strSportIconGreen: "",
        strSportDescription: ""
    )

    lazy var backButton: UIButton = {
        let button = UIButton()
        let imageConfiguration = UIImage.SymbolConfiguration(
            pointSize: view.bounds.height*0.03,
            weight: .bold,
            scale: .medium
        )
        button.setImage(UIImage(named: "chevron", in: nil, with: imageConfiguration), for: .normal)
        button.addTarget(self, action: #selector(popDetailViewController), for: .touchUpInside)

        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    fileprivate lazy var headerView: SportsDetailHeaderView = {
        let headerView = SportsDetailHeaderView()
        headerView.sportsHeaderImage.load(url: URL(string: sport.strSportThumb)!)
        headerView.headerLabel.text = sport.strSport
        headerView.translatesAutoresizingMaskIntoConstraints = false

        return headerView
    }()

    fileprivate let detailScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    fileprivate let detailContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 26
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    lazy var descriptionView: SportsDetailAboutView = {
        let view = SportsDetailAboutView()
        view.sportDescriptionLabel.text = sport.strSportDescription
        view.sportFormatLabel.text = sport.strFormat.rawValue
        view.sportGreenIcon.load(url: URL(string: sport.strSportIconGreen)!)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    init(viewModel: SportsDetailViewModel, sport: Sport) {
        self.viewModel = viewModel
        self.sport = sport
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildLayout()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    private func addBinders() {
        self.viewModel.helloWorld()
    }

    @objc func popDetailViewController() {
        print("cliquei")
        self.navigationController?.popViewController(animated: true)
    }

}

extension SportsDetailViewController: ViewCoding {
    func setupView() {
        self.addBinders()
        self.view.backgroundColor = .systemBackground

    }

    func setupHierarchy() {
        self.view.addSubview(detailScrollView)
        self.detailContainer.addArrangedSubview(headerView)
        self.detailContainer.addArrangedSubview(descriptionView)
        self.detailScrollView.addSubview(detailContainer)
        self.detailScrollView.addSubview(backButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.detailScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.detailScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.detailScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.detailScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            self.detailContainer.topAnchor.constraint(equalTo: detailScrollView.topAnchor),
            self.detailContainer.leadingAnchor.constraint(equalTo: detailScrollView.leadingAnchor),
            self.detailContainer.trailingAnchor.constraint(equalTo: detailScrollView.trailingAnchor),
            self.detailContainer.bottomAnchor.constraint(equalTo: detailScrollView.bottomAnchor),
            self.detailContainer.widthAnchor.constraint(equalTo: detailScrollView.widthAnchor),

            self.descriptionView.leadingAnchor.constraint(equalTo: detailContainer.leadingAnchor, constant: 31),
            self.descriptionView.trailingAnchor.constraint(equalTo: detailContainer.trailingAnchor, constant: -26),

            self.headerView.topAnchor.constraint(equalTo: detailScrollView.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: detailScrollView.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: detailScrollView.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 198),

            self.backButton.topAnchor.constraint(equalTo: detailScrollView.topAnchor, constant: 32),
            self.backButton.leadingAnchor.constraint(equalTo: detailScrollView.leadingAnchor),
            self.backButton.heightAnchor.constraint(equalToConstant: 50),
            self.backButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

}
