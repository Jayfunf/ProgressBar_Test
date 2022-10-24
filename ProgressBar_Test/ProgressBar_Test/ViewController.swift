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
    
    let redColor: UIColor = UIColor.init(red: CGFloat(255/255.0), green: CGFloat(98/255.0), blue: CGFloat(126/255.0), alpha: 0.68)
    let blueColor: UIColor = UIColor.init(red: CGFloat(31/255.0), green: CGFloat(163/255.0), blue: CGFloat(249/255.0), alpha: 0.68)
    let greenColor: UIColor = UIColor.init(red: CGFloat(0/255.0), green: CGFloat(214/255.0), blue: CGFloat(124/255.0), alpha: 0.68)
    
    let dummyKcal: Float = 350.5

    override func viewDidLoad() {
        super.viewDidLoad()
        presentCircularBarView(kcal: dummyKcal)
    }
    
    private func presentCircularBarView(kcal: Float) {
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        let pieChartView = PieChartView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        pieChartView.center = self.view.center
        pieChartView.slices = [
            Slice(percent: 0.2, color: redColor),
            Slice(percent: 0.5, color: blueColor),
            Slice(percent: 0.3, color: greenColor)
        ]
        
        self.view.addSubview(pieChartView)
        
        
        kcalText = UILabel().then {
            self.view.addSubview($0)
            $0.text = "\(kcal)"
            $0.font = .boldSystemFont(ofSize: 50)
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
                $0.centerY.equalTo(kcalText).offset(40)
                
            }
        }
        
        pieChartView.animateChart()
    }
    
    private func presentLineBarView() {
        
    }
}
