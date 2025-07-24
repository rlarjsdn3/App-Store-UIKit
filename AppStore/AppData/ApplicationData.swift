//
//  ApplicationData.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import Foundation

struct ApplicationData {

    struct Today {
        let section: TodayContent.Section
        let items: [TodayContent.Item]
    }

    let todays: [Today]

    let todaysForPad: [Today]

    init() {
        todays = [
            Today(
                section: .main(.emptySection(id: 123)),
                items: [
                    .appStory(.angryBirdsBounceStory),
                    .appAdBanner(.temuAdvertisement),
                    .popularTopList(.mostLovedAppsList)
                ]
            ),
            Today(
                section: .main(.workSmartWithAI),
                items: [
                    .appStory(.chatGPTStory),
                    .popularTopList(.allSetForTheSemesterWithAI)
                ]
            ),
            Today(
                section: .main(.funForTheWholeFamily),
                items: [.appStory(.robloxStory)]
            ),
            Today(
                section: .main(.letTheAdventureBegin),
                items: [.popularTopList(.mustPlayAdventureGames)]
            ),
            Today(
                section: .main(.appStoreClassic),
                items: [
                    .appStory(.brawlStarsStory),
                    .appStory(.pokemonGOStory)
                ]
            ),
            Today(
                section: .card(.findBestApp),
                items: [
                    .categryCard(.requiredProductiviyApp10),
                    .categryCard(.requiredHealthApp10),
                    .categryCard(.requiredMoneyApp10),
                    .categryCard(.requiredExcerciseApp10)
                ]
            ),
            Today(
                section: .main(.enhanceProductivity),
                items: [.appGroupPromotion(.collegeLifeCheatCode)]
            ),
            Today(
                section: .main(.rechargeYourProductivity),
                items: [.appStory(.bearStory)]
            ),
            Today(
                section: .main(.editorRecommendation),
                items: [.appStory(.supsupStory), .appStory(.pairsStory)]
            ),
            Today(
                section: .main(.howToUseSocialMedia),
                items: [.appStory(.canvaStory)]
            ),
            Today(
                section: .main(.howToUseMicrosoftApps),
                items: [.messageCard(.microsoftCard)]
            ),
            Today(
                section: .main(.expressYourPersonality),
                items: [.messageCard(.happyArtCard)]
            ),
            Today(
                section: .main(.tryItOut),
                items: [.appStory(.duolingoStory)]
            ),
            Today(
                section: .main(.wordPuzzle),
                items: [.popularTopList(.mastermindsForVoca)]
            ),
            Today(
                section: .main(.aMoreFulfillingDay),
                items: [
                    .appStory(.noteCircleStory),
                    .appGroupPromotion(.appsFitnessEnthusiastsUse)
                ]
            ),
            Today(
                section: .main(.healthyAndWellbeing),
                items: [.appStory(.flickrStory)]
            ),
            Today(
                section: .main(.usefulToolsForHealthyHabits),
                items: [.appStory(.gentlerStreakStory)]
            ),
            Today(
                section: .main(.usefulTools),
                items: [.appStory(.feverStory)]
            ),
            Today(
                section: .main(.aHealthierMe),
                items: [.appStory(.planfitStory)]
            ),
            Today(
                section: .card(.emptySection()),
                items: [
                    .categryCard(.yazio),
                    .categryCard(.timeOfMeditation)
                ]
            ),
            Today(
                section: .main(.doTogether),
                items: [.appStory(.appleInvitationStory)]
            )
        ]

        todaysForPad = [
            Today(
                section: .main(.emptySection(id: 123), ratio: .fourToSix),
                items: [
                    .appStory(.angryBirdsBounceStory),
                    .popularTopList(.mostLovedAppsList)
                ]
            ),
            Today(
                section: .main(.workSmartWithAI, ratio: .sixToFour),
                items: [
                    .appStory(.chatGPTStory),
                    .appGroupPromotion(.appsFitnessEnthusiastsUse)
                ]
            ),
            Today(
                section: .main(.appStoreClassic, ratio: .fourToSix),
                items: [
                    .appStory(.brawlStarsStory),
                    .appStory(.pokemonGOStory)
                ]
            ),
            Today(
                section: .main(.aMoreFulfillingDay, ratio: .sixToFour),
                items: [
                    .appStory(.noteCircleStory),
                    .messageCard(.microsoftCard)
                ]
            ),
        ]
    }
}
let appData = ApplicationData()
