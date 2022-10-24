//
//  ViewController.swift
//  ProgressBar_Test
//
//  Created by Minhyun Cho on 2022/10/24.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    var kcalText: UILabel!
    var kcalText2: UILabel!
    var pieChartView: PieChartView!
    
    let dummyKcal: Float = 350.5

    override func viewDidLoad() {
        super.viewDidLoad()
        presentView(kcal: dummyKcal)
    }
    
    private func presentView(kcal: Float) {
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        let pieChartView = PieChartView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        pieChartView.center = self.view.center
        pieChartView.slices = [
            Slice(percent: 0.2, color: UIColor.systemRed),
            Slice(percent: 0.5, color: UIColor.systemBlue),
            Slice(percent: 0.3, color: UIColor.systemGreen)
        ]
        
        self.view.addSubview(pieChartView)
        
        kcalText = UILabel().then {
            self.view.addSubview($0)
            $0.text = "\(kcal)"
            $0.font = $0.font.withSize(50)
            $0.snp.makeConstraints {
                $0.center.equalTo(pieChartView)
            }
        }
        
        kcalText2 = UILabel().then {
            self.view.addSubview($0)
            $0.text = "kcal"
            $0.font = $0.font.withSize(30)
            $0.snp.makeConstraints {
//                $0.width.equalTo(81.0)
//                $0.height.equalTo(30.0)
                $0.centerX.equalTo(kcalText)
                $0.centerY.equalTo(kcalText).offset(30)
                
            }
        }
        
        pieChartView.animateChart()
    }
}
