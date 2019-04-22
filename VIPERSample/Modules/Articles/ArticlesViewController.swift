//
//  ArticlesViewController.swift
//  VIPERSample
//
//  Created by Ippo Matsui on 2019/04/20.
//  Copyright © 2019 Ippo Matsui. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ArticlesViewController: UIViewController, ArticlesViewProtocol {
    private var presenter: ArticlesPresenterProtocol!
    private let disposeBag = DisposeBag()
    
    private var refreshTriggerSubject = PublishSubject<Void>()
    var refreshTrigger: Driver<Void> {
        return refreshTriggerSubject.asDriver(onErrorDriveWith: .empty())
    }
    
    func inject(_ presenter: ArticlesPresenterProtocol) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rx.viewWillAppear
            .take(1)
            .bind(to: refreshTriggerSubject)
            .disposed(by: disposeBag)
    }
}
