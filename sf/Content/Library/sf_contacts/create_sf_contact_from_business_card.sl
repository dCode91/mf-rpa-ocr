namespace: sf_contacts
flow:
  name: create_sf_contact_from_business_card
  workflow:
    - abbyy_business_card_reader:
        do:
          OCR.abbyy_business_card_reader:
            - app_id: 9244aa8e-3cd6-47d7-9a0d-7c340f05cacb
            - pwd: y5T/VngKJh0K9abMGbRQ2EgL
            - file_path: "C:\\Program Files\\Micro Focus\\Robotic Process Automation Designer\\python\\python-3.8.0\\\\new\\\\test_image\\\\adi.JPG"
        publish:
          - content
        navigate:
          - SUCCESS: extract_json_values
    - extract_json_values:
        do:
          utility.extract_json_values:
            - content: '${content}'
        publish:
          - account
          - name
          - phone
          - email
          - first_name
          - last_name
        navigate:
          - FAILURE: on_failure
          - SUCCESS: create_sf_contact
    - create_sf_contact:
        do:
          sf_contacts.create_sf_contact:
            - first_name: '${first_name}'
            - last_name: '${last_name}'
            - email: '${email}'
            - phone: '${phone}'
            - account: '${account}'
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
      abbyy_business_card_reader:
        x: 128
        'y': 119
      extract_json_values:
        x: 395
        'y': 115
      create_sf_contact:
        x: 603
        'y': 120
        navigate:
          947c7e42-f1f2-f803-2874-a2a5d33a7cae:
            targetId: 519418b6-8110-ce85-4f04-0ed4c4815cc4
            port: WARNING
          d6076daf-d199-f08e-fae9-a222ee96be16:
            targetId: 519418b6-8110-ce85-4f04-0ed4c4815cc4
            port: SUCCESS
    results:
      SUCCESS:
        519418b6-8110-ce85-4f04-0ed4c4815cc4:
          x: 760
          'y': 29
