//
//  QiitaArticleList.swift
//  SwiftUIQiitaClient
//
//  Created by 伊藤凌也 on 2019/06/07.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct QiitaArticleList : View {
    @ObservedObject(initialValue: QiitaArticleListViewModel()) var viewModel: QiitaArticleListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                NavigationLink(destination: QiitaArticleDetail(articleURL: article.url)) {
                    QiitaArticleRow(viewModel: self.viewModel, article: article)
                        .environmentObject(self.viewModel)
                }
            }
            .navigationBarTitle(Text("\"Swift\"の新着記事一覧"))
            .navigationBarItems(trailing: Button(action: {
                // クリックした時のアクション
                self.viewModel.next()
            }){
                // ボタンの文字
                Text("Next")
            })
        }
    }
}

#if DEBUG
struct QiitaArticleList_Previews : PreviewProvider {
    static var previews: some View {
        QiitaArticleList()
    }
}
#endif
