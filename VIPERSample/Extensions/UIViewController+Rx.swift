//
//  UIViewController+Rx.swift
//  VIPERSample
//
//  Created by Ippo Matsui on 2019/04/20.
//  Copyright © 2019 Ippo Matsui. All rights reserved.
//

import RxSwift
import RxCocoa

extension RxSwift.Reactive where Base: UIViewController {
    var viewDidLoad: Observable<Void> {
        return sentMessage(#selector(UIViewController.viewDidLoad))
            .map { _ in }
    }
    
    var viewDidLayoutSubviews: Observable<Void> {
        return sentMessage(#selector(UIViewController.viewDidLayoutSubviews))
            .map { _ in }
    }
    
    var viewWillAppear: Observable<Void> {
        return sentMessage(#selector(UIViewController.viewWillAppear))
             .map { _ in }
    }
    
    var viewDidAppear: Observable<Void> {
        return sentMessage(#selector(UIViewController.viewDidAppear))
             .map { _ in }
    }
    
    var viewWillDisappear: Observable<Void> {
        return sentMessage(#selector(UIViewController.viewWillDisappear))
             .map { _ in }
    }
    
    var viewDidDisappear: Observable<Void> {
        return sentMessage(#selector(UIViewController.viewDidDisappear))
             .map { _ in }
    }
}
