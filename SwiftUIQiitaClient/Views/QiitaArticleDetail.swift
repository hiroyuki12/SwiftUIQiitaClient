//
//  QiitaArticleDetail.swift
//  SwiftUIQiitaClient
//
//  Created by 伊藤凌也 on 2019/06/07.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct QiitaArticleDetail : View {
    let articleURL: URL
    var body: some View {
        WebView(url: articleURL)
    }
}

#if DEBUG
struct QiitaArticleDetail_Previews : PreviewProvider {
    static var previews: some View {
        QiitaArticleDetail(articleURL: URL(string: "https://qiita.com")!)
    }
}
#endif
