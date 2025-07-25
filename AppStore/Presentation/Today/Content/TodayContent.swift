//
//  TodayContent.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

enum TodayContent {

    /// 컬렉션 뷰의 섹션 구성을 정의하는 열거형입니다.
    ///
    /// - mostTop: 가장 상단의 고정된 섹션 (헤더 없음)
    /// - main: 일반 콘텐츠를 나타내는 주요 섹션. `SectionDescriptor`를 통해 타이틀 등 메타 정보를 가짐
    /// - card: 카드 스타일의 콘텐츠 섹션. `SectionDescriptor`를 통해 타이틀 등 메타 정보를 가짐
    /// - mostBottom: 가장 하단의 고정된 섹션 (헤더 없음)
    enum Section: Hashable {
        case mostTop
        case main(SectionDescriptor, ratio: SplitRatio = .zero)
        case card(SectionDescriptor)
        case mostBottom

        /// 해당 섹션이 헤더를 포함해야 하는지 여부를 반환합니다.
        ///
        /// `main` 및 `card` 섹션은 `SectionDescriptor`에 타이틀이 있을 경우에만 헤더를 포함하고,
        /// `mostTop`, `mostBottom` 섹션은 항상 헤더를 포함하지 않습니다.
        var hasHeader: Bool {
            switch self {
            case .mostTop, .mostBottom:
                return false
            case .main(let descriptor, _), .card(let descriptor):
                return descriptor.title != nil
            }
        }
    }

    /// 컬렉션 뷰의 아이템 종류를 정의하는 열거형입니다.
    ///
    /// 각 case는 화면에 표시될 셀 유형과 연관된 데이터를 나타냅니다.
    enum Item: Hashable {
        
        /// 상단 날짜 및 프로필 정보를 표시하는 바
        case profileHeader
        
        /// 앱 광고 배너 (앱스토어 스타일 광고)
        case appAdBanner(AppAdBanner)
        
        /// 앱 스토리 콘텐츠 (앱 추천 메시지나 프로모션 등)
        case appStory(AppStory)
        
        /// 인기 앱 리스트 (제목, 부제목, 앱 3개 정보 포함)
        case popularTopList(PopularTopList)
        
        /// 인기 앱 프로모션 (배경 이미지 + 앱 아이콘들 포함)
        case appGroupPromotion(PopularTopList)
        
        /// 카테고리 성격의 간단한 카드 (선택 유도 목적)
        case categryCard(CategoryCard)
        
        /// 정보 전달 중심의 큰 카드 (텍스트 강조)
        case messageCard(CategoryCard)
        
        /// 이용약관 또는 하단 안내 문구
        case termsOfUse
    }
}

@MainActor
extension TodayContent.Item {
    
