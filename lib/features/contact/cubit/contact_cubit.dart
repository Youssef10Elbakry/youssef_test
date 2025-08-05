import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:youssef_test/features/contact/model/contact_info_dm.dart';

import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState>{
  ContactCubit(): super(ContactState());

  Future<void> getContacts() async {
    try {
      emit(ContactLoading());
      List<ContactInfoDM> neededContacts = [];
      if (await FlutterContacts.requestPermission(readonly: true)) {

        List<Contact> contacts = await FlutterContacts.getContacts(
            withProperties: true);
        contacts = contacts.where((contact) {
          return contact.phones.any((phone) => phone.number.startsWith('000'));
        }).toList();
        if(contacts.isEmpty){
          emit(ContactEmpty());
          return;
        }
        for (var contact in contacts) {
          for (var phone in contact.phones) {
            if (phone.number.startsWith('000')) {
              neededContacts.add(
                  ContactInfoDM(contact.displayName, phone.number.substring(3)));
            }
          }
        }
        emit(ContactLoaded(neededContacts));
      }
    }
    catch(e){
      emit(ContactLoadingContactsError("Error while loading contacts "));
    }
    
       
  }


  Future<void> saveContact(String name, String phoneNumber) async {
    try{
    emit(ContactLoading());
    if (await FlutterContacts.requestPermission()) {
    final newContact = Contact()
    ..name.first = name
    ..phones = [Phone(phoneNumber)];
    await FlutterContacts.insertContact(newContact);
    getContacts();
    emit(ContactSaved("Contact Saved Successfully"));
    }
    }
    catch(e){
      emit(ContactSaveError("Error while saving contact"));
    }
  }

  Future<void> deleteContact(String targetContact) async {
    try {
      if (await FlutterContacts.requestPermission(readonly: true)) {
        List<Contact> contacts = await FlutterContacts.getContacts(
            withProperties: true);
        String normalizedTarget = targetContact.replaceAll(RegExp(r'\D'), '');

        for (Contact contact in contacts) {
          for (Phone phone in contact.phones) {
            String normalizedPhone = phone.number.replaceAll(RegExp(r'\D'), '').substring(3);
            if (normalizedTarget == normalizedPhone) {
              await FlutterContacts.deleteContact(contact);
              emit(ContactDeleted());
              getContacts();
              return;
            }
          }
        }
      }
    }
    catch(e){
      emit(ContactDeleteError("Error while deleting contact"));
    }
  }

}