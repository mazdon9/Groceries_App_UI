abstract class LocaleEvent {}

class OnChangeLocaleEvent extends LocaleEvent {
  final String locale;

  OnChangeLocaleEvent({required this.locale});
}

class OnInitLocalEvent extends LocaleEvent {}
