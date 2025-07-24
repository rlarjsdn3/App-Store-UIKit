//
//  AppDisplayInfo.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

/// 앱 정보를 나타내는 모델입니다.
/// 앱 아이콘, 이름, 서브타이틀, 버튼 스타일 등 앱의 기본 표시 정보를 포함합니다.
struct AppDisplayInfo {

    /// 앱 아이콘에 적용할 틴트 색상입니다.
    let iconTintColor: UIColor

    /// 앱 아이콘에 사용할 이미지 리소스입니다.
    let iconImageResource: ImageResource

    /// 앱 아이콘 이미지입니다. `iconImageResource`를 통해 생성됩니다.
    var iconImage: UIImage? {
        UIImage(resource: iconImageResource)
    }

    /// 앱의 타입(예: 일반 앱, Apple Arcade 등)입니다.
    let type: AppType?

    /// 앱 이름입니다.
    let name: String

    /// 앱 이름에 적용할 텍스트 색상입니다.
    let nameColor: UIColor

    /// 앱 서브타이틀(설명 또는 부가 정보)입니다.
    let subtitle: String

    /// 서브타이틀에 적용할 텍스트 색상입니다.
    let subtitleColor: UIColor

    /// 다운로드 버튼의 타이틀(텍스트)에 적용할 색상입니다.
    let buttonTitleColor: UIColor

    /// 다운로드 버튼의 배경색입니다.
    let buttonBackgroundColor: UIColor

    /// 다운로드 버튼이 강조(highlighted) 상태일 때의 배경색입니다.
    let buttonHighlightedBackgroundColor: UIColor

    /// 인앱 결제 항목이 포함되어 있는지 여부입니다.
    let hasInAppPurchase: Bool

    init(
        appIconTintColor: UIColor = .systemGray5,
        appIconImageResource: ImageResource,
        appType: AppType? = nil,
        appName: String,
        appNameColor: UIColor = .white,
        appSubtitle: String,
        appSubtitleColor: UIColor = .whiteWithAlpha50,
        inAppPurchase: Bool,
        downloadButtonTitleColor: UIColor = .white,
        downloadButtonTintColor: UIColor = .whiteWithAlpha50,
        downloadButtonDownloadedTintColor: UIColor = .blackWithAlpha10
    ) {
        self.iconTintColor = appIconTintColor
        self.iconImageResource = appIconImageResource
        self.type = appType
        self.name = appName
        self.nameColor = appNameColor
        self.subtitle = appSubtitle
        self.subtitleColor = appSubtitleColor
        self.hasInAppPurchase = inAppPurchase
        self.buttonTitleColor = downloadButtonTitleColor
        self.buttonBackgroundColor = downloadButtonTintColor
        self.buttonHighlightedBackgroundColor = downloadButtonDownloadedTintColor
    }
}

extension AppDisplayInfo {

    enum AppType: String {
        case appleArcade = "Apple Arcade"
    }
}

extension AppDisplayInfo: Hashable {
}

extension AppDisplayInfo {

    static let angryBirds: Self = .init(
        appIconTintColor: .systemBlue,
        appIconImageResource: .rocket,
        appType: .appleArcade,
        appName: "Angry Birds Bounce",
        appSubtitle: "무리를 모으고 튕기세요!",
        inAppPurchase: false
    )

    static let temu: Self = .init(
        appIconTintColor: .systemOrange,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Temu: 억만장자처럼 쇼핑하기",
        appSubtitle: "",
        inAppPurchase: false
    )

    static let zigzag: Self = .init(
        appIconTintColor: .systemPink,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "지그재그 - ZIGZAG",
        appSubtitle: "제가 알아서 살게요",
        inAppPurchase: false
    )

    static let band: Self = .init(
        appIconTintColor: .systemGreen,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "밴드-모임이 쉬워진다!",
        appSubtitle: "소모임, 챌린지, 스터디, 취미 모임",
        inAppPurchase: false
    )

    static let youtubeMusic: Self = .init(
        appIconTintColor: .systemRed,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Youtube Music",
        appSubtitle: "오직 나만을 위한 음악의 세계",
        inAppPurchase: false
    )

    static let youtube: Self = .init(
        appIconTintColor: .systemRed,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Youtube",
        appSubtitle: "동영상과 음악을 즐기고 공유하세요",
        inAppPurchase: false
    )

