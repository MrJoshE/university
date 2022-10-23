import 'package:equatable/equatable.dart';

import '../errors.dart';

/// Represents the data response object that returns returning the status only.
///
/// ```dart
/// final DataResponse<CardInfo> response = cardRepository.getCardInfo("0000-0000-0000-0000");
///
/// if (response.isSuccessful())
/// {
///   final CardInfo cardInfo = response.content;
///   // Feed cardInfo into UI
/// }
/// else
/// {
///   // process response.failure
/// }
///
/// class CardRepository
/// {
///   DataResponse<CardInfo> getCardInfo(string cardId)
///   {
///     final NetworkResponse<CardInfo> networkResponse = httpClient.getCardInfo(cardId);
///
///     if (networkResponse.isSuccessful)
///     {
///       return DataResponse.success(networkResponse.content)
///     }
///     else
///     {
///       // Display error message
///
///       return DataResponse.failure(CardRepositoryFailure());
///     }
///   }
/// }
/// ```
class DataResponse<TContent> extends Equatable {
  /// Gets a value indicating whether the response is successful, e.g. true if
  /// successful; otherwise, false.
  final bool isSuccessful;

  /// Gets the content of the response.
  final TContent? content;

  /// Gets the failure object.
  final Failure? failure;

  /// Initializes a new instance of [DataResponse] class that is successful and returns the [content] object.
  const DataResponse.success(this.content)
      : isSuccessful = true,
        failure = null;

  /// Initializes a new instance of [DataResponse] class that is failed and returns the [failure] object.
  const DataResponse.failure(this.failure)
      : isSuccessful = false,
        content = null;

  @override
  List<Object?> get props => [isSuccessful, content, failure];
}
