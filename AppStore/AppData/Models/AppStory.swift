//
//  AppStory.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

struct AppStory {
    ///
    let primarySubtitle: String?
    ///
    let primarySubtitleColor: UIColor

    ///
    let title: String
    ///
    let titleFontSize: CGFloat
    ///
    let titleColor: UIColor
    ///
    let titleLineSpacing: CGFloat

    ///
    let secondaySubtitle: String?
    ///
    let secondarySubtitleColor: UIColor

    ///
    let appDisplayInfo: AppDisplayInfo

    init(
        subTitle1: String?,
        subTitle1Color: UIColor = .whiteWithAlph50,
        title: String,
        titleSize: CGFloat = 30,
        titleColor: UIColor = .white,
        subTitle2: String?,
        subTitle2Color: UIColor = .whiteWithAlph50,
        titleSpacing: CGFloat = 2,
        appDisplayInfo: AppDisplayInfo
    ) {
        self.primarySubtitle = subTitle1
        self.primarySubtitleColor = subTitle1Color
        self.title = title
        self.titleFontSize = titleSize
        self.titleColor = titleColor
        self.secondaySubtitle = subTitle2
        self.secondarySubtitleColor = subTitle2Color
        self.titleLineSpacing = titleSpacing
        self.appDisplayInfo = appDisplayInfo
    }
}

extension AppStory: Hashable {
}

extension AppStory {

    static let angryBirdsBounceStory: Self = .init(
        subTitle1: "지금 APPLE ARCADE에서 만나요",
        title: "틀을 깨는 과감한 도전!",
        subTitle2: nil,
        appDisplayInfo: .angryBirds
    )

    static let chatGPTStory: Self = .init(
        subTitle1: "이렇게 하세요",
        title: "강력한 관리자의 등장",
        subTitle2: "시간을 잡아먹는 일상 업무를 〈ChatGPT〉에게 맡겨보세요.",
        titleSpacing: 4,
        appDisplayInfo: .chatGPT
    )

    static let robloxStory: Self = .init(
        subTitle1: "게임 핵심 정리",
        title: "Roblox",
        subTitle2: "App Store의 강력 추천 게임을 살펴보세요.",
        titleSpacing: 4,
        appDisplayInfo: .roblox
    )

    static let brawlStarsStory: Self = .init(
        subTitle1: "명작의 재발견",
        title: "새롭게 돌아온 브롤스타스",
        subTitle2: nil,
        appDisplayInfo: .brawlStars
    )

    static let pokemonGOStory: Self = .init(
        subTitle1: "시작하기",
        title: "Pokémon GO 팁 5",
        subTitle2: nil,
        appDisplayInfo: .pokemonGO
    )

    static let bearStory: Self = .init(
        subTitle1: "모두에게 사랑받는 앱",
        title: "베어",
        subTitle2: "필기하는 방식을 바꿔줄 메모 앱.",
        titleSpacing: 4,
        appDisplayInfo: .bear
    )

    static let supsupStory: Self = .init(
        subTitle1: nil,
        title: "오늘의\n게임",
        titleSize: 46,
        subTitle2: "동화책처럼 아름다운 숨은 그림 찾기",
        titleSpacing: 6,
        appDisplayInfo: .supsup
    )

    static let pairsStory: Self = .init(
        subTitle1: nil,
        title: "오늘의\n앱",
        titleSize: 46,
        titleColor: .black,
        subTitle2: "나와 꼭 맞는 인연을 찾아보세요.",
        subTitle2Color: .blackWithAlpha50,
        titleSpacing: 6,
        appDisplayInfo: .pairs
    )

    static let canvaStory: Self = .init(
        subTitle1: "이렇게 하세요",
        title: "Canva Pro로 부업의\n품격을 높이세요",
        subTitle2: "이제 쉽게 디자인하세요",
        titleSpacing: 4,
        appDisplayInfo: .canva
    )

    static let duolingoStory: Self = .init(
        subTitle1: "모두에게 사랑받는 앱",
        title: "듀오링고",
        subTitle2: "지구촌을 언어로 연결합니다.",
        titleSpacing: 4,
        appDisplayInfo: .duolingo
    )

    static let noteCircleStory: Self = .init(
        subTitle1: "모두에게 사랑받는 앱",
        subTitle1Color: .blackWithAlpha50,
        title: "NoteCircle",
        titleColor: .black,
        subTitle2: "할 일 관리부터 체크 목록까지 한 번에!",
        subTitle2Color: .blackWithAlpha50,
        titleSpacing: 4,
        appDisplayInfo: .noteCircle
    )

    static let flickrStory: Self = .init(
        subTitle1: "모두에게 사랑받는 앱",
        title: "플릭",
        subTitle2: "운동을 의미있게, 재미있게 하고싶다면.",
        appDisplayInfo: .flikr
    )

    static let gentlerStreakStory: Self = .init(
        subTitle1: "고르고 골랐어요",
        subTitle1Color: .blackWithAlpha50,
        title: "에디터의 선택:\nGentler Streak",
        titleColor: .black,
        subTitle2: nil,
        subTitle2Color: .blackWithAlpha50,
        appDisplayInfo: .gentlerStreak
    )

    static let feverStory: Self = .init(
        subTitle1: "모두에게 사랑받는 앱",
        subTitle1Color: .blackWithAlpha50,
        title: "Fever",
        titleColor: .black,
        subTitle2: "이 도시의 다양한 이벤트를 발견하고 예약하세요.",
        subTitle2Color: .blackWithAlpha50,
        titleSpacing: 4,
        appDisplayInfo: .fever
    )

    static let planfitStory: Self = .init(
        subTitle1: "모두에게 사랑받는 앱",
        title: "플랜핏",
        subTitle2: "운동, 혼자서도 문제없어요.",
        titleSpacing: 4,
        appDisplayInfo: .planfit
    )

    static let appleInvitationStory: Self = .init(
        subTitle1: "새로운 앱",
        subTitle1Color: .blackWithAlpha50,
        title: "모임을 빛내는 초대장",
        titleColor: .black,
        subTitle2: "Apple 초대로 모임을 생성해보세요.",
        subTitle2Color: .blackWithAlpha50,
        titleSpacing: 4,
        appDisplayInfo: .appleInvitation
    )
}
