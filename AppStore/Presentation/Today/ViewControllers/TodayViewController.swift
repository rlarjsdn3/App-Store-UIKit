//
//  TodayViewController.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class TodayViewController: CoreViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupHierachy() {

    }

    override func setupAttribues() {

    }

    override func setupAutoLayout() {

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
