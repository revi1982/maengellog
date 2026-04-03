// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'DifettiLog';

  @override
  String get navHome => 'Panoramica';

  @override
  String get navHistory => 'Cronologia';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String get actionAdd => 'Aggiungi voce';

  @override
  String get actionSave => 'Salva';

  @override
  String get actionCancel => 'Annulla';

  @override
  String get actionDelete => 'Elimina';

  @override
  String get actionEdit => 'Modifica';

  @override
  String get actionExport => 'Esporta PDF';

  @override
  String get statTotal => 'Totale';

  @override
  String get statThisWeek => 'Questa settimana';

  @override
  String get statLastEntry => 'Ultima voce';

  @override
  String get statMostCommon => 'Tipo più frequente';

  @override
  String get statEntries => 'Voci';

  @override
  String get noEntriesTitle => 'Nessuna voce presente';

  @override
  String get noEntriesSubtitle => 'Tocca + per creare la prima voce';

  @override
  String get confirmDeleteTitle => 'Eliminare la voce?';

  @override
  String get confirmDeleteMessage =>
      'Questa voce verrà eliminata definitivamente.';

  @override
  String get confirmDeleteConfirm => 'Elimina';

  @override
  String get toastSaved => 'Salvato';

  @override
  String get toastDeleted => 'Eliminato';

  @override
  String get toastExportDone => 'PDF creato';

  @override
  String get fieldDate => 'Data';

  @override
  String get fieldTime => 'Ora';

  @override
  String get fieldDescription => 'Descrizione';

  @override
  String get fieldDescriptionHint => 'Cos\'è stato riscontrato?';

  @override
  String get fieldPhoto => 'Aggiungi foto';

  @override
  String get fieldNotes => 'Note';

  @override
  String get fieldNotesHint => 'Informazioni aggiuntive…';

  @override
  String get fieldLocation => 'Luogo/Stanza';

  @override
  String get fieldLocationHint => 'es. Cucina, Bagno, Soggiorno…';

  @override
  String get fieldWitnesses => 'Testimoni';

  @override
  String get fieldWitnessesHint =>
      'es. Inquilino precedente, amministrazione condominiale…';

  @override
  String get fieldCategory => 'Categoria';

  @override
  String get fieldMeterReading => 'Lettura contatore';

  @override
  String get fieldMeterReadingHint => 'es. 12345 kWh';

  @override
  String get fieldKeyCount => 'Numero di chiavi';

  @override
  String get categoryWall => 'Parete/Soffitto';

  @override
  String get categoryFloor => 'Pavimento';

  @override
  String get categoryWindow => 'Finestra/Porta';

  @override
  String get categoryPlumbing => 'Impianto idraulico';

  @override
  String get categoryElectric => 'Impianto elettrico';

  @override
  String get categoryOther => 'Altro';

  @override
  String get sectionHistory => 'CRONOLOGIA';

  @override
  String get sectionStatistics => 'STATISTICHE';

  @override
  String get sectionDetails => 'DETTAGLI';

  @override
  String get sectionPremium => 'PREMIUM';

  @override
  String get sectionLegal => 'LEGALE';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsImpressum => 'Note legali';

  @override
  String get settingsDatenschutz => 'Informativa sulla privacy';

  @override
  String get settingsAgb => 'Condizioni di utilizzo';

  @override
  String get settingsVersion => 'Versione';

  @override
  String get settingsPurchase => 'Sblocca a vita';

  @override
  String get settingsRestore => 'Ripristina acquisto';

  @override
  String get paywallTitle => 'Sblocca una volta sola';

  @override
  String get paywallSubtitle => 'Esporta PDF + Rimuovi tutta la pubblicità';

  @override
  String get paywallFeature1 => 'Verbale di consegna professionale in PDF';

  @override
  String get paywallFeature2 => 'Nessuna pubblicità';

  @override
  String get paywallFeature3 => 'Pagamento unico – nessun abbonamento';

  @override
  String get paywallFeature4 => 'Sostieni lo sviluppo futuro';

  @override
  String get paywallBuyButton => 'Sblocca ora';

  @override
  String get paywallRestoreButton => 'Già acquistato';

  @override
  String get paywallLoadingPrice => 'Caricamento prezzo…';

  @override
  String get paywallSuccess => 'Sbloccato! Grazie.';

  @override
  String get paywallError => 'Acquisto non riuscito. Riprova.';

  @override
  String get onboardingNext => 'Avanti →';

  @override
  String get onboardingStart => 'Accetta e inizia →';

  @override
  String get onboardingPrivacyConsent => 'Accetto l\'informativa sulla privacy';

  @override
  String get onboardingPrivacyLink => 'Leggi l\'informativa sulla privacy';

  @override
  String get onboardingPrivacyTitle => 'Privacy';

  @override
  String get onboardingPrivacyBody =>
      'Questa app memorizza tutti i dati esclusivamente sul tuo dispositivo. Nessun cloud, nessun account, nessuna condivisione.';

  @override
  String get onboardingHeadline0 => 'Deposito a rischio?';

  @override
  String get onboardingBody0 =>
      'La mancanza di documentazione alla riconsegna può costare cara. Registra i difetti con cura – fin dal primo giorno.';

  @override
  String get onboardingHeadline1 => 'Tutto documentato';

  @override
  String get onboardingBody1 =>
      'Foto, timestamp, letture dei contatori e dettagli della stanza – registrati in modo completo per quando conta.';

  @override
  String get onboardingHeadline2 => '100% Offline e privato';

  @override
  String get onboardingBody2 =>
      'Nessun cloud. Nessun account. Tutti i dati restano sul tuo dispositivo.';

  @override
  String get onboardingHeadline3 => 'PDF con un solo tocco';

  @override
  String get onboardingBody3 =>
      'Un tocco genera un verbale di consegna professionale per il proprietario o l\'amministrazione.';

  @override
  String get onboardingHeadline4 => 'Privacy';

  @override
  String get onboardingBody4 =>
      'Questa app memorizza tutti i dati esclusivamente sul tuo dispositivo. Nessun cloud, nessun account, nessuna condivisione.';

  @override
  String get permissionCameraAllow => 'Consenti accesso alla fotocamera';

  @override
  String get permissionDeny => 'Non ora';

  @override
  String get pdfTitle => 'DifettiLog – Verbale di consegna';

  @override
  String get pdfCreatedAt => 'Creato il';

  @override
  String get pdfTotalEntries => 'Voci totali';

  @override
  String get pdfPage => 'Pagina';

  @override
  String get pdfOf => 'di';

  @override
  String get errorGeneral => 'Qualcosa è andato storto.';

  @override
  String get errorTryAgain => 'Riprova';

  @override
  String get adRewardButton => 'Guarda pubblicità';

  @override
  String get adRewardSuccess => 'Banner nascosto per 24 h.';

  @override
  String get adRewardNotAvailable => 'Nessuna pubblicità disponibile.';
}
