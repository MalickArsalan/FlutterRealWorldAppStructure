part of 'quote_details_cubit.dart';

// TODO: Create models for all possible screen states.

// 1
abstract class QuoteDetailState extends Equatable {
  const QuoteDetailState();
}

// 2
class QuoteDetailsInProgress extends QuoteDetailState {
  const QuoteDetailsInProgress();

// 3
  @override
  List<Object?> get props => [];
}

class QuoteDetailSuccess extends QuoteDetailState {
  const QuoteDetailSuccess({
    required this.quote,
    // TODO: Receive new property.
  });

  // 4
  final Quote quote;
  // TODO: Add new property.

  @override
  List<Object?> get props => [
        quote,
        // TODO: List new property.
      ];
}

class QuoteDetailsFailure extends QuoteDetailState {
  const QuoteDetailsFailure();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
