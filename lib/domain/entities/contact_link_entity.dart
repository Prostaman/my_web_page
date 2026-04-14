enum ContactLinkType {
  email,
  github,
  telegram,
  whatsapp;

  String get label {
    return switch (this) {
      ContactLinkType.email => 'Email',
      ContactLinkType.github => 'GitHub',
      ContactLinkType.telegram => 'Telegram',
      ContactLinkType.whatsapp => 'WhatsApp',
    };
  }
}

class ContactLinkEntity {
  final String url;
  final ContactLinkType type;

  const ContactLinkEntity({
    required this.url,
    required this.type,
  });
}
