namespace: OCR
flow:
  name: test_flow
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
          - first_name
          - last_name
          - phone
          - email
        navigate:
          - FAILURE: on_failure
          - SUCCESS: create_sf_contact
    - create_sf_contact:
        do:
          sf.create_sf_contact:
            - first_name: '${first_name}'
            - last_name: '${last_name}'
            - account: '${account}'
            - phone: '${phone}'
            - email: '${email}'
            - application_path: "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe"
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
        x: 126
        'y': 109
      extract_json_values:
        x: 345
        'y': 107
      create_sf_contact:
        x: 558
        'y': 131
        navigate:
          9752379a-4ca5-4282-db93-dda4812b72ab:
            targetId: 68dd25a4-055c-9f48-5d36-dd2ac6e2cfc9
            port: SUCCESS
          f978d3d7-0c89-5790-402a-1235085ddb9b:
            targetId: 68dd25a4-055c-9f48-5d36-dd2ac6e2cfc9
            port: WARNING
    results:
      SUCCESS:
        68dd25a4-055c-9f48-5d36-dd2ac6e2cfc9:
          x: 781
          'y': 108
