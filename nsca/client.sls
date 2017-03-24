{%- from "nsca/map.jinja" import nsca with context %}

NSCA Client:
  pkg.installed:
    - name: {{ nsca.client.pkg }}

{{ nsca.client.cfg }}:
  file.managed:
    - source: salt://nsca/files/send_nsca.cfg
    - template: jinja
    - context:
        config: {{ nsca.client }}
        password: {{ nsca.password if "password" in nsca else "" }}
        encryption_method: {{ nsca.cryption_method }}