    /// 주어진 `Item` 케이스에 따라 적절한 셀을 dequeue하여 반환합니다.
    ///
    /// 이 메서드는 다양한 셀 등록 정보를 바탕으로, 컬렉션 뷰에서 각 셀을 동적으로 생성합니다.
    /// `Item`의 각 case는 연관된 셀과 모델 타입이 다르기 때문에, 대응하는 셀 등록 객체를 함께 전달해야 합니다.
    ///
    /// - Parameters:
    ///   - collectionView: 셀을 dequeue할 대상 컬렉션 뷰입니다.
    ///   - profileHeaderCellRegistration: `.profileHeader`에 대응하는 셀 등록 객체입니다.
    ///   - appAdBannerCellRegistration: `.appAdBanner`에 대응하는 셀 등록 객체입니다.
    ///   - appStoryCellRegistration: `.appStory`에 대응하는 셀 등록 객체입니다.
    ///   - popularTopListCellRegistration: `.popularTopList`에 대응하는 셀 등록 객체입니다.
    ///   - appGroupPromotionCellRegistration: `.appGroupPromotion`에 대응하는 셀 등록 객체입니다.
    ///   - categoryCardCellRegistration: `.categryCard`에 대응하는 셀 등록 객체입니다.
    ///   - messageCardCellRegistration: `.messageCard`에 대응하는 셀 등록 객체입니다.
    ///   - termsOfUseCellRegistration: `.termsOfUse`에 대응하는 셀 등록 객체입니다.
    ///   - indexPath: 셀을 dequeue할 위치 정보입니다.
    /// - Returns: 현재 `Item` 케이스에 해당하는 구성의 `UICollectionViewCell` 인스턴스입니다.
    func dequeueReusableCollectionViewCell(
        collectionView: UICollectionView,
        profileHeaderCellRegistration: UICollectionView.CellRegistration<ProfileHeaderCell, Void>,
        appAdBannerCellRegistration: UICollectionView.CellRegistration<AppAdBannerCollectionViewCell, AppAdBanner>,
        appStoryCellRegistration: UICollectionView.CellRegistration<AppStoryCollectionViewCell, AppStory>,
        popularTopListCellRegistration: UICollectionView.CellRegistration<PopularTopListCollectionViewCell, PopularTopList>,
        appGroupPromotionCellRegistration: UICollectionView.CellRegistration<AppGroupPromotionCollectionViewCell, PopularTopList>,
        categoryCardCellRegistration: UICollectionView.CellRegistration<CategoryCardColelctionViewCell, CategoryCard>,
        messageCardCellRegistration: UICollectionView.CellRegistration<MessageCardCollectionViewCell, CategoryCard>,
        termsOfUseCellRegistration: UICollectionView.CellRegistration<TermsOfUseCollectionViewCell, Void>,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch self {
        case .profileHeader:
            return collectionView.dequeueConfiguredReusableCell(
                using: profileHeaderCellRegistration,
                for: indexPath,
                item: ()
            )
        case .appAdBanner(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: appAdBannerCellRegistration,
                for: indexPath,
                item: content
            )
        case .appStory(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: appStoryCellRegistration,
                for: indexPath,
                item: content
            )
        case .popularTopList(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: popularTopListCellRegistration,
                for: indexPath,
                item: content
            )
        case .appGroupPromotion(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: appGroupPromotionCellRegistration,
                for: indexPath,
                item: content
            )
        case .categryCard(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: categoryCardCellRegistration,
                for: indexPath,
                item: content
            )
        case .messageCard(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: messageCardCellRegistration,
                for: indexPath,
                item: content
            )
        case .termsOfUse:
            return collectionView.dequeueConfiguredReusableCell(
                using: termsOfUseCellRegistration,
                for: indexPath,
                item: ()
            )
        }
    }
}

@MainActor
extension TodayContent.Section {

    /// 섹션 타입에 따라 적절한 헤더 셀(`UICollectionViewListCell`)을 dequeue하여 반환합니다.
    ///
    /// 기본적으로 `main`, `card` 섹션에는 헤더가 표시되지만,
    ///              해당 섹션의 `SectionDescriptor.title` 값이 `nil`인 경우에는 헤더가 표시되지 않습니다.
    ///              그 외 섹션(`mostTop`, `mostBottom`)에는 헤더가 표시되지 않습니다.
    ///
    /// - Note: 이 메서드는 일반적인 `UICollectionReusableView`가 아닌
    ///         `UICollectionViewListCell`을 기반으로 한 supplementary view를 반환합니다.
    ///
    /// - Parameters:
    ///   - collectionView: 셀을 dequeue할 대상 컬렉션 뷰입니다.
    ///   - defaultHeaderRegistration: 기본 헤더 셀로 사용할 `UICollectionViewListCell` 등록 객체입니다.
    ///   - indexPath: 헤더를 dequeue할 위치입니다.
    /// - Returns: 해당 섹션에 맞는 `UICollectionReusableView` 인스턴스 또는 `nil` (헤더가 없을 경우)
    func dequeueCollectionReusableView(
        collectionView: UICollectionView,
        defaultHeaderRegistration: UICollectionView.SupplementaryRegistration<UICollectionViewListCell>,
        indexPath: IndexPath
    ) -> UICollectionReusableView? {
        switch self {
        case .main(_, _), .card(_):
            // SectionDescriptor에 유효한 내용(title)이 없을 경우 헤더는 표시되지 않음
            return collectionView.dequeueConfiguredReusableSupplementary(
                using: defaultHeaderRegistration,
                for: indexPath
            )
        default:
            return nil
        }
    }
}

