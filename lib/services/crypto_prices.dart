import 'networking.dart';
import 'package:bitcoin_ticker/utilities/constants.dart';

const kCoinApiURL = 'https://rest.coinapi.io/v1/exchangerate';

class CryptoPrices {
  Future<dynamic> getPrices(String cryptoName, String currencyName) async {
    var url = '$kCoinApiURL/$cryptoName/$currencyName?apikey=$kAppKey';
    print(url);
    NetworkHelper networkhelper = NetworkHelper(url);
    var priceData = await networkhelper.getData();
    return priceData;
  }
}
