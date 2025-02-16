//
//  GroupPurchaseInfoView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct GroupPurchaseInfoView: View {
    
    @StateObject var viewModel = GroupPurchaseInfoViewModel()
    @Environment(\.dismiss) private var dismiss
    @State var isPresent: Bool = false
    @State var isPayViewPresent: Bool = false
    @State var check: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ZStack(alignment: .top) {
                    Color.rootStrong.ignoresSafeArea()
                    
                    NavigationBarWhite(
                        title: "공동구매 보기",
                        leadingView: {
                            AnyView(
                                Button {
                                    dismiss()
                                } label: {
                                    Image("arrow_back_ios")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(Color.contentAssistive)
                                }
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
                    .padding(.top, 62)
                    .background(.clear)
                    .zIndex(1)
                    
                    ScrollView {
                        VStack {
                            AsyncImage(url: URL(string: viewModel.imageUrl)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 402, height: 402)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 402, height: 402)
                                        .overlay {
                                            Color.dimRegular
                                        }
                                case .failure(let error):
                                    Text("Error: \(error.localizedDescription)")
                                        .frame(width: 402, height: 402)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                        
                        FeedHeader(profileImage: viewModel.userInfo.header.profileImage, name: viewModel.userInfo.header.nickname, title: "인증된 유저")
                        
                        FeedFoot(
                            title: viewModel.userInfo.foot.title,
                            description: viewModel.userInfo.foot.description, // 빈 값
                            percent: viewModel.userInfo.foot.percent,
                            startDate: viewModel.userInfo.foot.startDate,
                            endDate: viewModel.userInfo.foot.endDate
                        )
                        HStack {
                            Text("\(viewModel.userInfo.participationPeople)이 참여했어요")
                                .font(.highCallout.font)
                                .foregroundStyle(Color.contentAssistive)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        
                        HStack {
                            FeedHeader(profileImage: viewModel.userInfo.relate.profileImage, name: viewModel.userInfo.relate.nickname, title: "관련 아티스트")
                            Image("chevron_right")
                        }
                        
                        
                        HighDivider(type: .wide)
                        
                        HStack {
                            Text("공동구매 물품")
                                .font(.highCallout.font)
                                .foregroundStyle(Color.contentAdditive)
                            
                            Spacer()
                            
                            Text("\(viewModel.userInfo.items.count)개의 물품")
                                .font(.highFootnote.font)
                                .foregroundStyle(Color.contentAssistive)
                        }
                        .padding(.horizontal, 16)

                        ForEach(viewModel.userInfo.items.indices, id: \.self) { item in
                            HStack {
                                AsyncImage(
                                    url: URL(string: viewModel.userInfo.items[item].imageURL)
                                ) { image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    Rectangle()
                                        .foregroundStyle(Color.gray)
                                }
                                .cornerRadius(.radius8)
                                .frame(width: 40, height: 40)
                                .padding(.vertical, 10)
                                
                                Text(viewModel.userInfo.items[item].nickname)
                                    .font(.highBody.font)
                                    .foregroundStyle(Color.contentBase)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea(.all)
            }
            
            ZStack {
                Rectangle()
                    .foregroundStyle(Color.fillStatic)
                    .frame(height: 88)
                    .frame(maxWidth: .infinity)
                
                HStack {
                    Rectangle()
                        .foregroundStyle(Color.fillRegular)
                        .overlay {
                            Image("favorite")
                                .foregroundStyle(Color.contentDisabled)
                        }
                        .cornerRadius(.radius12)
                        .frame(width: 56, height: 56)
                    
                    
                    ActionButton(label: "참여하기", type: .primary) {
                        isPresent = true
                    }
                }
                .padding(.horizontal, 16)
                .background(Color.fillStatic)
            }
            .padding(.bottom, 60)
            .background(Color.fillStatic)

        }
        .background(Color.fillStatic)
        .sheet(isPresented: $isPresent) {
            ScrollView {
                HStack {
                    Text("공동구매 참여")
                        .font(.highTitle.font)
                        .foregroundStyle(Color.contentBase)
                    
                    Spacer()
                    
                    Button {
                        isPresent = false
                    } label: {
                        Image("close")
                            .foregroundStyle(Color.contentAssistive)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 13)
                
                
                HStack {
                    Text("물품 선택하기")
                        .font(.highSubhead.font)
                        .foregroundStyle(Color.contentAdditive)
                    Spacer()
                    Text("구매하고 싶은 물품을 모두 선택해주세요")
                        .font(.highCallout.font)
                        .foregroundStyle(Color.contentAssistive)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                
                ForEach(viewModel.info.indices, id: \.self) { index in
                    HStack(spacing: 12) {
                        AsyncImage(url: URL(string: viewModel.info[index].profileImage)) { image in
                            image
                                .resizable()
                        } placeholder: {
                            Rectangle()
                                .foregroundStyle(Color.gray)
                        }
                        .cornerRadius(.half)
                        .frame(width: 36, height: 36)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(viewModel.info[index].nickname)
                                .font(.highBody.font)
                                .foregroundStyle(Color.contentBase)
                            
                            Text(viewModel.info[index].price)
                                .font(.highFootnote.font)
                                .foregroundStyle(Color.contentAdditive)
                        }
                        Spacer()
                        
                        Button {
                            viewModel.info[index].check.toggle()
                        } label: {
                            if viewModel.info[index].check {
                                Image("Control")
                            } else {
                                Image("DisableControl")
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    
                    
                }
                
                Spacer()
                
                ActionButton(label: "공동구매 진행하기", type: .primary) {
                    isPayViewPresent = true
                }
                .padding(.horizontal, 16)
                .frame(height: 56, alignment: .bottom)
                
                ActionButton(label: "2월 27일까지 인원 모집 후 일괄로 결제됩니다", type: .sub) {
                    
                }
                .sheet(isPresented: $isPayViewPresent) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("결제하기")
                                .font(.highTitle.font)
                                .foregroundStyle(Color.contentBase)
                            Spacer()
                            Button {
                                isPayViewPresent = false
                            } label: {
                                Image("close")
                                    .foregroundStyle(Color.contentAssistive)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 13)
                        
                        HStack {
                            Text("결제수단 선택")
                                .font(.highSubhead.font)
                                .foregroundStyle(Color.contentAdditive)
                            Spacer()
                            
                            Image("add")
                                .foregroundStyle(Color.contentAssistive)
                            Text("결제수단 추가")
                                .foregroundStyle(Color.contentAssistive)
                        }
                        .padding(.horizontal, 16)
                        
                        HStack {
                            Image("Payment")
                                
                            
                            VStack {
                                Text("토스뱅크카드")
                                    .font(.highBody.font)
                                    .foregroundStyle(Color.contentBase)
                                
                                Text("9490-13**")
                                    .font(.highFootnote.font)
                                    .foregroundStyle(Color.contentAdditive)
                            }
                            .padding(.leading, 14)
                            Spacer()
                            Button {
                                check.toggle()
                            } label: {
                                if check {
                                    Image("Control")
                                } else {
                                    Image("DisableControl")
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        
                        Spacer()
                        
                        if check {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                ActionButton(label: "16,200원 결제하기", type: .primary) {
                                    isPayViewPresent = false
                                    isPresent = false
                                    dismiss()
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                        Spacer()
                    }
                    .presentationDetents([.height(300)])
                    .background(Color.rootStrong)

                }
                
            }
            .background(Color.fillStatic)

        }
    }
}

#Preview {
    GroupPurchaseInfoView()
}
