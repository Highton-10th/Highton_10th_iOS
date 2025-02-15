//
//  GroupPurchaseInfoView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct GroupPurchaseInfoView: View {
    
    @StateObject var viewModel = GroupPurchaseInfoViewModel()
    @Namespace var image
    
    var body: some View {
        NavigationStack {
        ZStack(alignment: .top) {
            Color.rootStrong.ignoresSafeArea()
            NavigationBarWhite(
                title: "공동구매 보기",
                leadingView: {
                    AnyView(
                        Image("arrow_back_ios")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.contentAssistive)
                    )
                }, trailingPrimaryView:  {
                    AnyView(
                        Image("ios_share")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.contentAssistive)
                    )
                }, trailingSecondView: {
                    AnyView(
                        Image("more_vert")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.contentAssistive)
                    )
                }
            )
            .padding(.top, 54)

            ScrollView {
                VStack {
                    AsyncImage(
                        url: URL(string: viewModel.imageUrl)
                    ) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: viewModel.imageUrl, in: self.image)
                    } placeholder: {
                        Rectangle()
                            .foregroundStyle(Color.gray)
                    }
                    .frame(width: 402, height: 402)
                }
            }
        }
        .ignoresSafeArea(.all)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GroupPurchaseInfoView()
}
