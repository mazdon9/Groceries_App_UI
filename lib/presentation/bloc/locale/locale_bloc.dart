import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/data/datasources/local/local_storage.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/presentation/bloc/locale/locale_event.dart';
import 'package:groceries_app/presentation/bloc/locale/locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocalStorage localStorage = getIt<LocalStorage>();

  LocaleBloc() : super(LocaleState()) {
    on<OnChangeLocaleEvent>(_onChangeLocaleEvent);
    on<OnInitLocalEvent>(_onInitLocale);
    add(OnInitLocalEvent());
  }

  Future<void> _onChangeLocaleEvent(
    OnChangeLocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    await localStorage.setLocale(event.locale);
    emit(state.copyWith(locale: event.locale));
  }

  Future<void> _onInitLocale(
    OnInitLocalEvent event,
    Emitter<LocaleState> emit,
  ) async {
    final locale = await localStorage.getLocale();
    if (locale != null) {
      emit(state.copyWith(locale: locale));
    }
  }
}
