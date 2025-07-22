//
//  TodayViewController.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class TodayViewController: CoreViewController {
    
    typealias TodayDataSource = UICollectionViewDiffableDataSource<TodayContent.Section, TodayContent.Item>
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: TodayDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        applySnapshot()
    }
    
    override func setupAttribues() {
        collectionView.delegate = self
        collectionView.collectionViewLayout = createCollectionViewLayout()
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, environment in
            guard let section = self?.dataSource.sectionIdentifier(for: sectionIndex)
            else { return nil }
            
            return section.buildLayout(environment)
        }
        
        layout.configuration.interSectionSpacing = 16
        return layout
    }
    
    private func setupDataSource() {
        let advertisementCellRegistration = createAdvertisementCellRegistration()
        let storyCellRegistration = createStoryCellRegistration()
        let topListCellRegistration = createAppListCellRegistration()
        let promotionCellRegistration = createPromotionCellRegistration()
        let cardCellRegistration = createCardCellRegistration()
        let bigCardCellRegistration = createBigCardCellRegistration()
        let headerViewRegistration = createDefaultHeaderViewRegistration()
        
        dataSource = TodayDataSource(collectionView: collectionView) {
            collectionView, indexPath, item in
            item.dequeueReusableCollectionViewCell(
                collectionView: collectionView,
                advertisementCellRegistration: advertisementCellRegistration,
                storyCellRegistration: storyCellRegistration,
                topListCellRegistration: topListCellRegistration,
                promotionCellRegistration: promotionCellRegistration,
                cardCellRegistration: cardCellRegistration,
                bigCardCellRegistration: bigCardCellRegistration,
                indexPath: indexPath
            )
        }
        
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let section = self?.dataSource.sectionIdentifier(for: indexPath.section)
            else { return nil }
            
            return section.dequeueCollectionReusableView(
                collectionView: collectionView,
                defaultHeaderRegistration: headerViewRegistration,
                indexPath: indexPath
            )
        }
    }
    
    private func createAdvertisementCellRegistration() -> UICollectionView.CellRegistration<AdvertisementCollectionViewCell, Advertisement> {
        UICollectionView.CellRegistration<AdvertisementCollectionViewCell, Advertisement>(cellNib: AdvertisementCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createStoryCellRegistration() -> UICollectionView.CellRegistration<StoryCollectionViewCell, AppStory> {
        UICollectionView.CellRegistration<StoryCollectionViewCell, AppStory>(cellNib: StoryCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createAppListCellRegistration() -> UICollectionView.CellRegistration<TopListCollectionViewCell, PopularTopList> {
        UICollectionView.CellRegistration<TopListCollectionViewCell, PopularTopList>(cellNib: TopListCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createPromotionCellRegistration() -> UICollectionView.CellRegistration<PromotionCollectionViewCell, PopularTopList> {
        UICollectionView.CellRegistration<PromotionCollectionViewCell, PopularTopList>(cellNib: PromotionCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createCardCellRegistration() -> UICollectionView.CellRegistration<CardCollectionViewCell, [CategoryCard]> {
        UICollectionView.CellRegistration<CardCollectionViewCell, [CategoryCard]>(cellNib: CardCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createBigCardCellRegistration() -> UICollectionView.CellRegistration<BigCardCollectionViewCell, CategoryCard> {
        UICollectionView.CellRegistration<BigCardCollectionViewCell, CategoryCard>(cellNib: BigCardCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createDefaultHeaderViewRegistration() -> UICollectionView.SupplementaryRegistration<UICollectionViewListCell> {
        UICollectionView.SupplementaryRegistration(
            elementKind: UICollectionView.elementKindSectionHeader
        ) { [weak self] supplementaryView, elementKind, indexPath in
            guard let section = self?.dataSource.sectionIdentifier(for: indexPath.section)
            else { return }

            if case .main(let descriptor) = section {
                supplementaryView.configure(with: descriptor)
            }

            // TODO: - configure supplementaryView depending on sectionDescriptor..
        }
    }

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<TodayContent.Section, TodayContent.Item>()
//        snapshot.appendSections([.main(.aHealthierMe)])
//        snapshot.appendItems([.story(.angryBirdsBounceStory), .advertisement(.temuAdvertisement)], toSection: .main(.aHealthierMe))

        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension TodayViewController: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
    }
}

// 아이폰 환경 기준으로 셀 구현 전략
// - 제일 위에 topBar를 올리고,
// - 그 아래 main 섹션에 여러 타입의 셀(advertisement, story 등)을 올리고,
// - 필요하다면 main 섹션이 여러개가 될 수 있으며, 각 mainSection은 id로 구분

// - main 섹션에 sectionProvider 속 값에 따라
// - 헤더를 띄울지, 말지 / 싱글라인 헤더를 띄울지 / 더블라인 헤더를 띄울지 결정
// - SupplementaryProvider에서 section 정보를 분석해 UICollectionViewListCell의 extension 함수를 호출해서 셀 구성


// - 섹션, 섹션 속 항목 등 모두 아우르는 전체 목 데이터 만들기 -> TodayContent.Section과 TodayContent.Item 활용


// 아이패드 환경 기준으로 셀 구현 전략
// - 아이폰과 섹션을 최대한 비슷하게 가져가고 / 레이아웃은 완전히 다르게 짜야할듯


// 집에 가서 할일
// - 모델이 올바른지 검증 + 이름 바꾸기(~Response) + 목 데이터 만들기 (부분 데이터만) ✅
// - HeaderView에 들어갈 extension 코드 구현 ✅
// - 각 셀이 임시 데이터 넣기 + 레이아웃이 의도대로 잘 반영되는지 검사 (섹션이 있고 없고 등에서)
// - TopBarCell, AppInfoCell UI 구현 + CardCell UI 구현
