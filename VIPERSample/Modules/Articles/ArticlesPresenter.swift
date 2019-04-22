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
    
    private(set) var articlesViewData: Driver<ArticlesViewData> = .empty()
    
    private let errorsSubject = PublishSubject<Error>()
    var errors: Driver<Error> {
        return errorsSubject.asDriver(onErrorDriveWith: .empty())
    }
    
    init(view: ArticlesViewProtocol, interactor: ArticlesInteractorProtocol, router: ArticlesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        articlesViewData = view.refreshTrigger
            .flatMapFirst { _ in
                return self.interactor.fetchArticlesViewData()
                    .catchError { error in
                        self.errorsSubject.onNext(error)
                        return .empty()
                    }
                    .asDriver(onErrorJustReturn: .empty)
            }
    }
}
