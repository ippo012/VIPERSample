//
//  RootContract.swift
//  VIPERSample
//
//  Created by Ippo Matsui on 2019/04/21.
//  Copyright © 2019 Ippo Matsui. All rights reserved.
//

import RxSwift
import RxCocoa

protocol RootRouterProtocol: class {
    func presentArticlesView(in window: UIWindow)
}
