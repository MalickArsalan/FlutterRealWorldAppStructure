import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_repository/quote_repository.dart';

part 'quote_details_state.dart';

// TODO: Create the cubit.

// 3.5
class QuoteDetailsCubit extends Cubit<QuoteDetailsState> {
  QuoteDetailsCubit({
    required this.quoteId,
    required this.quoteRepository,
  }) : super(
          // 3.6
          const QuoteDetailsInProgress(),
        ) {
    _fetchQuoteDetails();
  }

  final int quoteId;
  // 3.7
  final QuoteRepository quoteRepository;

  void _fetchQuoteDetails() async {
    // TODO: Fetch data from QuoteRepository.
    try {
      // 3.8
      final quote = await quoteRepository.getQuoteDetails(quoteId);
      // 3.9
      emit(QuoteDetailsSuccess(quote: quote));
    } catch (error) {
      emit(const QuoteDetailsFailure());
    }
  }

  void refetch() async {
    // TODO: Add a body to refetch().
    // 3.10
    emit(const QuoteDetailsInProgress());
    // 3.11
    _fetchQuoteDetails();
  }

  void upvoteQuote() async {
    // TODO: Add a body to upvoteQuote().
    try {
      final updatedQuote = await quoteRepository.upvoteQuote(quoteId);
      emit(QuoteDetailsSuccess(quote: updatedQuote));
    } catch (error) {
      // TODO: Handle error
      // 3.18
      final lastState = state;
      // 3.19
      if (lastState is QuoteDetailsSuccess) {
        // 3.20
        emit(
          QuoteDetailsSuccess(
            quote: lastState.quote,
            quoteUpdateError: error,
          ),
        );
      }
    }
  }

  void downvoteQuote() async {
    // TODO: Challenge.
  }

  void unvoteQuote() async {
    // TODO: Challenge.
  }

  void favoriteQuote() async {
    // TODO: Challenge.
  }

  void unfavoriteQuote() async {
    // TODO: Challenge.
  }
}
