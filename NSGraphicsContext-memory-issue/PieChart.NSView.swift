//
//  PieChart.NSView.swift
//  SpaceSteward
//
//  Created by mi on 2023/12/13.
//

#if canImport(AppKit)
import AppKit
import MetalKit
import SwiftUI

struct SectorMark {
  struct Radius {
    let ratio: CGFloat
    func getValue(in radius: CGFloat) -> CGFloat {
      radius * ratio
    }
  }
  let angle: CGFloat
  let innerRadius: Radius
  let outerRadius: Radius
}

class PieChartView: NSView {
  var total: Double = 0
  var marks: [SectorMark] = [] {
    didSet {
      total = Double(marks.reduce(into: 0) { partialResult, value in
        partialResult += value.angle
      })
    }
  }

  override func draw(_ dirtyRect: NSRect) {
    guard let nsContext = NSGraphicsContext.current else {
      return
    }
    nsContext.imageInterpolation = .low
    let context = nsContext.cgContext
    context.interpolationQuality = .none
    context.setShouldAntialias(false)
    context.setShouldSubpixelPositionFonts(false)
    let size = dirtyRect.size

    let center = CGPoint(x: size.width / 2, y: size.height / 2)
    let radius = min(size.width, size.height) / 2
    var startAngle: Double = 0
    for mark in marks {
      let angle = Double(mark.angle) / total
      defer {
        startAngle += angle
      }
      let startAngle = startAngle * 360 - 90
      let endAngel = startAngle + angle * 360

      let innerRadius = mark.innerRadius.getValue(in: radius)
      let outerRadius = mark.outerRadius.getValue(in: radius)

      let path = CGMutablePath()

      path.addArc(center: center, radius: innerRadius, startAngle: startAngle, endAngle: endAngel, clockwise: false)

      path.addArc(center: center, radius: outerRadius, startAngle: endAngel, endAngle: startAngle, clockwise: true)
      path.closeSubpath()

      context.setFillColor(red: .random(in: 0..<1), green: .random(in: 0..<1), blue: .random(in: 0..<1), alpha: 1)
      context.addPath(path)
      context.fillPath()
    }
  }
}
#endif
