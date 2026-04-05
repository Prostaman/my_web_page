enum ContactLinkType { mail, github, telegram, whatsapp }

class ContactLinkEntity {
  final String url;
  final ContactLinkType type;

  const ContactLinkEntity({
    required this.url,
    required this.type,
  });
}
