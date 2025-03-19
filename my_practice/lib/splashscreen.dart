
class InvestmentStatsScreen extends StatelessWidget {
  final List<InvestmentStats> stats = [
    InvestmentStats(
      totalInvestments: 100000,
      totalCarbonSavings: 500,
      totalEnergySavings: 3000,
      totalCarsReduced: 50,
    ),
    InvestmentStats(
      totalInvestments: 200000,
      totalCarbonSavings: 1000,
      totalEnergySavings: 6000,
      totalCarsReduced: 100,
    ),
    InvestmentStats(
      totalInvestments: 150000,
      totalCarbonSavings: 750,
      totalEnergySavings: 4000,
      totalCarsReduced: 75,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investment Stats'),
      ),
      body: ListView.builder(
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final stat = stats[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: Text('Investment: \$${stat.totalInvestments}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Carbon Savings: ${stat.totalCarbonSavings} tons'),
                      Text('Total Energy Savings: ${stat.totalEnergySavings} kWh'),
                      Text('Total Cars Reduced: ${stat.totalCarsReduced} cars'),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(10),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: SideTitles(showTitles: true),
                        bottomTitles: SideTitles(showTitles: true),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: const Color(0xff37434d), width: 1),
                      ),
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 1200, // Adjust based on your data
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, stat.totalInvestments / 2000),  // Scale down for visualization
                            FlSpot(1, stat.totalCarbonSavings * 2),   // Scale down for visualization
                            FlSpot(2, stat.totalEnergySavings / 1000), // Scale down for visualization
                            FlSpot(3, stat.totalCarsReduced * 10),     // Scale down for visualization
                            FlSpot(4, 0), // Placeholder for additional data
                            FlSpot(5, 0), // Placeholder for additional data
                            FlSpot(6, 0), // Placeholder for additional data
                          ],
                          isCurved: true,
                          colors: [Colors.blue],
                          dotData: FlDotData(show: true),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class InvestmentStats {
  final double totalInvestments;
  final double totalCarbonSavings;
  final double totalEnergySavings;
  final int totalCarsReduced;

  InvestmentStats({
    required this.totalInvestments,
    required this.totalCarbonSavings,
    required this.totalEnergySavings,
    required this.totalCarsReduced,
  });
}