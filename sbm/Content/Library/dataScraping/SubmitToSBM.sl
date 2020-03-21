namespace: dataScraping
flow:
  name: SubmitToSBM
  inputs:
    - aeHost
    - protocol
    - sbmToken
    - sbmProject
    - datetime:
        required: true
    - displayid: DBT001179
    - isActive: 'true'
    - id: '34'
    - ISSUEID: DBT001179
    - TITLE: Online Payment 8821410728 To Capital One Bank 11/08
    - TRANSACTION_AMOUNT: '-8,862.73'
    - TRANSACTION_ID: '19'
    - TRANSACTION_TYPE: BILLPAY
    - TRANSACTION_DATE: 03/14/20
    - SUSPECT: 'true'
  workflow:
    - post_getSbmVersion:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: |-
                ${('{}://{}/jsonapi/getversion'
                .format(protocol, aeHost)
                )}
            - auth_type: null
            - request_character_set: UTF-8
            - headers: "${(\"alfssoauthntoken:{}\\n\"\n\"Content-Length: 0\\n\"\n.format(\n    sbmToken\n    )\n)}"
            - content_type: application/json;charset=UTF-8
        publish:
          - getSbmVersionResult: '${return_result}'
        navigate:
          - SUCCESS: json_path_query
          - FAILURE: on_failure
    - json_path_query:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${getSbmVersionResult}'
            - json_path: version
        publish:
          - versionResult: '${return_result}'
        navigate:
          - SUCCESS: buildSubmitToProject
          - FAILURE: on_failure
    - buildSubmitToProject:
        do:
          io.cloudslang.base.python.python_script:
            - script: |-
                ${('{{"transition": {{"Title": "{}", "DISPLAYID": "{}", "ISACTIVE":"{}", "ENTRY_ID": "{}", "ISSUE_ID":"{}", "TRANSACTION_TITLE":"{}", "TRANSACTION_AMOUNT":"{}", "TRANSACTION_ID":"{}", "TRANSACTION_TYPE":"{}", "POSTING_DATE":"{}", "SUSPECT":"{}" }} }}'
                .format(TITLE, displayid, isActive, id, ISSUEID, TITLE, TRANSACTION_AMOUNT, TRANSACTION_ID, TRANSACTION_TYPE, TRANSACTION_DATE, SUSPECT)
                )}
        publish:
          - submitToProject: '${script}'
        navigate:
          - SUCCESS: post_submitToProject
          - FAILURE: on_failure
    - post_submitToProject:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: |-
                ${('{}://{}/jsonapi/submittoproject/{}'
                .format(protocol, aeHost, sbmProject)
                )}
            - headers: "${(\"alfssoauthntoken:{}\\n\"\n.format(\n    sbmToken\n    )\n)}"
            - body: '${submitToProject}'
            - content_type: application/json
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - sbmVersion: '${versionResult}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      post_getSbmVersion:
        x: 100
        'y': 150
      json_path_query:
        x: 400
        'y': 150
      buildSubmitToProject:
        x: 702
        'y': 150
      post_submitToProject:
        x: 1000
        'y': 150
        navigate:
          9d8ded9a-8f3b-b228-72df-e092778fbc3e:
            targetId: 2bf8b5ed-629a-7311-20af-98ba605ccacb
            port: SUCCESS
    results:
      SUCCESS:
        2bf8b5ed-629a-7311-20af-98ba605ccacb:
          x: 1300
          'y': 150
