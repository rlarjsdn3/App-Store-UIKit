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
    
    override func setupAttribute() {
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        collectionView.collectionViewLayout = createCollectionViewLayout()
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { [weak self] sectionIndex, environment in
            guard let section = self?.dataSource.sectionIdentifier(for: sectionIndex)
            else { return nil }
            
            return section.buildLayout(environment)
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
    }
    
    private func setupDataSource() {
        let topBarCellRegistration = createProfileHeaderCellRegistration()
        let advertisementCellRegistration = createAppAdBannerCellRegistration()
        let storyCellRegistration = createAppStoryCellRegistration()
        let topListCellRegistration = createPopularTopListCellRegistration()
        let promotionCellRegistration = createAppGroupPromotionCellRegistration()
        let cardCellRegistration = createCategoryCardCellRegistration()
        let bigCardCellRegistration = createMessageCardCellRegistration()
        let termsOfUseCellRegistration = createTermsOfUseCellRegistration()
        let headerViewRegistration = createDefaultHeaderViewRegistration()
        
        dataSource = TodayDataSource(collectionView: collectionView) {
            collectionView, indexPath, item in
            item.dequeueReusableCollectionViewCell(
                collectionView: collectionView,
                profileHeaderCellRegistration: topBarCellRegistration,
                appAdBannerCellRegistration: advertisementCellRegistration,
                appStoryCellRegistration: storyCellRegistration,
                popularTopListCellRegistration: topListCellRegistration,
                appGroupPromotionCellRegistration: promotionCellRegistration,
                categoryCardCellRegistration: cardCellRegistration,
                messageCardCellRegistration: bigCardCellRegistration,
                termsOfUseCellRegistration: termsOfUseCellRegistration,
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
    
    private func createProfileHeaderCellRegistration() -> UICollectionView.CellRegistration<ProfileHeaderCell, Void> {
        UICollectionView.CellRegistration(cellNib: ProfileHeaderCell.nib) { cell, indexPath, _ in
        }
    }
    
    private func createAppAdBannerCellRegistration() -> UICollectionView.CellRegistration<AppAdBannerCollectionViewCell, AppAdBanner> {
        UICollectionView.CellRegistration<AppAdBannerCollectionViewCell, AppAdBanner>(cellNib: AppAdBannerCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createAppStoryCellRegistration() -> UICollectionView.CellRegistration<AppStoryCollectionViewCell, AppStory> {
        UICollectionView.CellRegistration<AppStoryCollectionViewCell, AppStory>(cellNib: AppStoryCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createPopularTopListCellRegistration() -> UICollectionView.CellRegistration<PopularTopListCollectionViewCell, PopularTopList> {
        UICollectionView.CellRegistration<PopularTopListCollectionViewCell, PopularTopList>(cellNib: PopularTopListCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createAppGroupPromotionCellRegistration() -> UICollectionView.CellRegistration<AppGroupPromotionCollectionViewCell, PopularTopList> {
        UICollectionView.CellRegistration<AppGroupPromotionCollectionViewCell, PopularTopList>(cellNib: AppGroupPromotionCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createCategoryCardCellRegistration() -> UICollectionView.CellRegistration<CategoryCardColelctionViewCell, CategoryCard> {
        UICollectionView.CellRegistration<CategoryCardColelctionViewCell, CategoryCard>(cellNib: CategoryCardColelctionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createMessageCardCellRegistration() -> UICollectionView.CellRegistration<MessageCardCollectionViewCell, CategoryCard> {
        UICollectionView.CellRegistration<MessageCardCollectionViewCell, CategoryCard>(cellNib: MessageCardCollectionViewCell.nib) { cell, indexPath, content in
            cell.configure(with: content)
        }
    }
    
    private func createTermsOfUseCellRegistration() -> UICollectionView.CellRegistration<TermsOfUseCollectionViewCell, Void> {
        UICollectionView.CellRegistration<TermsOfUseCollectionViewCell, Void>(cellNib: TermsOfUseCollectionViewCell.nib) { cell, indexPath, _ in
        }
    }
    
    private func createDefaultHeaderViewRegistration() -> UICollectionView.SupplementaryRegistration<UICollectionViewListCell> {
        UICollectionView.SupplementaryRegistration(
            elementKind: UICollectionView.elementKindSectionHeader
        ) { [weak self] supplementaryView, elementKind, indexPath in
            guard let section = self?.dataSource.sectionIdentifier(for: indexPath.section)
            else { return }

           switch section {
           case .main(let descriptor), .card(let descriptor):
                supplementaryView.configure(with: descriptor)
           default:
               return
            }
        }
    }

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<TodayContent.Section, TodayContent.Item>()
        snapshot.appendSections([.mostTop])
        snapshot.appendItems([.topBar], toSection: .mostTop)
        appData.todays.forEach { today in
            snapshot.appendSections([today.section])
            snapshot.appendItems(today.items, toSection: today.section)
        }
        // TODO: - add 'exchange redeem code' button cell at most below..
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

//     - [ ] TopBarCell✅, AppDisplayInfo UI 코드 구현
//     - [ ] AdvertisementCell, BigCardCell✅, CardCell✅ UI 코드 구현
//     - [ ] PromotionCollectionViewCell✅ UI 코드 구현
//     - [ ] TopBarCell을 상단에 올리기 (넣기)✅
//     - [ ] 전체적인 레이아웃 조정하기 (수치값 등)
//     - [ ] (시간이 되면) 하단 버튼 셀 UI도 구현
