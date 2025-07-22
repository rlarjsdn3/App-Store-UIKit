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
    
    init() {
        todays = [
            Today(
                section: .main(.emptySection()),
                items: [
                    .story(.angryBirdsBounceStory),
                    .advertisement(.temuAdvertisement),
                    .topList(.mostLovedAppsList)
                ]
            ),
            Today(
                section: .main(.workSmartWithAI),
                items: [
                    .story(.chatGPTStory),
                    .topList(.allSetForTheSemesterWithAI)
                ]
            ),
            Today(
                section: .main(.funForTheWholeFamily),
                items: [.story(.robloxStory)]
            ),
            Today(
                section: .main(.letTheAdventureBegin),
                items: [.topList(.mustPlayAdventureGames)]
            ),
            Today(
                section: .main(.appStoreClassic),
                items: [
                    .story(.brawlStarsStory),
                    .story(.pokemonGOStory)
                ]
            ),
            Today(
                section: .card(.findBestApp),
                items: [
                    .card(.requiredProductiviyApp10),
                    .card(.requiredHealthApp10),
                    .card(.requiredMoneyApp10),
                    .card(.requiredExcerciseApp10)
                ]
            ),
            Today(
                section: .main(.enhanceProductivity),
                items: [.promotion(.collegeLifeCheatCode)]
            ),
            Today(
                section: .main(.rechargeYourProductivity),
                items: [.story(.bearStory)]
            ),
            Today(
                section: .main(.editorRecommendation),
                items: [.story(.supsupStory), .story(.pairsStory)]
            ),
            Today(
                section: .main(.howToUseSocialMedia),
                items: [.story(.canvaStory)]
            ),
            Today(
                section: .main(.howToUseMicrosoftApps),
                items: [.bigCard(.microsoftCard)]
            ),
            Today(
                section: .main(.expressYourPersonality),
                items: [.bigCard(.happyArtCard)]
            ),
            Today(
                section: .main(.tryItOut),
                items: [.story(.duolingoStory)]
            ),
            Today(
                section: .main(.wordPuzzle),
                items: [.topList(.mastermindsForVoca)]
            ),
            Today(
                section: .main(.aMoreFulfillingDay),
                items: [
                    .story(.noteCircleStory),
                    .promotion(.appsFitnessEnthusiastsUse)
                ]
            ),
            Today(
                section: .main(.healthyAndWellbeing),
                items: [.story(.flickrStory)]
            ),
            Today(
                section: .main(.usefulToolsForHealthyHabits),
                items: [.story(.gentlerStreakStory)]
            ),
            Today(
                section: .main(.usefulTools),
                items: [.story(.feverStory)]
            ),
            Today(
                section: .main(.aHealthierMe),
                items: [.story(.planfitStory)]
            ),
            Today(
                section: .main(.emptySection()),
                items: [
                    .card(.yazio),
                    .card(.timeOfMeditation)
                ]
            ),
            Today(
                section: .main(.doTogether),
                items: [.story(.appleInvitationStory)]
            )
        ]
    }
}
let appData = ApplicationData()
