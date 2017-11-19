//
//  GraphView.swift
//  PlayerStat
//
//  Created by Hai Le Thanh on 11/19/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit
import EasyPeasy
import Charts

class ChartModel {
    let data: ChartData
    let chartHeight: CGFloat
    init(data: ChartData, chartHeight: CGFloat = 200) {
        self.data = data
        self.chartHeight = chartHeight
    }
}

class AppPieChartView: BaseView {
    let pieChartView = PieChartView()
    
    override func configureSubviews() {
        super.configureSubviews()
        self.addSubview(self.pieChartView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        self.pieChartView.easy.layout(Edges())
    }
    
    override func configureContent() {
        super.configureContent()
        self.setupChartView()
        
    }
    
    private func setupChartView() {
        self.pieChartView.usePercentValuesEnabled = true
        self.pieChartView.drawSlicesUnderHoleEnabled = false
        self.pieChartView.holeRadiusPercent = 0.2
        self.pieChartView.transparentCircleRadiusPercent = 0.01
        self.pieChartView.chartDescription?.enabled = false
        self.pieChartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        self.pieChartView.drawCenterTextEnabled = true
        self.pieChartView.drawHoleEnabled = true
        self.pieChartView.rotationAngle = 0
        self.pieChartView.rotationEnabled = true
        self.pieChartView.highlightPerTapEnabled = false
        
        let l = self.pieChartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.drawInside = false
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
        
        // entry label styling
        self.pieChartView.entryLabelColor = .white
        self.pieChartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        self.pieChartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
    }
    
    func configure(model: ChartModel) {
        self.pieChartView.data = model.data
        self.pieChartView.easy.layout(Height(model.chartHeight))
    }
}

class AppPieChartCell: BaseTableViewCell {
    let chartView = AppPieChartView()
    init() {
        super.init(identifier: "AppPieChartCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureSubviews() {
        super.configureSubviews()
        self.contentView.addSubview(self.chartView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        self.chartView.easy.layout(
            Edges()
        )
    }
    
    func configure(model: ChartModel) {
        self.chartView.configure(model: model)
    }
}

class AppBarChartView: BaseView {
    let barChartView = BarChartView()
    override func configureSubviews() {
        super.configureSubviews()
        self.addSubview(self.barChartView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        self.barChartView.easy.layout(Edges())
    }
    
    override func configureContent() {
        super.configureContent()
        self.setupChartView()
    }
    
    private func setupChartView() {
        self.barChartView.chartDescription?.enabled = false
        self.barChartView.dragEnabled = true
        self.barChartView.setScaleEnabled(true)
        self.barChartView.pinchZoomEnabled = false
        
        let xAxis = self.barChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = false
        
        self.barChartView.rightAxis.enabled = false
        self.barChartView.highlightPerTapEnabled = false
        self.barChartView.doubleTapToZoomEnabled = false
        self.barChartView.pinchZoomEnabled = false
        
        self.barChartView.drawGridBackgroundEnabled = false
        self.barChartView.animate(yAxisDuration: 2.0)
    }
    
    func configure(model: ChartModel) {
        self.barChartView.data = model.data
        self.barChartView.easy.layout(Height(model.chartHeight))
    }
}

class AppBarChartCell: BaseTableViewCell {
    let chartView = AppBarChartView()
    init() {
        super.init(identifier: "AppPieChartCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureSubviews() {
        super.configureSubviews()
        self.contentView.addSubview(self.chartView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        self.chartView.easy.layout(
            Edges()
        )
    }
    
    func configure(model: ChartModel) {
        self.chartView.configure(model: model)
    }
}
