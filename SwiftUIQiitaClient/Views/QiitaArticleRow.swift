//
//  QiitaArticleRow.swift
//  SwiftUIQiitaClient
//
//  Created by 伊藤凌也 on 2019/06/07.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct QiitaArticleRow : View {
    @ObservedObject var viewModel: QiitaArticleListViewModel
    
    let article: QiitaData.Article
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { 
//                Image(systemName: "book")
//                    .imageScale(.medium)
//                    .foregroundColor(Color.green)
                Text(article.title)
//                    .bold()
                    .fontWeight(Font.Weight.light)
                    .lineLimit(3)
            }
//            .layoutPriority(1)
            
            HStack {
//                Image(systemName: "heart.fill")
//                    .imageScale(.small)
//                    .foregroundColor(Color.red)
//                Text(("\(article.reactionsCount)"))
//                    .font(.subheadline)
//                Spacer()
                Text("\(article.createdAt)")
                    .font(.caption)
                    .foregroundColor(.yellow)
                    .fontWeight(Font.Weight.light)
                
                Text("by @\(article.user.id)")
                    .font(.caption)
                    .foregroundColor(.yellow)
                    .fontWeight(Font.Weight.light)
            }
      
            HStack {
                Text("\(article.likesCount)")
                    .font(.caption)
                    .foregroundColor(.yellow)
                    .fontWeight(Font.Weight.light)
                
                Text("likes")
                    .font(.caption)
                    .foregroundColor(.yellow)
                    .fontWeight(Font.Weight.light)
                }
        }
    }
}

#if DEBUG
struct QiitaArticleRow_Previews : PreviewProvider {
    static var previews: some View {
        QiitaArticleRow(viewModel: QiitaArticleListViewModel(), article: QiitaArticleListViewModel().articles[0])
    }
}
#endif
