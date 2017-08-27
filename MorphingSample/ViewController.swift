//
//  ViewController.swift
//  MorphingSample
//
//  Created by Hiroyuki Mizukami on 8/17/17.
//  Copyright © 2017 Hiroyuki Mizukami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var defaultSmallRect: CGRect!
    private var defaultBigRect: CGRect!

    @IBOutlet weak var big: UILabel!
    @IBOutlet weak var small: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.big.alpha = 0.0
        self.small.alpha = 1.0
        self.defaultBigRect = self.big.frame
        self.defaultSmallRect = self.small.frame
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let scale = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 1) {
            if self.big.alpha == 0.0 {
                self.transform(self.small, to: self.defaultBigRect.size)
                self.big.transform =  CGAffineTransform.identity
            } else {
                self.small.transform =  CGAffineTransform.identity
                self.transform(self.big, to: self.defaultSmallRect.size)
            }
        }
        let alpha = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) {
            if self.big.alpha == 0.0 {
                self.big.alpha = 1.0
                self.small.alpha = 0.0
            } else {
                self.big.alpha = 0.0
                self.small.alpha = 1.0
            }
        }

        scale.startAnimation()
        alpha.startAnimation()
    }
    
    private func transform(_ view: UIView, to: CGSize) {
        let sX = to.width / view.frame.size.width
        let sY =  to.height / view.frame.size.height
        print("transform = \(view.frame.size), \(to), \(sX), \(sY)")
        let scale = CGAffineTransform(scaleX: sX, y: sY)
        view.transform = scale
    }
}

