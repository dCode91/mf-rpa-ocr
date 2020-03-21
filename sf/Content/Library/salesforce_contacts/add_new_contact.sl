namespace: salesforce_contacts
flow:
  name: add_new_contact
  workflow:
    - abbyy_business_card_reader:
        do:
          OCR.abbyy_business_card_reader:
            - app_id: 9244aa8e-3cd6-47d7-9a0d-7c340f05cacb
            - pwd: y5T/VngKJh0K9abMGbRQ2EgL
            - file_path: "C:\\Program Files\\Micro Focus\\Robotic Process Automation Designer\\python\\python-3.8.0\\\\new\\\\test_image\\\\066.JPG"
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
          - SUCCESS: create_contact_sf
    - create_contact_sf:
        do:
          salesforce_contacts.create_contact_sf:
            - account: '${account}'
            - first_name: '${first_name}'
            - last_name: '${last_name}'
            - phone: '${phone}'
            - email: '${email}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      abbyy_business_card_reader:
        x: 81
        'y': 109
      extract_json_values:
        x: 336
        'y': 109
      create_contact_sf:
        x: 536
        'y': 121
        navigate:
          87f89653-5ec1-cee7-c3fd-0b3c33c28f01:
            targetId: 24b34766-89f5-a86d-a8ba-e2b8d451626a
            port: SUCCESS
          19b9bedd-6987-c11c-ecf0-f0d584326dee:
            targetId: 24b34766-89f5-a86d-a8ba-e2b8d451626a
            port: WARNING
    results:
      SUCCESS:
        24b34766-89f5-a86d-a8ba-e2b8d451626a:
          x: 737
          'y': 111
