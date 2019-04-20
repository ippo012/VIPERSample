//
//  ArticlesPresenter.swift
//  VIPERSample
//
//  Created by Ippo Matsui on 2019/04/20.
//  Copyright © 2019 Ippo Matsui. All rights reserved.
//

import RxSwift
import RxCocoa

final class ArticlesPresenter: ArticlesPresenterProtocol {
    private weak var view: ArticlesViewProtocol!
    private var interactor: ArticlesInteractorProtocol
    private var router: ArticlesRouterProtocol
    
    private let disposeBag = DisposeBag()
    
    init(view: ArticlesViewProtocol, interactor: ArticlesInteractorProtocol, router: ArticlesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        let _ = view.refreshTrigger
            .asObservable()
            .flatMapFirst { _ -> Observable<ArticlesViewData> in
                return self.interactor.fetchArticlesViewData()
            }
    }
}
