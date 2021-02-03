// ignore: avoid_classes_with_only_static_members
abstract class Strings {
  static String errorCPFOrCNPJEmpty = 'Insira seu CPF ou CNPJ';
  static String errorCPFInvalid = 'CPF inválido';
  static String errorCNPJInvalid = 'CNPJ inválido';
  static String requiredField = "O campo é obrigatório!";

  //Failures
  static String readCacheError =
      'Aconteceu um erro ao ler dados localmente, por favor, tente novamente.';
  static String writeCacheError =
      'Aconteceu um erro ao escrever dados localmente, por favor, tente novamente.';
  static String localizationError =
      'Aconteceu um erro ao pegar sua localização, por favor, tente novamente.';

  //Information texts
  static String loadingLocalizationMessage =
      'Aguarde enquanto obtemos sua localização...';

  //LOGIN MESSAGES
  static String emailLabel = "E-mail";
  static String emailHint = "Informe seu e-mail";
  static String phoneLabel = "Número de telefone";
  static String phoneHint = "(99) 99999-9999";
  static String completeNameLabel = "Nome completo";
  static String completeNameHint = "Informe seu nome completo";
  static String passwordLabel = "Senha";
  static String passwordHint = "Informe sua senha";
  static String passwordConfirmationLabel = "Confirmação de senha";
  static String passwordConfirmationHint = "Confirme a sua senha";
  static String continueButton = "Continuar";
  static String or = "ou";
  static String createYourAccount = "Crie sua conta";
  static String logInLabel = "Entrar";
  static String signUpLabel = "Cadastrar";

  //FEEDBACK MESSAGES
  static String tryAgainLabel = "Tentar novamente";
  static String backToInitialPageLabel = "Voltar para a tela inicial";
  static String createAccountErrorLabel =
      "Não foi possível ser feita a criação de conta";
  static String createAccountSuccessLabel = "Conta criada com sucesso!";
  static String createAccountSuccessLabelDescription =
      "Em breve enviaremos a confirmação de sua conta pelo e-mail!";

  //SEARCH SCREEN
  static String searchHotels = "Pesquisar Hotéis";
  static String whereAreYouGoing = "Para onde você vai?";
  static String guests = "Hóspedes";
  static String children = "Crianças";
  static String adults = "Adultos";
  static String checkIn = "Entrada";
  static String checkOut = "Saída";

  //FAVORITE SCREEN
  static String favoritesPlacesTitle = "Favoritos";
  static String favoritesPlacesMessage =
      "Reúna seus lugares favoritos tocando no ícone do coração e tenha-os salvos aqui!";

  //SCHEDULES SCREEN
  static String schedulesPlacesTitle = "Viagens";
  static String schedulesPlacesMessage =
      "Tenha todas viagens que você já fez na palma das suas mãos, podendo ver suas viagens anteriores e que estão agendadas.";
  static String datePickerHintText = 'dd/mm/aaaa';
}
