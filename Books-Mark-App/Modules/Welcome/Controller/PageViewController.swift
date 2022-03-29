//
//  PageViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 3/1/22.
//

import UIKit
    //primer view controller
class PageViewController: UIPageViewController {
    //var viewControllers = [ViewController(), StackViewController()]
    let labelOneViewController = LabelViewController()
    let labelTwoViewController = LabelViewController()
    let labelThreeViewController = LabelViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
       labelOneViewController.text = "Hello!"
       labelTwoViewController.text = "Are You Ready?"
        labelThreeViewController.text = "Let's Go!"
        //Set initial viewController....
        self.setViewControllers([labelOneViewController], direction: .forward, animated: true, completion: nil)
        self.view.backgroundColor = .tertiaryLabel
        //self.viewControllers =
        // Do any additional setup after loading the view.
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //Prepare prev action!
      if viewController === labelTwoViewController {
            return labelOneViewController
        }else if viewController === labelThreeViewController {
            return labelTwoViewController
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //Prepare next action!
       if viewController === labelOneViewController {
            return labelTwoViewController
        }else if viewController === labelTwoViewController {
            return labelThreeViewController
        }
    else {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let navigationViewController = mainStoryboard.instantiateViewController(withIdentifier: "NavigationController")
            navigationViewController.modalPresentationStyle = .fullScreen
            self.present(navigationViewController, animated: true, completion: nil)
           // self.view.window?.rootViewController = navigationViewController
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        3
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
