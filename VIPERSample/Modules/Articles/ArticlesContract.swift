//
//  ArticlesContract.swift
//  VIPERSample
//
//  Created by Ippo Matsui on 2019/04/20.
//  Copyright © 2019 Ippo Matsui. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ArticlesViewProtocol: class {
    var refreshTrigger: Driver<Void> { get }
}

protocol ArticlesPresenterProtocol: class {
    var articlesViewData: Driver<ArticlesViewData> { get }
    var errors: Driver<Error> { get }
}

protocol ArticlesInteractorProtocol: class {
    func fetchArticlesViewData() -> Observable<ArticlesViewData>
}

protocol ArticlesInteractorOutput: class {
    func articlesFetched(_ articles: [Article])
    func articlesFetchFailed()
}

protocol ArticlesRouterProtocol: class {
}
