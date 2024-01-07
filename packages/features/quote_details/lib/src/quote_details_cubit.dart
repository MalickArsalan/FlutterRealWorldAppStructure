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

  Future<void> _fetchQuoteDetails() async {
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
    await _executeQuoteUpdateOperation(
        () => quoteRepository.upvoteQuote(quoteId));
  }

  void downvoteQuote() async {
    await _executeQuoteUpdateOperation(
        () => quoteRepository.downvoteQuote(quoteId));
  }

  void unvoteQuote() async {
    await _executeQuoteUpdateOperation(
        () => quoteRepository.unvoteQuote(quoteId));
  }

  void favoriteQuote() async {
    await _executeQuoteUpdateOperation(
        () => quoteRepository.favoriteQuote(quoteId));
  }

  void unfavoriteQuote() async {
    await _executeQuoteUpdateOperation(
        () => quoteRepository.unfavoriteQuote(quoteId));
  }

  Future<void> _executeQuoteUpdateOperation(
      Future<Quote> Function() updateQuote) async {
    try {
      final updatedQuote = await updateQuote();
      emit(QuoteDetailsSuccess(quote: updatedQuote));
    } catch (error) {
      final lastState = state;
      if (lastState is QuoteDetailsSuccess) {
        emit(QuoteDetailsSuccess(
          quote: lastState.quote,
          quoteUpdateError: error,
        ));
      }
    }
  }
}