    static let kakaotalk: Self = .init(
        appIconTintColor: .systemYellow,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "카카오톡",
        appSubtitle: "모든 연결의 시작",
        inAppPurchase: false
    )

    static let chatGPT: Self = .init(
        appIconTintColor: .white,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "ChatGPT",
        appSubtitle: "OpenAI의 공식 앱",
        inAppPurchase: false
    )

    static let trace: Self = .init(
        appIconTintColor: .white,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Trace: 할일·일정·루틴 관리 - AI 리마인더",
        appSubtitle: "AI로 오늘 할일부터 일정까지 수립하세요!",
        inAppPurchase: true
    )

    static let voca: Self = .init(
        appIconTintColor: .systemPurple,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "말해보가: 영단어, 문법, 리스닝, 스피킹, 영어 공부",
        appSubtitle: "쉽게 할 수 있어야 쉽게 느니까",
        inAppPurchase: true
    )

    static let speak: Self = .init(
        appIconTintColor: .systemBlue,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "스픽 (Speak) - 영어회화, 스피킹, 발음",
        appSubtitle: "영어학원이 싫어하는 영어어플",
        inAppPurchase: true
    )

    static let moodee: Self = .init(
        appIconTintColor: .systemGreen,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "무디 Moodee : 지금의 감정에 필요한 것은?",
        appSubtitle: "지금 내 감정에 꼭 필요한 퀘스트를 알아보세요!",
        inAppPurchase: true
    )

    static let planfit: Self = .init(
        appIconTintColor: .black,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "플랜핏 - 운동 루틴 추천과 헬스 홈트 다이어트 기록",
        appSubtitle: "헬스 홈트 운동 추천 피트니스 다이어트 기록",
        inAppPurchase: true
    )

    static let roblox: Self = .init(
        appIconTintColor: .systemBlue,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Roblox",
        appSubtitle: "수천만 가지 가상 체험 공간",
        inAppPurchase: true
    )

    static let callapse: Self = .init(
        appIconTintColor: .systemPink,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "붕괴: 스타레일",
        appSubtitle: "은하 판타기 RPG",
        inAppPurchase: true
    )

    static let blackClover: Self = .init(
        appIconTintColor: .black,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "블랙클로버 모바일",
        appSubtitle: "블랙클로버 모바일 the opening of fate",
        inAppPurchase: true
    )

    static let pokemonGO: Self = .init(
        appIconTintColor: .systemRed,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Pokémon GO",
        appSubtitle: "전 세계에서 포켓몬을 발견하자",
        inAppPurchase: true
    )

    static let brawlStars: Self = .init(
        appIconTintColor: .systemOrange,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "브롤스타즈",
        appSubtitle: "멀티플레이 PvP 배틀 로얄 MOBA",
        inAppPurchase: true
    )

    static let student1: Self = .init(
        appIconTintColor: .systemYellow,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "string",
        appSubtitle: "string",
        inAppPurchase: false
    )

    static let student2: Self = .init(
        appIconTintColor: .systemBlue,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "string",
        appSubtitle: "string",
        inAppPurchase: false
    )

    static let student3: Self = .init(
        appIconTintColor: .systemGreen,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "string",
        appSubtitle: "string",
        inAppPurchase: false
    )

    static let student4: Self = .init(
        appIconTintColor: .systemPink,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "string",
        appSubtitle: "string",
        inAppPurchase: false
    )

    static let student5: Self = .init(
        appIconTintColor: .black,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "string",
        appSubtitle: "string",
        inAppPurchase: false
    )

    static let bear: Self = .init(
        appIconTintColor: .systemRed,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "베어 - 작문 및 markdown 편집자",
        appSubtitle: "보안 마크다운 텍스트 편집기",
        inAppPurchase: false
    )

    static let supsup: Self = .init(
        appIconTintColor: .systemRed,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "숩숩",
        appSubtitle: "숨은그림찾기 일러스트 매거진",
        inAppPurchase: true
    )

    static let pairs: Self = .init(
        appIconTintColor: .systemMint,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "페어즈 - AI 가치관 매칭이 이어주는 특별한 소개팅앱",
        appNameColor: .black,
        appSubtitle: #"페어즈 "속마음 매칭"으로 마음으로 서로를 이어보세요!"#,
        appSubtitleColor: .blackWithAlpha50,
        inAppPurchase: true,
        downloadButtonTitleColor: .white,
        downloadButtonTintColor: .blackWithAlpha50,
    )

