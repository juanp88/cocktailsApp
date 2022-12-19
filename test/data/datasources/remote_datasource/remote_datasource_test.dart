import 'dart:convert';

import 'package:cocktails_app/config/api_constants.dart';
import 'package:cocktails_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:cocktails_app/data/models/details_response_model.dart';
import 'package:cocktails_app/data/models/drinks_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import '../../models/drinks_details_model_mock.dart';
import '../../models/drinks_response_model_mock.dart';
import 'remote_datasource_test.mocks.dart';

@GenerateMocks([ApiConstants, http.Client])
void main() {
  late RemoteDataSource dataSource;
  MockClient mockHttpClient = MockClient();

  setUp(() {
    dataSource = RemoteDataSource(mockHttpClient);
  });

  void setUpMockHttpClientSuccess200(Map<String, dynamic> mockJson) {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(json.encode(mockJson), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  DrinksResponseModel mockResponseModel =
      DrinksResponseModel.fromJson(mockResponseJson);

  group('getDrinks', () {
    test(
      'should get drinks the http call completes successfully',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(mockResponseJson);
        // act
        final result =
            await dataSource.getDrinks(ApiConstants.ordinaryEndpoint);
        // assert
        expect(result.drinks.length, mockResponseModel.drinks.length);
      },
    );
    test('throws an exception if the http call completes with an error',
        () async {
      //arrance
      setUpMockHttpClientFailure404();
      //act
      final call = dataSource.getDrinks;
      //assert
      expect(() => call(ApiConstants.ordinaryEndpoint),
          throwsA(const TypeMatcher<Exception>()));
    });
  });

  group('getDrinksById', () {
    test(
      'should get drink detail the http call completes successfully',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(mockDrinkDetailsJson);
        // act
        final result = await dataSource.getDrinksById('Cocktail');
        // assert
        expect(result, isInstanceOf<DetailsResponseModel>());
      },
    );
    test('throws an exception if the http call completes with an error',
        () async {
      //arrance
      setUpMockHttpClientFailure404();
      //act
      final call = dataSource.getDrinksById;
      //assert
      expect(() => call('Cocktail'), throwsA(const TypeMatcher<Exception>()));
    });
  });
}
