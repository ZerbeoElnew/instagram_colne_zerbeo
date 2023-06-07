import 'dart:html';
import 'package:http/http.dart' as http;
class APIResponse{
  final HttpStatus StatusCode;
  final bool IsSucess;
  final List<String> ErrorMessages;
  final Object Result;

  APIResponse(this.StatusCode, this.IsSucess, this.ErrorMessages, this.Result);
}