//
//  PurchaseViewModel.swift
//  highton_10
//
//  Created by 서지완 on 2/15/25.
//

import Foundation
import Moya

public final class PurchaseViewModel: ObservableObject {
    @Published var purchaseList: [PurchaseListResponse] = []
    @Published var purchaseView: PurchaseViewResponse?

    private let provider = MoyaProvider<PurchaseAPI>()

    func getPurchaseList(completion: @escaping (Bool) -> Void) {
        provider.request(.getPurchaseList(search: "")) { [weak self] result in
            print("요청 전달")

            switch result {
            case .success(let response):
                print("응답 상태 코드: \(response.statusCode)")
                if let responseBody = String(data: response.data, encoding: .utf8) {
                    print("응답 본문: \(responseBody)")
                }

                if (200...299).contains(response.statusCode) {
                    do {
                        let decodedResponse = try JSONDecoder().decode([PurchaseListResponse].self, from: response.data)
                        DispatchQueue.main.async {
                            self?.purchaseList = decodedResponse
                            print("구매 목록이 성공적으로 파싱되었습니다.")
                            completion(true)
                        }
                    } catch {
                        print("데이터 파싱 오류: \(error.localizedDescription)")
                        DispatchQueue.main.async {
                            completion(false)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(false)
                    }
                }
            case .failure(let error):
                print("네트워크 오류: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }

    func getPurchaseView(completion: @escaping (Bool) -> Void) {
        provider.request(.purchaseView(id: "1")) { [weak self] result in
            print("요청 전달")

            switch result {
            case .success(let response):
                print("응답 상태 코드: \(response.statusCode)")
                if let responseBody = String(data: response.data, encoding: .utf8) {
                    print("응답 본문: \(responseBody)")
                }

                if (200...299).contains(response.statusCode) {
                    do {
                        let decodedResponse = try JSONDecoder().decode(PurchaseViewResponse.self, from: response.data)
                        DispatchQueue.main.async {
                            self?.purchaseView = decodedResponse
                            print("구매 목록이 성공적으로 파싱되었습니다.")
                            completion(true)
                        }
                    } catch {
                        print("데이터 파싱 오류: \(error.localizedDescription)")
                        DispatchQueue.main.async {
                            completion(false)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(false)
                    }
                }
            case .failure(let error):
                print("네트워크 오류: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }
}
