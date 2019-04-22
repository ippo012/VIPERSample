//
//  ArticlesViewData.swift
//  VIPERSample
//
//  Created by Ippo Matsui on 2019/04/20.
//  Copyright © 2019 Ippo Matsui. All rights reserved.
//

import Foundation

struct ArticlesViewData {
    let articles: [Article]
}

extension ArticlesViewData {
   static let empty = ArticlesViewData(articles: [])
}
