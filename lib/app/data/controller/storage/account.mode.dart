// import 'package:dartz/dartz.dart';

// import '../../../core/exception/exception.dart';
// import '../../../utils/serviceLocator/service.locator.dart';
// import '../../repository/account.mode.dart';

// class AccountModeController {

//   final AccountModeRepo _accountModeRepo;
//   static AccountModeController? _instance;

//   AccountModeController._priv() : _accountModeRepo = locator<AccountModeRepo>();

//   factory AccountModeController() => _instance ??= AccountModeController._priv();

//   Future<Either<Failure, bool>> getAccountMode () async => _accountModeRepo.getMode();

//   Future<Either<Failure, bool>> setAccountMode (bool mode) async => _accountModeRepo.storeMode(mode);

// }