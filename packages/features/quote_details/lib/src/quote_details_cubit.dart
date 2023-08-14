import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_repository/quote_repository.dart';

part 'quote_details_state.dart';

// TODO: Create the cubit.

// 1
class QuoteDetailsCubit extends Cubit<QuoteDetailsState> {
  QuoteDetailsCubit({
    required this.quoteId,
    required this.quoteRepository,
  }) : super(
          // 2
          const QuoteDetailsInProgress(),
        ) {
    _fetchQuoteDetails();
  }

  final int quoteId;
  // 3
  final QuoteRepository quoteRepository;

  void _fetchQuoteDetails() async {
    // TODO: Fetch data from QuoteRepository.
    try {
      // 1
      final quote = await quoteRepository.getQuoteDetails(quoteId);
      // 2
      emit(QuoteDetailsSuccess(quote: quote));
    } catch (error) {
      emit(const QuoteDetailsFailure());
    }
  }

  void refetch() async {
    // TODO: Add a body to refetch().
    // 1
    emit(const QuoteDetailsInProgress());
    // 2
    _fetchQuoteDetails();
  }

  void upvoteQuote() async {
    // TODO: Add a body to upvoteQuote().
    try {
      final updatedQuote = await quoteRepository.upvoteQuote(quoteId);
      emit(QuoteDetailsSuccess(quote: updatedQuote));
    } catch (error) {
      // TODO: Handle error
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
