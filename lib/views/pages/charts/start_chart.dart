import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

final List<Color> color = <Color>[
  Color(0xFF5F8BFD),
  Color(0xFFBAD0FE),
  Colors.white
];
final List<double> stops = <double>[0.0, 0.3, 1.0];
final LinearGradient gradients = LinearGradient(
    colors: color,
    stops: stops,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

class StartChart extends StatelessWidget {
  final salesFormat = NumberFormat('#,#');

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, Colors.blue),
      ChartData('Steve', 38, Colors.purple),
      ChartData('Jack', 34, Colors.teal),
      ChartData('Others', 52, Colors.yellow)
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('IMOLA Dashboard'),
      ),
      body: Center(
        child: Container(
          color: Colors.white.withOpacity(.3),
          width: 850,
          height: 300,
          // 初始化图表
          child: Stack(children: [
            // buildSfCircularChart(chartData),
            buildSfCartesianChart(chartData),
            // buildContainer()
            // Sparkline(
            //   data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
            //   sharpCorners: true,
            //   lineWidth: 5.0,
            //   lineColor: Colors.purple,
            //   lineGradient: new LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Colors.purple[800], Colors.purple[200]],
            //   ),
            //   fillMode: FillMode.below,
            //   fillColor: Colors.red[200],
            //   fillGradient: new LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Colors.red[800], Colors.red[200]],
            //   ),
            // )
          ]),
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // margin: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '销售额',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            '￥15,781',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ],
      ),
    );
  }

  SfCircularChart buildSfCircularChart(List<ChartData> chartData) {
    return SfCircularChart(
      // Palette colors
      palette: <Color>[Colors.teal, Colors.orange, Colors.brown, Colors.blue],
      borderWidth: 2,
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          explode: true,
          // explodeIndex: 1,
          explodeAll: true,
          radius: '50%',
          enableTooltip: true,

          // pointColorMapper: (data, _) => data.color,
          // strokeWidth: 2,
          // strokeColor: Colors.white,
          innerRadius: '80%',
          xValueMapper: (data, _) => data.x,
          yValueMapper: (data, _) => data.y,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: ChartTextStyle(color: Colors.white),
            // builder: (dynamic data, dynamic point, dynamic series,
            //     int pointIndex, int seriesIndex) {
            //   return Container(
            //     // height: 30,
            //     // width: 30,
            //     child: Text('${data.x}'),
            //   );
            // },
          ),
          // dataLabelMapper: (ChartData  data, _) => '${data.x}',
          opacity: 1,
          cornerStyle: CornerStyle.bothCurve,
          startAngle: 270,
          endAngle: 90,
          // groupMode: CircularChartGroupMode.point,
          // groupTo: 3,
        ),
      ],
    );
  }

  int _nextSales(int min, int max) => min + Random().nextInt(max - min);

  List<SalesData> _buildDataSource([length = 21, min = 1000, max = 10000]) =>
      List.generate(length, (i) => SalesData((i + 1999), _nextSales(min, max)));

  _randomColor() {
    var random = Random();
    return Color.fromRGBO(random.nextInt(255), random.nextInt(255),
        random.nextInt(255), max(0.6, random.nextDouble()));
  }

  buildSfCartesianChart(List<ChartData> chartData) {
    return SfCartesianChart(
      borderWidth: 2,
      borderColor: Colors.red,
      margin: EdgeInsets.all(50),
      plotAreaBorderWidth: 5,
      plotAreaBorderColor: Colors.pink,
      plotAreaBackgroundColor: Colors.lightGreen,

      legend: Legend(
        title: LegendTitle(
          text: '历年销售额历年销售额',
          textStyle: ChartTextStyle(
            color: Colors.red,
            fontSize: 15,
          ),
        ),
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.right,
        width: '50%',
        // borderColor: Colors.orange,
        borderWidth: 2,
      ),

      // 启用十字准线
      // crosshairBehavior: CrosshairBehavior(enable: true, activationMode: ActivationMode.longPress),

      primaryXAxis: CategoryAxis(
        isVisible: true,
        // numberFormat: NumberFormat.simpleCurrency(locale: 'zh_CN'),
        labelPlacement: LabelPlacement.onTicks,
        // interval: 0,
        // majorGridLines: MajorGridLines(
        //   width: 0,
        //   color: Colors.transparent,
        // ),
      ),
      primaryYAxis: NumericAxis(isVisible: false),

      annotations: <CartesianChartAnnotation>[
        CartesianChartAnnotation(
          widget: Container(
            child: Text('HHH😃'),
          ),
          x: 2005,
          y: 100,
          region: AnnotationRegion.chart,
          coordinateUnit: CoordinateUnit.point,
        ),
      ],

      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true, // 启用捏合
        enableDoubleTapZooming: true, // 双击缩放

        // 启用选区
        enableSelectionZooming: true,
        selectionRectBorderColor: Colors.red,
        selectionRectBorderWidth: 1,
        selectionRectColor: Colors.grey,

        // 启用平移
        enablePanning: true,
      ),

      // 轨迹球
      trackballBehavior: TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.longPress, // 长按启用，防止和缩放行为冲突
        lineType: TrackballLineType.vertical,
        tooltipSettings: InteractiveTooltip(
          format: '{point.x}年: ￥{point.y}',
          color: Colors.orange,
          textStyle: ChartTextStyle(fontSize: 18.0),
        ),
      ),

      series: [
        SplineSeries<SalesData, int>(
          // isVisibleInLegend: false,
          dataSource: _buildDataSource(20, 100, 200),
          xValueMapper: (SalesData data, _) => data.year,
          yValueMapper: (SalesData data, _) => data.sales,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: ChartTextStyle(fontSize: 18),
            angle: 45,
            // useSeriesColor: true,
          ),
          enableTooltip: true,

          markerSettings: MarkerSettings(
            isVisible: true,
            shape: DataMarkerType.horizontalLine,
          ),

          // borderColor: Color(0xFF638FFD),
          // borderWidth: 4,
          // borderMode: AreaBorderMode.top,
          gradient: gradients,
        ),
      ],
    );
  }
}

class SalesData {
  final int year;
  final int sales;

  SalesData(this.year, this.sales);
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
