import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../errors/failure.dart';

abstract class ApiService {
  Future<Either<Failure, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  });
}

class ApiServiceImpl implements ApiService {
  final String baseUrl;

  ApiServiceImpl({required this.baseUrl});

  @override
  Future<Either<Failure, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
      );

      return _handleResponse(response);
    } on SocketException {
      return Left(NetworkFailure('No internet connection'));
    } on FormatException {
      return Left(ServerFailure('Invalid response format'));
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }

  Either<Failure, dynamic> _handleResponse(http.Response response) {
    try {
      final decoded = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(decoded);
      } else {
        return Left(
          ServerFailure(
            'HTTP ${response.statusCode}: ${response.reasonPhrase ?? response.body}',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Response decoding failed: $e'));
    }
  }
}
