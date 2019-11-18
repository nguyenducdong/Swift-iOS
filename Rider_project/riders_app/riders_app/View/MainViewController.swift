//
//  MainViewController.swift
//  riders_app
//
//  Created by admin on 8/30/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenuSwift

class MainViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    var pageViewController : UIPageViewController?
    var pageTitles : Array<UIViewController>?
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: nil)
        let vc1 = EventAllViewController.instantiateFromStoryboard(storyboardName: "Main", storyboardId: "EventAllViewController")
        vc1.view.backgroundColor = UIColor.green
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.blue
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor.yellow
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor.gray
        
        self.pageTitles = [vc1,vc2,vc3,vc4]
        
        self.pageViewController?.delegate = self
        self.pageViewController?.dataSource = self
        self.pageViewController?.setViewControllers([vc1], direction: .forward, animated: true, completion: { (finished) in
            
        })
        
        self.pageViewController?.view.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        
        self.addChildViewController(self.pageViewController!)
        self.contentView.addSubview((self.pageViewController?.view)!)
        self.pageViewController?.didMove(toParentViewController: self)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = self.pageTitles!.index(of: viewController)
        index = index! - 1
        if index! < 0 {
            return nil
        }
        
        return self.pageTitles![index!]
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.pageTitles!.index(of: viewController)
        index = index! + 1
        if index! >= (self.pageTitles?.count)! {
            return nil
        }
        
        return self.pageTitles![index!]
        
    }
    
    
    @IBAction func humbergerMenuPressed(_ sender: UIBarButtonItem) {
        self.sideMenuController?.revealMenu()
        
    }

    
}

