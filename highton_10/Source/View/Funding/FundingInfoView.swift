//
//  FundingInfoView.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import SwiftUI

struct FundingInfoView: View {
    
    @StateObject var viewModel = FundingInfoViewModel()
    @Environment(\.dismiss) private var dismiss
    @State var isPresent: Bool = false
    @State var isPayViewPresent: Bool = false
    @State var check: Bool = false
    @State var payCheck: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ZStack(alignment: .top) {
                    Color.rootStrong.ignoresSafeArea()
                    
                    NavigationBarWhite(
                        title: "펀딩 보기",
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
                            AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIrlxGUMVNqTFn1vNcKKxEzCbT9zFlz32Pfg&s")) { phase in
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
                            Image("Icon")
                            
                            Text("펀딩 금액")
                                .font(.highCallout.font)
                                .foregroundStyle(Color.contentAdditive)
                                .padding(.leading, 8)
                            
                            
                            Text("72,500,000원")
                                .font(.highFootnote.font)
                                .foregroundStyle(Color.contentAssistive)
                                .padding(.leading, 8)
                            
                            Spacer()
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
                    
                    
                    ActionButton(label: "펀딩하기", type: .primary) {
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
                    Text("펀딩하기")
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
                
                HStack(alignment: .center, spacing: 8) {
                    if check {
                        Image("LeadingArea")
                            .onTapGesture {
                                check.toggle()
                            }
                    } else {
                        Image("falseIcon")
                            .onTapGesture {
                                check.toggle()
                            }
                    }
                    VStack(alignment:.leading, spacing: 2) {

                        
                        HStack {
                        Text("700명 이상이 선택했어요")
                            .font(.highFootnote.font)
                            .foregroundStyle(Color.contentAssistive)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                        HStack {
                        Text("스탠딩 검정치마 구역")
                            .font(.highBody.font)
                            .foregroundStyle(Color.contentBase)
                            .multilineTextAlignment(.leading)
                    Spacer()
                }
                        
                        
                        Text("170,000원 \nSONGS TO BRING YOU HOME 콘서트 티켓\n(단, 공연 일자는 랜덤)\n앵콜 곡을 선택할 수 있는 특권")
                            .font(.highFootnote.font)
                            .foregroundStyle(Color.contentAdditive)
                    }
                    .padding(.vertical, 10)
                    
                    Spacer()

                    Image("reco")
                }
                .padding(.horizontal, 16)

                HStack(alignment: .center, spacing: 8) {
                    Image("falseIcon")

                    VStack(alignment:.leading, spacing: 2) {
                        HStack {
                        Text("500명 이상이 선택했어요")
                            .font(.highFootnote.font)
                            .foregroundStyle(Color.contentAssistive)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                        
                        
                        HStack {
                        Text("지정석 1층 구역")
                            .font(.highBody.font)
                            .foregroundStyle(Color.contentBase)
                            .multilineTextAlignment(.leading)
                        
                    Spacer()
                }
                        
                        Text("140,000원\nSONGS TO BRING YOU HOME 콘서트 티켓\n(단, 공연 일자는 랜덤)")
                            .font(.highFootnote.font)
                            .foregroundStyle(Color.contentAdditive)
                    }
                    .padding(.vertical, 10)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 16)
                
                HStack(alignment: .center, spacing: 8) {
                        Image("falseIcon")
                    VStack(alignment:.leading, spacing: 2) {
                        HStack {
                            
                            Text("400명 이상이 선택했어요")
                                .font(.highFootnote.font)
                                .foregroundStyle(Color.contentAssistive)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        HStack {
                        Text("지정석 2층 구역")
                            .font(.highBody.font)
                            .foregroundStyle(Color.contentBase)
                            .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        
                        Text("140,000원\nSONGS TO BRING YOU HOME 콘서트 티켓\n(단, 공연 일자는 랜덤)")
                            .font(.highFootnote.font)
                            .foregroundStyle(Color.contentAdditive)
                    }
                    .padding(.vertical, 10)
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                HStack(alignment: .center, spacing: 8) {
                    Image("falseIcon")
                    VStack(alignment:.leading, spacing: 2) {
                    HStack {
                        Text("100명 이상이 선택했어요")
                            .font(.highFootnote.font)
                            .foregroundStyle(Color.contentAssistive)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    HStack {

                    Text("지정석 2층 구역")
                        .font(.highBody.font)
                        .foregroundStyle(Color.contentBase)
                        .multilineTextAlignment(.leading)
                    
                Spacer()
            }
                    
                    Text("75,000원\nSONGS TO BRING YOU HOME 콘서트 티켓\n(단, 공연 일자는 랜덤)")
                        .font(.highFootnote.font)
                        .foregroundStyle(Color.contentAdditive)
                }
                .padding(.vertical, 10)
                    
                Spacer()
                
            }
            .padding(.horizontal, 16)
                if check {
                    ActionButton(label: "펀딩 진행하기", type: .primary) {
                        isPayViewPresent = true
                    }
                    .padding(.horizontal, 16)
                    .frame(height: 56, alignment: .bottom)
                    .padding(.top, 150)
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
                                    payCheck.toggle()
                                } label: {
                                    if payCheck {
                                        Image("Control")
                                    } else {
                                        Image("DisableControl")
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            
                            Spacer()
                            
                            if payCheck {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    ActionButton(label: "170,000원 결제하기", type: .primary) {
                                        isPayViewPresent = false
                                        isPresent = false
                                        dismiss()
                                    }
                                    .padding(.horizontal, 16)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(.top, 90)
                                }
                            }
                            Spacer()
                        }
                        .presentationDetents([.height(300)])
                        .background(Color.rootStrong)
                        
                    }
                }
                
            }
            .background(Color.fillStatic)
        }
    }
}

#Preview {
    GroupPurchaseInfoView()
}
