//
//  QiitaAPIClient.swift
//  SwiftUIQiitaClient
//
//  Created by 伊藤凌也 on 2019/06/07.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import Foundation
import Combine

final class QiitaAPIClient {
    
    /// QiitaAPI v2 記事一覧検索
    /// https://qiita.com/api/v2/docs#get-apiv2items
    ///
    /// - Parameters:
    ///     - page: 何ページ分か, default=1
    ///     - perPage: 1ページごとの記事数, default=20
    /// - Returns:
    ///     検索結果Publisher
    static func fetchArticles(page: Int = 1, perPage: Int = 20) -> AnyPublisher<[QiitaData.Article], Error> {
        
        var components = URLComponents(string: "https://qiita.com/api/v2/tags/swift/items")!
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "perPage", value: "\(perPage)"),
        ]
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        var request = URLRequest(url: components.url!)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [QiitaData.Article].self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
