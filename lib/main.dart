import 'package:application/product_overview_screen.dart';
import 'package:application/single_product_overview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eevok.clothing',
      debugShowCheckedModeBanner: false,
      
      routes: {
        //SingleProductOverview.pageRoute: (context) => SingleProductOverview(),
      },

      home: ProductsOverviewScreen(),

    );
  }
}

