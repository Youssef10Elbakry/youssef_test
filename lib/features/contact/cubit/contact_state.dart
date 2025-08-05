import 'package:equatable/equatable.dart';
import 'package:youssef_test/features/contact/model/contact_info_dm.dart';

class ContactState extends Equatable{
  @override
  List<Object?> get props => [];

}

class ContactLoaded extends ContactState{
    List<ContactInfoDM> contacts;
    ContactLoaded(this.contacts);

    @override
    List<Object?> get props => [contacts];
}

class ContactSaved extends ContactState{
  String message;
  ContactSaved(this.message);

  @override
  List<Object?> get props => [message];
  }

class ContactError extends ContactState{
  String message;
  ContactError(this.message);

  @override
  List<Object?> get props => [message];
}

class ContactLoading extends ContactState{

}

class ContactSaveError extends ContactError{
  ContactSaveError(super.message);
}

class ContactDeleteError extends ContactError{
  ContactDeleteError(super.message);

}

class ContactLoadingContactsError extends ContactError{
  ContactLoadingContactsError(super.message);

}

class ContactEmpty extends ContactState{

}

class ContactDeleted extends ContactState{

}

