//
//  SectionDescriptor.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import Foundation

///
struct SectionDescriptor: Identifiable {
    ///
    let id: Int
    ///
    let title: String?
    ///
    let subTitle: String?
    ///
    let type: `Type`
}

extension SectionDescriptor: Hashable {
    static func == (lhs: SectionDescriptor, rhs: SectionDescriptor) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension SectionDescriptor {

    enum `Type`: Int {
        ///
        case singleHeadline
        ///
        case dualHeadline
        ///
        case dualHeadlineReversed
    }
}

extension SectionDescriptor {

    static func emptySection(id: Int = UUID().uuidString.hashValue) -> Self {
        .init(
            id: id,
            title: nil,
            subTitle: nil,
            type: .singleHeadline
        )
    }

    static let workSmartWithAI: Self = .init(
        id: 1,
        title: "AI로 작업을 더 똑똑하게",
        subTitle: "유용한 도구",
        type: .dualHeadlineReversed
    )

    static let funForTheWholeFamily: Self = .init(
        id: 2,
        title: "온 가족과 함께",
        subTitle: "집에서도 밖에서도 좋은 시간을 보내세요.",
        type: .dualHeadline
    )

    static let letTheAdventureBegin: Self = .init(
        id: 3,
        title: "모험을 떠나요",
        subTitle: nil,
        type: .singleHeadline
    )

    static let appStoreClassic: Self = .init(
        id: 4,
        title: "App Store 클래식",
        subTitle: "재미는 계속됩니다!",
        type: .dualHeadline
    )

    static let findBestApp: Self = .init(
        id: 5,
        title: "최고의 앱을 찾아서",
        subTitle: nil,
        type: .singleHeadline
    )

    static let enhanceProductivity: Self = .init(
        id: 6,
        title: "생산성 높이기",
        subTitle: nil,
        type: .singleHeadline
    )

    static let rechargeYourProductivity: Self = .init(
        id: 7,
        title: "생상성 충전소",
        subTitle: nil,
        type: .singleHeadline
    )

    static let editorRecommendation: Self = .init(
        id: 8,
        title: "에디터의 추천",
        subTitle: "직접 검증한 앱과 게임만 추천합니다.",
        type: .dualHeadline
    )

    static let howToUseSocialMedia: Self = .init(
        id: 9,
        title: "소셜 미디어 활용법",
        subTitle: "창의적인 콘텐츠를 만들고, 소통하세요.",
        type: .dualHeadline
    )

    static let howToUseMicrosoftApps: Self = .init(
        id: 10,
        title: "똑똑한 Microsoft 활용법",
        subTitle: "필요한 모든 툴을 한자리에서 만나세요.",
        type: .dualHeadline
    )

    static let expressYourPersonality: Self = .init(
        id: 11,
        title: "개성을 표현해야죠",
        subTitle: nil,
        type: .singleHeadline
    )

    static let tryItOut: Self = .init(
        id: 12,
        title: "한번 써보세요",
        subTitle: "무료 체험을 지원하는 앱.",
        type: .dualHeadline
    )

    static let wordPuzzle: Self = .init(
        id: 13,
        title: "낱말 풀이 퍼즐",
        subTitle: nil,
        type: .singleHeadline
    )

    static let aMoreFulfillingDay: Self = .init(
        id: 14,
        title: "더욱 알찬 하루",
        subTitle: "활기찬 한 주를 보낼 수 있게 돕는 앱.",
        type: .dualHeadline
    )

    static let healthyAndWellbeing: Self = .init(
        id: 15,
        title: "건강과 웰빙",
        subTitle: nil,
        type: .singleHeadline
    )

    static let usefulToolsForHealthyHabits: Self = .init(
        id: 16,
        title: "건강한 습관 들이기",
        subTitle: nil,
        type: .singleHeadline
    )

    static let usefulTools: Self = .init(
        id: 17,
        title: "유용한 도구",
        subTitle: nil,
        type: .singleHeadline
    )

    static let aHealthierMe: Self = .init(
        id: 18,
        title: "더 건강한 나",
        subTitle: nil,
        type: .singleHeadline
    )

    static let doTogether: Self = .init(
        id: 19,
        title: "함께해요",
        subTitle: nil,
        type: .singleHeadline
    )

}
