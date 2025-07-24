//
//  Card.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

struct CategoryCard {
    ///
    let cardTintColor: UIColor
    ///
    let subTitle1: String?
    ///
    let title: String
    ///
    let subTitle2: String?
    ///
    let titleColor: UIColor // 일부 카드 색상 서로 다름

    init(
        cardTintColor: UIColor,
        subTitle1: String?,
        title: String,
        subTitle2: String?,
        titleColor: UIColor = .white
    ) {
        self.cardTintColor = cardTintColor
        self.subTitle1 = subTitle1
        self.title = title
        self.subTitle2 = subTitle2
        self.titleColor = titleColor
    }
}

extension CategoryCard: Hashable {
}

extension CategoryCard {

    static let requiredProductiviyApp10: Self = .init(
        cardTintColor: .white,
        subTitle1: nil,
        title: "필수 생산성 앱 10",
        subTitle2: nil
    )

    static let requiredHealthApp10: Self = .init(
        cardTintColor: .systemBlue,
        subTitle1: nil,
        title: "필수 건강 식단 앱 10",
        subTitle2: nil
    )

    static let requiredMoneyApp10: Self = .init(
        cardTintColor: .systemYellow,
        subTitle1: nil,
        title: "필수 금융 앱 10",
        subTitle2: nil,
        titleColor: .black
    )

    static let requiredExcerciseApp10: Self = .init(
        cardTintColor: .systemBrown,
        subTitle1: nil,
        title: "필수 운동 앱 10",
        subTitle2: nil
    )

    static let yazio: Self = .init(
        cardTintColor: .white,
        subTitle1: nil,
        title: "야지오",
        subTitle2: nil
    )

    static let timeOfMeditation: Self = .init(
        cardTintColor: .white,
        subTitle1: nil,
        title: "명상의 시간",
        subTitle2: nil
    )

    static let microsoftCard: Self = .init(
        cardTintColor: .systemGray5,
        subTitle1: "시작하기",
        title: "Microsoft의 앱들로\n생산성을 높이세요",
        subTitle2: nil
    )

    static let happyArtCard: Self = .init(
        cardTintColor: .systemPink,
        subTitle1: "창의력을 발휘해보세요",
        title: "즐거운 미술 놀이",
        subTitle2: "아이 내면의 예술가를 깨우세요!"
    )
}
