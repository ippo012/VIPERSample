//
//  RootRouter.swift
//  VIPERSample
//
//  Created by Ippo Matsui on 2019/04/21.
//  Copyright © 2019 Ippo Matsui. All rights reserved.
//

import UIKit

class RootRouter: RootRouterProtocol {
    func presentArticlesView(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = ArticlesRouter.assembleModule()
    }
}
