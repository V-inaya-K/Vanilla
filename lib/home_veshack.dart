import 'package:flutter/material.dart';
import 'package:my_practice/introPage.dart';
import 'package:my_practice/splash.dart';
class InvestmentStatsScreen extends StatelessWidget {
  // Sample data for the investments
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
    // Add more data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investment Stats'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/animations/op90.png'),
            fit: BoxFit.cover

          )
        ),
        child: ListView.builder(
          itemCount: stats.length,
          itemBuilder: (context, index) {
            final stat = stats[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen1()),);
                },
    //           onTap: () {
    // // Navigate to the second page and pass the selected item
    // Navigator.push(
    // context,
    // MaterialPageRoute(
    // builder: (context) => SecondPage(item: stats[index]),
                title: Text('Investment: \$${stat.totalInvestments}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Carbon Savings: ${stat.totalCarbonSavings} tons'),
                    Text('Total Energy Savings: ${stat.totalEnergySavings} kWh'),
                    Text('Total Cars Reduced: ${stat.totalCarsReduced} cars'),

                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => SplashScreen1()),
                    //     );
                    //   },
                    //   child: Text('Go to Second Page'),
                    // ),

                  ],
                ),
              ),
            );
          },
        ),

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