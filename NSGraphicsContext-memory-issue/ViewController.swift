//
//  ViewController.swift
//  NSGraphicsContext-memory-issue
//
//  Created by mi on 2023/12/13.
//

import Cocoa

class ViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    let pieView = PieChartView(frame: self.view.bounds)
    pieView.marks = [
      .init(angle: 100, innerRadius: .init(ratio: 0.3), outerRadius: .init(ratio: 0.7)),
    ]
    view.addSubview(pieView)
    pieView.autoresizingMask = [.height, .width]

    keeUpdate(nsView: pieView)
  }


  func keeUpdate(nsView: PieChartView) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      nsView.needsDisplay = true
      self.keeUpdate(nsView: nsView)
    }
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

