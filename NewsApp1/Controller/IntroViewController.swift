//
//  IntroViewController.swift
//  NewsApp1
//
//  Created by 千葉和貴 on 2021/05/06.
//

import UIKit
import Lottie

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var onboardArray = ["1","2","3"]
    var onboardStringArray = ["ようこそ","様々なニュースが受け取れます","新たな情報に出会えます"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isPagingEnabled = true
        setUpScrollView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func setUpScrollView() {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: view.frame.size.height)
        
        for i in 0...2 {
            let animationView = AnimationView()
            let animation = Animation.named(onboardArray[i])
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 90, width: view.frame.size.width, height: (view.frame.size.height * 2) / 3)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)

            let onboardString = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: (view.frame.size.height * 3) / 4 + 20, width: view.frame.size.width, height: 20))
            onboardString.font = .boldSystemFont(ofSize: 15.0)
            onboardString.textAlignment = .center
            onboardString.text = onboardStringArray[i]
            scrollView.addSubview(onboardString)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
