//
//  ArticlesInteractor.swift
//  VIPERSample
//
//  Created by Ippo Matsui on 2019/04/20.
//  Copyright © 2019 Ippo Matsui. All rights reserved.
//

import RxSwift

final class ArticlesInteractor: ArticlesInteractorProtocol {
    func fetchArticlesViewData() -> Observable<ArticlesViewData> {
        return .just(ArticlesViewData(articles: []))
    }
}
