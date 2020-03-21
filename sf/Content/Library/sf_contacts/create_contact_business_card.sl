namespace: sf_contacts
flow:
  name: create_contact_business_card
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
    results:
      SUCCESS:
        519418b6-8110-ce85-4f04-0ed4c4815cc4:
          x: 778
          'y': 120
