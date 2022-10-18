//
//  Sport+Mock.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 17/10/22.
//

import Foundation
@testable import AtomuzSports

extension Sport {
    static var mock = Sport(
        idSport: "",
        strSport: "Test",
        strFormat: StrFormat.teamvsTeam,
        strSportThumb: "",
        strSportIconGreen: "",
        strSportDescription: ""
    )

    static var mockWithTwoElements: [Sport] = [
        Sport(
            idSport: "",
            strSport: "Test1",
            strFormat: StrFormat.teamvsTeam,
            strSportThumb: "",
            strSportIconGreen: "",
            strSportDescription: ""
        ),
        Sport(
            idSport: "",
            strSport: "Test1",
            strFormat: StrFormat.teamvsTeam,
            strSportThumb: "",
            strSportIconGreen: "",
            strSportDescription: ""
        )
    ]
}