@MainActor
extension TodayContent.Section {
    
    /// 섹션 유형에 따라 적절한 `NSCollectionLayoutSection`을 생성합니다.
    ///
    /// 이 메서드는 `UICollectionViewCompositionalLayout` 구성 시 각 섹션(`Section` 열거형)에 맞는 레이아웃을 반환합니다.
    /// 내부적으로 `mostTop`, `mostBottom`, `main`, `card`에 대해 각각 별도의 레이아웃 빌더 함수를 호출합니다.
    ///
    /// - Parameter environment: 현재 레이아웃 환경 정보로, 사이즈 클래스 및 디바이스 환경 등을 포함합니다.
    /// - Returns: 현재 섹션에 해당하는 `NSCollectionLayoutSection` 인스턴스입니다.
    func buildLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
        case .mostTop:
            return buildMostTopLayout(environment)

        case let .main(_, ratio):
            switch environment.traitCollection.userInterfaceIdiom {
            case .phone:
                return buildMainLayout(environment)
            case .pad:
                // 아이패드 환경에서는 반드시 왼쪽과 오른쪽 셀의 너비 비율(`leftRatio`, `rightRatio`)이 지정되어야 합니다.
                return buildMainLayoutForPad(environment, leftRatio: ratio.left, rightRatio: ratio.right)
            default:
                return buildMainLayout(environment)
            }

        case .card:
            return buildCardLayout(environment)

        case .mostBottom:
            switch environment.traitCollection.userInterfaceIdiom {
            case .phone:
                return buildMostBottomLayout(environment)
            case .pad:
                return buildMostBottomLayoutForPad(environment)
            default:
                return buildMostBottomLayout(environment)
            }
        }
    }
    
    private func buildMostTopLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(44)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18)
        return section
    }

    private func buildMainLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(450)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(450)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18)
        injectSupplementaryViewIfNeeded(to: section)
        return section
    }

    /// - Important: 아이패드에서는 한 섹션에 최대 2개의 셀만 표시되며,
    ///              각 셀의 너비는 지정된 비율에 따라 섹션 너비를 기준으로 계산됩니다.
    private func buildMainLayoutForPad(
        _ environment: NSCollectionLayoutEnvironment,
        leftRatio: CGFloat,
        rightRatio: CGFloat
    ) -> NSCollectionLayoutSection {
        let leftItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(leftRatio),
            heightDimension: .estimated(450)
        )
        let leftItem = NSCollectionLayoutItem(layoutSize: leftItemSize)

        let rightItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(rightRatio),
            heightDimension: .estimated(450)
        )
        let rightItem = NSCollectionLayoutItem(layoutSize: rightItemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(450)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [leftItem, rightItem])
        group.interItemSpacing = .fixed(16)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18)
        injectSupplementaryViewIfNeeded(to: section)
        return section
    }

    private func buildCardLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(250)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(16)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18)
        injectSupplementaryViewIfNeeded(to: section)
        return section
    }

    private func buildMostBottomLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(44)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18)
        return section
    }

    private func buildMostBottomLayoutForPad(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(44)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let horizontalInset = environment.container.contentSize.width / 4
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: horizontalInset, bottom: 0, trailing: horizontalInset)
        return section
    }
}

@MainActor
extension TodayContent.Section {

    private func injectSupplementaryViewIfNeeded(to section: NSCollectionLayoutSection) {
        switch self {
        case .main(_, _), .card(_):
            // SectionDescriptor에 유효한 내용(title)이 없을 경우 헤더는 표시되지 않음
            if hasHeader {
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(44)
                )
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.boundarySupplementaryItems = [header]
            }
        default:
            return
        }
    }
}
