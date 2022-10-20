//
//  SportDetailView.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 17/10/22.
//

import UIKit

final class SportsDetailView: UIView {

    public var viewModel: SportsDetailViewModel

    lazy var favoriteButton: UIButton = {
        let button = UIButton()

        var image = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
        button.setImage(image, for: .normal)
        button.tintColor = .systemRed
        button.addTarget(self, action: #selector(favoriteSport), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    lazy var backButton: UIButton = {
        let button = UIButton()
        let imageConfiguration = UIImage.SymbolConfiguration(
            pointSize: self.bounds.height*0.03,
            weight: .bold,
            scale: .medium
        )
        button.setImage(UIImage(named: "chevron", in: nil, with: imageConfiguration), for: .normal)
        button.addTarget(self.viewModel, action: #selector(viewModel.backToSportsListView), for: .touchUpInside)

        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    lazy var headerView: UIView = SportsDetailComponentsFactory.headerView.build(viewModel: self.viewModel)

    lazy var descriptionView: UIView = SportsDetailComponentsFactory.aboutView.build(viewModel: self.viewModel)

    let detailScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    let detailContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 26
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    init(frame: CGRect, viewModel: SportsDetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()
        let favoriteSports = self.viewModel.downloadFavoriteSports()
        if favoriteSports.contains(where: { $0.strSport! == self.viewModel.sport.strSport}) {
            self.favoriteButton.setImage(
                UIImage(
                    systemName: "heart.fill",
                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)
                ),
                for: .normal
            )
        }
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
            self.viewModel.addSportToFavorites()
        } else {
            self.favoriteButton.setImage(
                UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)),
                for: .normal
            )
            self.viewModel.removeSportFromFavorites()
        }
    }

}

extension SportsDetailView: ViewCoding {
    func setupView() {
        self.backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        self.addSubview(detailScrollView)
        self.detailContainer.addArrangedSubview(headerView)
        self.detailContainer.addArrangedSubview(descriptionView)
        self.detailScrollView.addSubview(detailContainer)
        self.detailScrollView.addSubview(backButton)
        self.detailScrollView.addSubview(favoriteButton)

    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.detailScrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.detailScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.detailScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.detailScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

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
            self.backButton.widthAnchor.constraint(equalToConstant: 50),

            self.favoriteButton.topAnchor.constraint(equalTo: self.descriptionView.topAnchor),
            self.favoriteButton.trailingAnchor.constraint(equalTo: self.descriptionView.trailingAnchor)
        ])
    }
}
