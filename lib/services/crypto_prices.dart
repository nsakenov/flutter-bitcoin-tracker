import 'networking.dart';
import 'package:bitcoin_ticker/utilities/constants.dart';

const kApiURL = 'https://api.nomics.com/v1/currencies/ticker';

class CryptoPrices {
  Future<dynamic> getPrices(String cryptoName, String currencyName) async {
    var url =
        '${kApiURL}?key=${kAppKey}&ids=${cryptoName}&interval=1d&convert=${currencyName}';
    print(url);
    NetworkHelper networkhelper = NetworkHelper(url);
    var priceData = await networkhelper.getData();
    return priceData;
  }
}
