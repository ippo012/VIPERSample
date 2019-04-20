//
//  ArticlesRouter.swift
//  VIPERSample
//
//  Created by Ippo Matsui on 2019/04/20.
//  Copyright © 2019 Ippo Matsui. All rights reserved.
//

import UIKit

final class ArticlesRouter {
    private weak var viewController: UIViewController!
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModule() -> UIViewController {
        let view = ArticlesViewController()
        let interactor = ArticlesInteractor()
        let router = ArticlesRouter(viewController: view)
        let presenter = ArticlesPresenter(view: view, interactor: interactor, router: router)
        view.inject(presenter)
        return view
    }
}

extension ArticlesRouter: ArticlesRouterProtocol {
}
