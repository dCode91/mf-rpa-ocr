namespace: sf_contacts
flow:
  name: test
  workflow:
    - record:
        do:
          sf_contacts.record: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      record:
        x: 115
        'y': 138
        navigate:
          6ae1588a-7adc-b7c3-967e-cb1984efd08c:
            targetId: b44a3e17-f6bf-59fb-dbb1-557164c91f96
            port: WARNING
          bbafac91-4538-efc2-21d6-fc7f391bb814:
            targetId: b44a3e17-f6bf-59fb-dbb1-557164c91f96
            port: SUCCESS
    results:
      SUCCESS:
        b44a3e17-f6bf-59fb-dbb1-557164c91f96:
          x: 337
          'y': 90
