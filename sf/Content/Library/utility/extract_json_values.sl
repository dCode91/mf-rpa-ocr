namespace: utility
flow:
  name: extract_json_values
  inputs:
    - content
  workflow:
    - convert_xml_to_json:
        do:
          io.cloudslang.base.xml.convert_xml_to_json:
            - xml: "${'<document' + content.split('<document')[1]}"
        publish:
          - json: '${return_result.replace("@type","type")}'
        navigate:
          - SUCCESS: get_name
          - FAILURE: on_failure
    - get_name:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: "$..field[?(@.type == 'Name')].value"
        publish:
          - name: "${return_result.split(',')[0].replace('\"','').replace(\"[\",'').replace(']','').title()}"
        navigate:
          - SUCCESS: get_account
          - FAILURE: on_failure
    - get_account:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: "$..field[?(@.type == 'Company')].value"
        publish:
          - account: "${return_result.split(',')[0].replace('\"','').replace(\"[\",'').replace(']','').title()}"
        navigate:
          - SUCCESS: get_phone
          - FAILURE: on_failure
    - get_phone:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: "$..field[?(@.type == 'Phone')].value"
        publish:
          - phone: "${return_result.split(',')[0].replace('\"','').replace(\"[\",'').replace(']','')}"
        navigate:
          - SUCCESS: get_email
          - FAILURE: on_failure
    - get_email:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: "$..field[?(@.type == 'Email')].value"
        publish:
          - email: "${return_result.split(',')[0].replace('\"','').replace(\"[\",'').replace(']','')}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - account: '${account}'
    - name: '${name}'
    - phone: '${phone}'
    - email: '${email}'
    - first_name: '${name.rsplit(" ",1)[0]}'
    - last_name: '${name.rsplit(" ",1)[1]}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      convert_xml_to_json:
        x: 57
        'y': 97
      get_name:
        x: 293
        'y': 100
      get_account:
        x: 506
        'y': 102
      get_phone:
        x: 825
        'y': 106
      get_email:
        x: 714
        'y': 281
        navigate:
          55ddf42c-3a48-8bd3-d95c-74c94b9728d2:
            targetId: d482bf64-b294-b939-7727-754abdc8c6a3
            port: SUCCESS
    results:
      SUCCESS:
        d482bf64-b294-b939-7727-754abdc8c6a3:
          x: 891
          'y': 279
