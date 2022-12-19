import 'package:cocktails_app/config/api_constants.dart';
import 'package:cocktails_app/data/models/details_response_model.dart';
import 'package:cocktails_app/data/models/drink_details_model.dart';
import 'package:cocktails_app/data/models/drinks_response_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteDataSource {
  final http.Client client;
  RemoteDataSource(this.client);

  Future<DrinksResponseModel> getDrinks(String endpoint) async {
    Uri queryString = Uri.parse(ApiConstants.baseUrl + endpoint);
    try {
      http.Response response = await client.get(queryString);
      if (response.statusCode == 200) {
        DrinksResponseModel responseModel =
            DrinksResponseModel.fromJson(json.decode(response.body));
        return responseModel;
      }
    } catch (e) {
      throw Exception();
    }
    throw Exception();
  }

  Future<DetailsResponseModel> getDrinksById(String? id) async {
    Uri queryString = Uri.parse('${ApiConstants.baseIdUrl}$id');
    try {
      http.Response response = await client.get(
        queryString,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        DetailsResponseModel responseModel =
            DetailsResponseModel.fromJson(json.decode(response.body));

        return responseModel;
      }
    } catch (e) {
      throw Exception();
    }
    throw Exception();
  }
}
