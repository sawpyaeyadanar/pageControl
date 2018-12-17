//
//  PageViewController.swift
//  pageController
//
//  Created by ZinZinNaing on 12/17/18.
//  Copyright © 2018 ZinZinNaing. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    lazy var subViewControllers:[UIViewController] = {
        return [
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController1") as! ViewController1,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController2") as! ViewController2,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController3") as! ViewController3,
        ]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.index(of: viewController) ?? 0
        if (currentIndex <= 0) {
            return nil
        }
        return subViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if( currentIndex >= subViewControllers.count - 1) {
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
    


}
