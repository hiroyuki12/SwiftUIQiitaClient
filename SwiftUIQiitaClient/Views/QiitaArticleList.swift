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
    
    @State var isShown = false
    
    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                NavigationLink(destination: QiitaArticleDetail(articleURL: article.url)) {
                    QiitaArticleRow(viewModel: self.viewModel, article: article)
                        .environmentObject(self.viewModel)
                }
            }
            .navigationBarTitle(Text("\"Swift\"の新着記事一覧"))
            .navigationBarItems(leading: Button(action: {
                // クリックした時のアクション
                self.viewModel.prev()
                }
            ){
                // ボタンの文字
                Text("")
            }.actionSheet(isPresented: $isShown, content: {
                ActionSheet(
                    title: Text("Title"),
//                    message: Text("Message"),
                    buttons: [.default(Text("Next Page"), action: {
                        self.viewModel.next(pageCount:1)
                        }),
                        .default(Text("Prev Page"), action: {
                            self.viewModel.prev(pageCount:1)
                        }),
                        .default(Text("Next 5Page"), action: {
                            self.viewModel.next(pageCount:5)
                        }),
                        .default(Text("Prev 5Page"), action: {
                            self.viewModel.prev(pageCount:5)
                        }),
                        .default(Text("Swift page1/10posts"), action: {
                            self.viewModel.home()
                        }),
                        .default(Text("Swift page100/20posts"), action: {
                            self.viewModel.pageMax()
                        }),
                        .cancel()]
                )
            }),
                              
            trailing: Button(action: {
                // クリックした時のアクション
                self.isShown = true
                                    
                //self.viewModel.next()
                }){
                    // ボタンの文字
                    Text("Menu")
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
