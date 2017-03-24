{%- from "nsca/map.jinja" import nsca with context %}

{{ nsca.server.pkg }}:
  pkg.installed: []
  service.running:
    - enable: True

{{ nsca.server.cfg }}:
  file.managed:
    - source: salt://nsca/files/nsca.cfg
    - template: jinja
    - context:
        config: {{ nsca.server }}
        password: {{ nsca.password if "password" in nsca else "" }}
        decryption_method: {{ nsca.cryption_method }}
    - watch_in:
      - service: nsca
