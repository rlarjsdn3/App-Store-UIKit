//
//  SectionDescriptor.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import Foundation

/// 섹션의 메타데이터를 나타내는 모델입니다.
/// 식별자, 제목, 서브타이틀, 유형 등의 정보를 포함합니다.
struct SectionDescriptor: Identifiable {

    /// 섹션을 구분하기 위한 고유 식별자입니다.
    let id: Int

    /// 섹션의 제목입니다.
    let title: String?

    /// 섹션의 서브타이틀입니다.
    let subtitle: String?

    /// 헤더의 분류를 나타내는 타입입니다.
    let type: HeaderType
}

extension SectionDescriptor {

    enum  HeaderType: Int {
        case singleHeadline
        case dualHeadline
        case dualHeadlineReversed
    }
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

    static func emptySection(id: Int = UUID().uuidString.hashValue) -> Self {
        .init(
            id: id,
            title: nil,
            subtitle: nil,
            type: .singleHeadline
        )
    }

    static let workSmartWithAI: Self = .init(
        id: 1,
        title: "AI로 작업을 더 똑똑하게",
        subtitle: "유용한 도구",
        type: .dualHeadlineReversed
    )

    static let funForTheWholeFamily: Self = .init(
        id: 2,
        title: "온 가족과 함께",
        subtitle: "집에서도 밖에서도 좋은 시간을 보내세요.",
        type: .dualHeadline
    )

    static let letTheAdventureBegin: Self = .init(
        id: 3,
        title: "모험을 떠나요",
        subtitle: nil,
        type: .singleHeadline
    )

    static let appStoreClassic: Self = .init(
        id: 4,
        title: "App Store 클래식",
        subtitle: "재미는 계속됩니다!",
        type: .dualHeadline
    )

    static let findBestApp: Self = .init(
        id: 5,
        title: "최고의 앱을 찾아서",
        subtitle: nil,
        type: .singleHeadline
    )

    static let enhanceProductivity: Self = .init(
        id: 6,
        title: "생산성 높이기",
        subtitle: nil,
        type: .singleHeadline
    )

    static let rechargeYourProductivity: Self = .init(
        id: 7,
        title: "생산성 충전소",
        subtitle: nil,
        type: .singleHeadline
    )

    static let editorRecommendation: Self = .init(
        id: 8,
        title: "에디터의 추천",
        subtitle: "직접 검증한 앱과 게임만 추천합니다.",
        type: .dualHeadline
    )

    static let howToUseSocialMedia: Self = .init(
        id: 9,
        title: "소셜 미디어 활용법",
        subtitle: "창의적인 콘텐츠를 만들고, 소통하세요.",
        type: .dualHeadline
    )

    static let howToUseMicrosoftApps: Self = .init(
        id: 10,
        title: "똑똑한 Microsoft 활용법",
        subtitle: "필요한 모든 툴을 한자리에서 만나세요.",
        type: .dualHeadline
    )

    static let expressYourPersonality: Self = .init(
        id: 11,
        title: "개성을 표현해야죠",
        subtitle: nil,
        type: .singleHeadline
    )

    static let tryItOut: Self = .init(
        id: 12,
        title: "한번 써보세요",
        subtitle: "무료 체험을 지원하는 앱.",
        type: .dualHeadline
    )

    static let wordPuzzle: Self = .init(
        id: 13,
        title: "낱말 풀이 퍼즐",
        subtitle: nil,
        type: .singleHeadline
    )

    static let aMoreFulfillingDay: Self = .init(
        id: 14,
        title: "더욱 알찬 하루",
        subtitle: "활기찬 한 주를 보낼 수 있게 돕는 앱.",
        type: .dualHeadline
    )

    static let healthyAndWellbeing: Self = .init(
        id: 15,
        title: "건강과 웰빙",
        subtitle: nil,
        type: .singleHeadline
    )

    static let usefulToolsForHealthyHabits: Self = .init(
        id: 16,
        title: "건강한 습관 들이기",
        subtitle: nil,
        type: .singleHeadline
    )

    static let usefulTools: Self = .init(
        id: 17,
        title: "유용한 도구",
        subtitle: nil,
        type: .singleHeadline
    )

    static let aHealthierMe: Self = .init(
        id: 18,
        title: "더 건강한 나",
        subtitle: nil,
        type: .singleHeadline
    )

    static let doTogether: Self = .init(
        id: 19,
        title: "함께해요",
        subtitle: nil,
        type: .singleHeadline
    )

}
