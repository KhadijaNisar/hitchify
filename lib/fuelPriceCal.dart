import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

Future<String> fetchSuperPetrolPrice() async {
  try {
    final response = await http.get(Uri.parse('https://www.shell.com.pk/motorists/shell-fuels/shell-station-price-board.html'));
    final document = parser.parse(response.body);
   print(document);
    final superPriceElement = document.querySelector('.price-board__product-price-super');
    final superPrice = superPriceElement?.text ?? 'N/A';

    return superPrice;
  } catch (e) {
    print('Error fetching super petrol price: $e');
    return 'N/A';
  }
  // final response = await http.get(Uri.parse('https://www.shell.com.pk/motorists/shell-fuels/shell-station-price-board.html'));
  // final document = parser.parse(response.body);
  //
  // final superPriceElement = document.querySelector('.price-board__product-price-super');
  // final superPrice = superPriceElement?.text ?? 'N/A';
  //
  // return superPrice;
}