    static let canva: Self = .init(
        appIconTintColor: .systemBlue,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Canva(캔바): 디자인, 사진편집, 동영상 편집",
        appSubtitle: "그래픽 디자인 + 로고 메이커",
        inAppPurchase: true
    )

    static let duolingo: Self = .init(
        appIconTintColor: .systemGreen,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "듀오링고(Duolingo): 언어 학습",
        appSubtitle: "영어, 스페인어, 프랑스어를 배워보세요!",
        inAppPurchase: true
    )

    static let quizlet: Self = .init(
        appIconTintColor: .systemBlue,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Quizlet: 낱말카드로 학습하기",
        appSubtitle: "학습 가이드 및 숙제 도움",
        inAppPurchase: true
    )

    static let cake: Self = .init(
        appIconTintColor: .systemPink,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Cake: 전 세계 1억 다운로드 영어 학습 앱",
        appSubtitle: "1분에 영어 표현 한 개씩 내려주는 영어 학습 앱",
        inAppPurchase: true
    )

    static let vocaDictionary: Self = .init(
        appIconTintColor: .systemPurple,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "말해보카 영어사전",
        appSubtitle: "세상에 없던 AI 영어사전",
        inAppPurchase: false
    )

    static let lookUp: Self = .init(
        appIconTintColor: .systemBlue,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "LookUp: English Dictionary",
        appSubtitle: "참고",
        inAppPurchase: true
    )

    static let noteCircle: Self = .init(
        appIconTintColor: .systemPurple,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "NoteCircle: 투두, 루틴, 캘린더, 일정관리",
        appNameColor: .black,
        appSubtitle: "주간 일정 루틴 관리, 리마인더, 노트, 일정관리",
        appSubtitleColor: .blackWithAlpha50,
        inAppPurchase: true,
        downloadButtonTitleColor: .white,
        downloadButtonTintColor: .blackWithAlpha50
    )

    static let health1: Self = .init(
        appIconTintColor: .white,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "health1",
        appSubtitle: "health1",
        inAppPurchase: false
    )

    static let health2: Self = .init(
        appIconTintColor: .systemBlue,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "health1",
        appSubtitle: "health1",
        inAppPurchase: false
    )

    static let health3: Self = .init(
        appIconTintColor: .systemOrange,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "health1",
        appSubtitle: "health1",
        inAppPurchase: false
    )

    static let health4: Self = .init(
        appIconTintColor: .black,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "health1",
        appSubtitle: "health1",
        inAppPurchase: false
    )

    static let health5: Self = .init(
        appIconTintColor: .systemBlue,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "health1",
        appSubtitle: "health1",
        inAppPurchase: false
    )

    static let flikr: Self = .init(
        appIconTintColor: .systemRed,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "플릭 - 운동일지, 운동기록, 운동일기, 운동루틴",
        appSubtitle: "어제보다 나은 오늘을 만드는 쉽게 만들어주는 앱",
        inAppPurchase: true
    )

    static let gentlerStreak: Self = .init(
        appIconTintColor: .systemOrange,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Gentler Streak - 운동 및 건강활동 트래커",
        appNameColor: .black,
        appSubtitle: "심박수 & 스포츠 및 피트니스 워킹을 도와주는 앱",
        appSubtitleColor: .blackWithAlpha50,
        inAppPurchase: true,
        downloadButtonTitleColor: .white,
        downloadButtonTintColor: .blackWithAlpha50
    )

    static let fever: Self = .init(
        appIconTintColor: .black,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Fever: 이벤트 · 티켓",
        appNameColor: .black,
        appSubtitle: "내 주변 즐길거리 · 재미",
        appSubtitleColor: .blackWithAlpha50,
        inAppPurchase: false,
        downloadButtonTitleColor: .white,
        downloadButtonTintColor: .blackWithAlpha50
    )

    static let appleInvitation: Self = .init(
        appIconTintColor: .systemYellow,
        appIconImageResource: .rocket,
        appType: nil,
        appName: "Apple 초대",
        appNameColor: .black,
        appSubtitle: "초대, 소중한 순간을 함께 계획하고 간직하기",
        appSubtitleColor: .blackWithAlpha50,
        inAppPurchase: false,
        downloadButtonTitleColor: .white,
        downloadButtonTintColor: .blackWithAlpha50
    )
}

