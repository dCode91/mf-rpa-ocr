namespace: sf
flow:
  name: bc
  workflow:
    - business_card_reader:
        do:
          sf.business_card_reader:
            - image_path: "C:\\Program Files\\Micro Focus\\Robotic Process Automation Designer\\python\\python-3.8.0\\\\new\\\\test_image\\\\034.JPG"
        publish:
          - email: '${email_default[2:-2]}'
          - first_name: '${name_trunc.rsplit(" ",1)[0][1:]}'
          - last_name: '${name_trunc}'
          - organization: '${org_default[1:-1]}'
          - phone: "${\"\".join(phone_binary.split(',')).replace(\"'\",\"\").replace(\"  \", \" \").replace(\" \",\"-\")[2:-3]}"
        navigate:
          - SUCCESS: create_sf_contact
    - create_sf_contact:
        do:
          sf.create_sf_contact:
            - first_name: '${first_name}'
            - last_name: '${last_name}'
            - account: '${organization}'
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
      business_card_reader:
        x: 77
        'y': 85
      create_sf_contact:
        x: 339
        'y': 90
        navigate:
          8606fe08-2e58-b169-69f6-7eedb655fc80:
            targetId: f66d92d5-dbb9-80e5-55c5-81412e663e86
            port: SUCCESS
          f5d6a0b8-4924-cb3a-10d0-d92ae14e1b33:
            targetId: f66d92d5-dbb9-80e5-55c5-81412e663e86
            port: WARNING
    results:
      SUCCESS:
        f66d92d5-dbb9-80e5-55c5-81412e663e86:
          x: 604
          'y': 80
