//
//  PopularTopList.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

let appStorePopularListVerticalList  : Int = 1
let appStorePopularListCardHorizontalList: Int = 2

struct PopularTopList {
    ///
    let type: Int
    ///
    let subtitle: String?
    ///
    let title: String
    ///
    let appInfos: [AppDisplayInfo]
    ///
    var backgroundColor: UIColor

    init(
        listTintColor: UIColor,
        appInfos: [AppDisplayInfo],
        subTitle: String?,
        title: String,
        type: Int
    ) {
        self.backgroundColor = listTintColor
        self.appInfos = appInfos
        self.subtitle = subTitle
        self.title = title
        self.type = type
    }
}

extension PopularTopList: Hashable {
}

extension PopularTopList {

    static let mostLovedAppsList: Self = .init(
        listTintColor: .systemBlue,
        appInfos: [.zigzag, .band, .youtubeMusic, .youtube, .kakaotalk],
        subTitle: "추천",
        title: "모두에게 사랑받는 앱",
        type: appStorePopularListVerticalList
    )

    static let allSetForTheSemesterWithAI: Self = .init(
        listTintColor: .systemBlue,
        appInfos: [.trace, .voca, .speak, .moodee, .planfit],
        subTitle: "필수 앱",
        title: "AI 앱으로 학기 준비 끝!",
        type: appStorePopularListVerticalList
    )

    static let mustPlayAdventureGames: Self = .init(
        listTintColor: .systemBlue,
        appInfos: [.callapse, .blackClover, .supsup, .pokemonGO, .roblox],
        subTitle: "고르고 골랐어요",
        title: "꼭 해봐야 할 어드벤처 게임",
        type: appStorePopularListVerticalList
    )

    static let collegeLifeCheatCode: Self = .init(
        listTintColor: .systemOrange,
        appInfos: [.student1, .student2, .student3, .student4, .student5],
        subTitle: "편리한 생활",
        title: "대학생 치트키, 필수 앱 31",
        type: appStorePopularListCardHorizontalList
    )

    static let mastermindsForVoca: Self = .init(
        listTintColor: .systemBlue,
        appInfos: [.quizlet, .cake, .vadaDictionary, .lookUp, .speak],
        subTitle: "배워봅시다",
        title: "영어 단어 마스터하기",
        type: appStorePopularListVerticalList
    )

    static let appsFitnessEnthusiastsUse: Self = .init(
        listTintColor: .systemGreen,
        appInfos: [.health1, .health2, .health3, .health4, .health5],
        subTitle: "편리한 생활",
        title: "운동하는 사람은\n이런 앱을 씁니다.",
        type: appStorePopularListCardHorizontalList
    )
}
