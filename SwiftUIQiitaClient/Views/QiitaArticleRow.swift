//
//  QiitaArticleRow.swift
//  SwiftUIQiitaClient
//
//  Created by 伊藤凌也 on 2019/06/07.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI
import URLImage

struct QiitaArticleRow : View {
    @ObservedObject var viewModel: QiitaArticleListViewModel
    
    let article: QiitaData.Article
    
    var body: some View {
        HStack {
            HStack {
                URLImage(article.user.profileImageUrl!,
                    delay: 0.25,
                    content:  {
                        $0.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    })
                    .frame(width: 60.0, height: 60.0)
            }
            VStack() {
                    
                HStack {
                    Text(article.title)
                        .font(.body)
                        .fontWeight(Font.Weight.light)
                        .lineLimit(3)
                    
                    Spacer()
                }
                
                HStack {
                    Text("\(article.createdAt)")
                        .font(.caption)
                        .foregroundColor(.yellow)
                        .fontWeight(Font.Weight.light)
                    
                    //Text("@\(article.user.id)")
                    //    .font(.caption)
                    //    .foregroundColor(.yellow)
                    //    .fontWeight(Font.Weight.light)
                    
                    Spacer()
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
                    
                    Text("\(article.tags[0].name)")
                        .font(.caption)
                        .foregroundColor(.yellow)
                        .fontWeight(Font.Weight.light)
                    
                    Text(article.tags.count >= 2 ? "\(article.tags[1].name)" : "" )
                        .font(.caption)
                        .foregroundColor(.yellow)
                        .fontWeight(Font.Weight.light)
                        
                    Text(article.tags.count >= 3 ? "\(article.tags[2].name)" : "" )
                        .font(.caption)
                        .foregroundColor(.yellow)
                        .fontWeight(Font.Weight.light)
                            
                    Text(article.tags.count >= 4 ? "\(article.tags[3].name)" : "" )
                        .font(.caption)
                        .foregroundColor(.yellow)
                        .fontWeight(Font.Weight.light)
                    
                    Spacer()
                }
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
