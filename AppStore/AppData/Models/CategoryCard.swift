//
//  Card.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

/// 카테고리 카드에 표시될 정보를 담는 모델입니다.
/// 제목, 서브타이틀, 색상 정보 등을 포함합니다.
struct CategoryCard {

    /// 카드 상단에 표시될 첫 번째 서브타이틀입니다.
    let primarySubtitle: String?

    /// 카드의 메인 타이틀입니다.
    let title: String

    /// 카드 하단에 표시될 두 번째 서브타이틀입니다.
    let secondarySubtitle: String?

    /// 타이틀에 적용할 텍스트 색상입니다.
    let titleColor: UIColor

    /// 카드 전체에 적용할 배경 색상 또는 강조 색상입니다.
    let cardTintColor: UIColor

    init(
        cardTintColor: UIColor,
        subTitle1: String?,
        title: String,
        subTitle2: String?,
        titleColor: UIColor = .white
    ) {
        self.cardTintColor = cardTintColor
        self.primarySubtitle = subTitle1
        self.title = title
        self.secondarySubtitle = subTitle2
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
