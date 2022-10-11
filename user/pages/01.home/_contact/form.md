---
title: Contact
form:
    name: contact-form
    action: /home
    fields:
        - name: name
          label: Votre nom
          classes: form-control
          placeholder: 'Entrez votre nom'
          autofocus: 'on'
          autocomplete: 'on'
          type: text
          position: left
          validate:
              required: true
        - name: email
          label: Email
          classes: form-control
          placeholder: 'Entrez votre adresse mail'
          type: email
          position: left
          validate:
              required: true
        - name: message
          label: Message
          placeholder: 'Votre message'
          type: textarea
          classes: form-control
          position: right
          validate:
              required: true
    buttons:
        - type: submit
          classes: 'btn btn-primary btn-lg'
          value: Envoyer
    process:
        - email:
              from: '{{ config.plugins.email.from }}'
              to: ['{{ config.plugins.email.to }}', '{{ form.value.email }}']
              subject: '[Website] Message de : {{ form.value.name|e }}'
              body: '{% include ''forms/data.html.twig'' %}'
        - save:
              fileprefix: feedback-
              dateformat: Ymd-His-u
              extension: txt
              body: '{% include ''forms/data.txt.twig'' %}'
        - message: 'Merci pour votre message ! Une copie du mail vous atend dans votre boite mail.'
published: false
---

## Contacez-nous

### Une demande, une lettre de fan... N'hésitez pas !
