part of 'quote_details_cubit.dart';

// TODO: Create models for all possible screen states.

// 1
abstract class QuoteDetailListState extends Equatable {
  const QuoteDetailListState();
}

// 2
class QuoteDetailsInProgress extends QuoteDetailListState {
  const QuoteDetailsInProgress();

// 3
  @override
  List<Object?> get props => [];
}

class QuoteDetailSuccess extends QuoteDetailListState {
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

class QuoteDetailsFailure extends QuoteDetailListState {
  const QuoteDetailsFailure();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
