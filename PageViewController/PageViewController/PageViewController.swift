//
//  PageViewController.swift
//  PageViewController
//
//  Created by Rahul Umap on 18/04/19.
//  Copyright © 2019 Rahul Umap. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    lazy var contents : [UIViewController] = {
        return [
            createContentVC(with: Content(image: #imageLiteral(resourceName: "image4"), description: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")),
            
            createContentVC(with: Content(image: #imageLiteral(resourceName: "image3"), description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC")),
            
            createContentVC(with: Content(image: #imageLiteral(resourceName: "image1"), description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form."))]
    }()
    
    /// Mark: ViewController Lifecycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}

// MARK: - Private methods.
extension PageViewController {
    func setup() {
        dataSource = self
        delegate = self
        
        self.view.backgroundColor = .white
        setViewControllers([contents.first!], direction: .forward, animated: true, completion: nil)
    }
    
    func createContentVC(with content: Content) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contentVC = storyboard.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController
        contentVC?.content = content
        return contentVC!
    }
}


// MARK: - UIPageViewControllerDataSource
extension PageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = contents.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {  return nil  }
        guard contents.count > previousIndex else { return nil }
        return contents[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = contents.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard contents.count != nextIndex || contents.count > nextIndex else { return nil }
        return contents[nextIndex]
    }
}

extension PageViewController : UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let currentVC = pageViewController.viewControllers![0] as! ContentViewController
        let index  = contents.firstIndex(of: currentVC)!
        currentVC.pageControl.currentPage = index
    }
}
