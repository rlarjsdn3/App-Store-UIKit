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
        case main(SectionDescriptor)
    }

    enum Item: Hashable {
        ///
        case advertisement(Advertisement.Result)
        ///
        case story(Story.Result)
        ///
        case applist(AppList.Result)
        ///
        case card([Card.Result])
        ///
        case bigCard(Card.Result )
    }
}

extension TodayContent.Item {

    func dequeueReusableCollectionViewCell(
        collectionView: UICollectionView,
        advertisementCellRegistration: UICollectionView.CellRegistration<AdvertisementCollectionViewCell, Advertisement.Result>,
        stroyCellRegistration: UICollectionView.CellRegistration<StoryCollectionViewCell, Story.Result>,
        appListCellRegistration: UICollectionView.CellRegistration<AppListCollectionViewCell, AppList.Result>,
        cardCellRegistration: UICollectionView.CellRegistration<CardCollectionViewCell, [Card.Result]>,
        bigCardCellRegistration: UICollectionView.CellRegistration<BigCardCollectionViewCell, Card.Result>,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch self {
        case .advertisement(let result):
            return collectionView.dequeueConfiguredReusableCell(
                using: advertisementCellRegistration,
                for: indexPath,
                item: result
            )
        case .story(let result):
            return collectionView.dequeueConfiguredReusableCell(
                using: stroyCellRegistration,
                for: indexPath,
                item: result
            )
        case .applist(let result):
            return collectionView.dequeueConfiguredReusableCell(
                using: appListCellRegistration,
                for: indexPath,
                item: result
            )
        case .card(let results):
            return collectionView.dequeueConfiguredReusableCell(
                using: cardCellRegistration,
                for: indexPath,
                item: results
            )
        case .bigCard(let result):
            return collectionView.dequeueConfiguredReusableCell(
                using: bigCardCellRegistration,
                for: indexPath,
                item: result
            )
        }
    }

    func dequeueCollectionReusableView(
        collectionView: UICollectionView,
        kind: String,
        indexPath: IndexPath
    ) -> UICollectionReusableView {
        // 기본적으로 모든 섹션에 헤더를 표시하지만,
        // SectionDescriptor에 유효한 내용(title)이 없을 경우 헤더는 표시되지 않음
        return collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: MainReusableCollectionView.id,
            for: indexPath
        )
    }
}

extension TodayContent.Section {

    func buildLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
        case .main: return buildMainLayout(environment)
        }
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
        return section
    }
}
