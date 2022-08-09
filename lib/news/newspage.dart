import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          "News",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFAEAE),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                'https://picsum.photos/250?image=9',
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text("India's top valued company and one of the largest employers, Reliance Industries (RIL) created 2.32 lakh (2,32,822) new jobs, taking its total workforce strength to 3,42,982 at the end of FY22, as per RIL's annual report for 2021-22. Out of the total workforce, RIL employees 22,642, Reliance Retail 2,15,614 and Jio 83,347. India's top valued company and one of the largest employers, Reliance Industries (RIL) created 2.32 lakh (2,32,822) new jobs, taking its total workforce strength to 3,42,982 at the end of FY22, as per RIL's annual report for 2021-22. Out of the total workforce, RIL employees 22,642, Reliance Retail 2,15,614 and Jio 83,347. "
                    "There was a 56% increase in new recruits for RIL, and 132% for the retail arm as against the previous year. RIL's retail business continued to expand offline, as well as online and created over 1,50,000 jobs through the year. The strong hiring for the retail business came at the time amid the company's several tie-ups with global brands, opening new outlets and plans to open many more in the next few months."
                    "\n\nMukesh Ambani chairs and runs Reliance Industries, which has interests in petrochemicals, oil and gas, telecom and retail. Almost 60% of Reliance’s revenue comes from oil-refining and petrochemicals, though, the conglomerate has been reducing its dependence on oil-refining by diversifying into retail, telecommunications and technology.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text("India's top valued company and one of the largest employers, Reliance Industries (RIL) created 2.32 lakh (2,32,822) new jobs, taking its total workforce strength to 3,42,982 at the end of FY22, as per RIL's annual report for 2021-22. Out of the total workforce, RIL employees 22,642, Reliance Retail 2,15,614 and Jio 83,347. India's top valued company and one of the largest employers, Reliance Industries (RIL) created 2.32 lakh (2,32,822) new jobs, taking its total workforce strength to 3,42,982 at the end of FY22, as per RIL's annual report for 2021-22. Out of the total workforce, RIL employees 22,642, Reliance Retail 2,15,614 and Jio 83,347. "
                    "There was a 56% increase in new recruits for RIL, and 132% for the retail arm as against the previous year. RIL's retail business continued to expand offline, as well as online and created over 1,50,000 jobs through the year. The strong hiring for the retail business came at the time amid the company's several tie-ups with global brands, opening new outlets and plans to open many more in the next few months."
                    "\n\nMukesh Ambani chairs and runs Reliance Industries, which has interests in petrochemicals, oil and gas, telecom and retail. Almost 60% of Reliance’s revenue comes from oil-refining and petrochemicals, though, the conglomerate has been reducing its dependence on oil-refining by diversifying into retail, telecommunications and technology.",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                  ),),
              )
              ,Container(
                padding: EdgeInsets.all(5),
                child: Text("India's top valued company and one of the largest employers, Reliance Industries (RIL) created 2.32 lakh (2,32,822) new jobs, taking its total workforce strength to 3,42,982 at the end of FY22, as per RIL's annual report for 2021-22. Out of the total workforce, RIL employees 22,642, Reliance Retail 2,15,614 and Jio 83,347. India's top valued company and one of the largest employers, Reliance Industries (RIL) created 2.32 lakh (2,32,822) new jobs, taking its total workforce strength to 3,42,982 at the end of FY22, as per RIL's annual report for 2021-22. Out of the total workforce, RIL employees 22,642, Reliance Retail 2,15,614 and Jio 83,347. "
                    "There was a 56% increase in new recruits for RIL, and 132% for the retail arm as against the previous year. RIL's retail business continued to expand offline, as well as online and created over 1,50,000 jobs through the year. The strong hiring for the retail business came at the time amid the company's several tie-ups with global brands, opening new outlets and plans to open many more in the next few months."
                    "\n\nMukesh Ambani chairs and runs Reliance Industries, which has interests in petrochemicals, oil and gas, telecom and retail. Almost 60% of Reliance’s revenue comes from oil-refining and petrochemicals, though, the conglomerate has been reducing its dependence on oil-refining by diversifying into retail, telecommunications and technology.",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
