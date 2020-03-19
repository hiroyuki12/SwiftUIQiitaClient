//
//  QiitaArticleListViewModel.swift
//  SwiftUIQiitaClient
//
//  Created by 伊藤凌也 on 2019/06/07.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import Combine
import SwiftUI


final class QiitaArticleListViewModel: ObservableObject, Identifiable {
    private var currentPage = 1
    
    private var cancellables: Set<AnyCancellable> = []
    var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()

    
    private(set) var articles: [QiitaData.Article] = [] {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    init() {
        QiitaAPIClient.fetchArticles()
            .sink(receiveCompletion: { fail in
                switch fail {
                case .failure(let e):
                    print(e.localizedDescription)
                case .finished:
                    print("init() finished")
                }
            }) { articles in
                self.articles = articles
            }.store(in: &cancellables)
    }
    
    func next(){
        currentPage = currentPage + 1
        QiitaAPIClient.fetchArticles(page: currentPage, perPage: 10)
            .sink(receiveCompletion: { fail in
                switch fail {
                case .failure(let e):
                    print(e.localizedDescription)
                case .finished:
                    print("next() finished")
                }
            }) { articles in
                self.articles = articles
            }.store(in: &cancellables)
    }
    
    func prev(){
        if(currentPage >= 2)
        {
            currentPage = currentPage - 1
            
            QiitaAPIClient.fetchArticles(page: currentPage, perPage: 10)
                .sink(receiveCompletion: { fail in
                    switch fail {
                    case .failure(let e):
                        print(e.localizedDescription)
                    case .finished:
                        print("prev() finished")
                    }
                }) { articles in
                    self.articles = articles
                }.store(in: &cancellables)
        }
        else
        {
            print("currentPage < 2")
        }
    }
}
