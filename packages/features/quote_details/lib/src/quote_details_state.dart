part of 'quote_details_cubit.dart';

// TODO: Create models for all possible screen states.

// 1
abstract class QuoteDetailsState extends Equatable {
  const QuoteDetailsState();
}

// 2
class QuoteDetailsInProgress extends QuoteDetailsState {
  const QuoteDetailsInProgress();

// 3
  @override
  List<Object?> get props => [];
}

class QuoteDetailsSuccess extends QuoteDetailsState {
  const QuoteDetailsSuccess({
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

class QuoteDetailsFailure extends QuoteDetailsState {
  const QuoteDetailsFailure();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
