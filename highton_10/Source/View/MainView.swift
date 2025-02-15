//
//  MainView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        HighTabView {
            GroupPurchaseView()
                .highTabItem("공구", Image("handshake"))
            ContentView()
                .highTabItem("거래", Image("storefront"))
            ContentView()
                .highTabItem("펀딩", Image("savings"))
            ContentView()
                .highTabItem("프로필", Image("person"))
        }
    }
}

#Preview {
    MainView()
}
