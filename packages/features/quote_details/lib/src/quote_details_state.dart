part of 'quote_details_cubit.dart';

// TODO: Create models for all possible screen states.

// 3.1
abstract class QuoteDetailsState extends Equatable {
  const QuoteDetailsState();
}

// 3.2
class QuoteDetailsInProgress extends QuoteDetailsState {
  const QuoteDetailsInProgress();

// 3.3
  @override
  List<Object?> get props => [];
}

class QuoteDetailsSuccess extends QuoteDetailsState {
  const QuoteDetailsSuccess({
    required this.quote,
    // TODO: Receive new property.
    this.quoteUpdateError,
  });

  // 3.4
  final Quote quote;
  // TODO: Add new property.
  final dynamic quoteUpdateError;

  @override
  List<Object?> get props => [
        quote,
        // TODO: List new property.
        quoteUpdateError,
      ];
}

class QuoteDetailsFailure extends QuoteDetailsState {
  const QuoteDetailsFailure();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
