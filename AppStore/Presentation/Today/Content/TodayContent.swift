//
//  TodayContent.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

enum TodayContent {

    enum Section: Hashable {
        ///
        case mostTop
        ///
        case main(SectionDescriptor)
        ///
        case card(SectionDescriptor)
        ///
        case mostBottom

        /// <#Description#>
        var hasHeader: Bool {
            switch self {
            case .mostTop, .mostBottom: return false
            case .main(let descriptor): return descriptor.title != nil
            case .card(let descriptor): return descriptor.title != nil
            }
        }
    }

    enum Item: Hashable {
        ///
        case advertisement(Advertisement)
        ///
        case story(AppStory)
        ///
        case topList(PopularTopList)
        ///
        case promotion(PopularTopList)
        ///
        case card(CategoryCard)
        ///
        case bigCard(CategoryCard)
    }
}

@MainActor
extension TodayContent.Item {

    func dequeueReusableCollectionViewCell(
        collectionView: UICollectionView,
        advertisementCellRegistration: UICollectionView.CellRegistration<AdvertisementCollectionViewCell, Advertisement>,
        storyCellRegistration: UICollectionView.CellRegistration<StoryCollectionViewCell, AppStory>,
        topListCellRegistration: UICollectionView.CellRegistration<TopListCollectionViewCell, PopularTopList>,
        promotionCellRegistration: UICollectionView.CellRegistration<PromotionCollectionViewCell, PopularTopList>,
        cardCellRegistration: UICollectionView.CellRegistration<CardCollectionViewCell, CategoryCard>,
        bigCardCellRegistration: UICollectionView.CellRegistration<BigCardCollectionViewCell, CategoryCard>,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch self {
        case .advertisement(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: advertisementCellRegistration,
                for: indexPath,
                item: content
            )
        case .story(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: storyCellRegistration,
                for: indexPath,
                item: content
            )
        case .topList(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: topListCellRegistration,
                for: indexPath,
                item: content
            )
        case .promotion(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: topListCellRegistration,
                for: indexPath,
                item: content
            )
        case .card(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: cardCellRegistration,
                for: indexPath,
                item: content
            )
        case .bigCard(let content):
            return collectionView.dequeueConfiguredReusableCell(
                using: bigCardCellRegistration,
                for: indexPath,
                item: content
            )
        }
    }
}

@MainActor
extension TodayContent.Section {

    /// <#description#>
    ///
    /// - Important: 기본적으로 모든 섹션에 헤더를 표시하지만,
    /// SectionDescriptor에 유효한 내용(title)이 없을 경우 헤더는 표시되지 않음
    ///
    /// - Note: 이 함수는 `UICollectionReusableView`가 아닌 `UICollectionViewListCell` 타입을 반환함에 주의
    func dequeueCollectionReusableView(
        collectionView: UICollectionView,
        defaultHeaderRegistration: UICollectionView.SupplementaryRegistration<UICollectionViewListCell>,
        indexPath: IndexPath
    ) -> UICollectionReusableView? {
        switch self {
        case .main(_), .card(_):
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
    
    /// <#Description#>
    /// - Parameter environment: <#environment description#>
    /// - Returns: <#description#>
    func buildLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
        case .mostTop, .mostBottom: return buildTopBottomLayout(environment)
        case .main: return buildMainLayout(environment)
        case .card: return buildCardLayout(environment)
        }
    }
    
    private func buildTopBottomLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(100)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    private func buildMainLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        injectSupplementaryViewIfNeeded(to: section)
        return section
    }
    
    private func buildCardLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalWidth(0.5)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        injectSupplementaryViewIfNeeded(to: section)
        return section
    }
    
    private func injectSupplementaryViewIfNeeded(to section: NSCollectionLayoutSection) {
        switch self {
        case .main(_), .card(_):
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
