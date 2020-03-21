########################################################################################################################
#!!
#! @description: flow001 description
#!
#! @output flowOutput0: table ID
#! @output flowOutput1: item ID
#!!#
########################################################################################################################
namespace: dataScraping
flow:
  name: GatherSuspects
  inputs:
    - idpHost:
        default: 'hawksbill.microfocuscloud.com:8443'
        required: false
    - aeHost:
        default: hawksbill.microfocuscloud.com
        required: false
    - tableId: '1006'
    - itemId: '1'
    - tableRecId: '0:1'
    - protocol: https
    - password:
        default: GlassSlipper
        required: false
        sensitive: true
    - sbmProject: USR_LEGAL_ACTIONS.LEGAL_ACTIONS_PROJECT
    - rowData
  workflow:
    - get_time:
        do:
          io.cloudslang.base.datetime.get_time:
            - date_format: 'yyyy-M-dd HH:mm:ss'
        publish:
          - isoDatetime: "${\"{}T{}TZD\".format(output.split(' ')[0], output.split(' ')[1])}"
          - datetim: output_0
        navigate:
          - SUCCESS: post_GetToken
          - FAILURE: on_failure
    - post_GetToken:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: |-
                ${('{}://{}/idp/services/rest/TokenService/'
                .format(protocol, idpHost)
                )}
            - request_character_set: UTF-8
            - headers: 'Accept:application/json'
            - body: |-
                ${('{{"credentials": {{ "username" : "RPA", "password":"{}"}}}}'
                .format(password)
                )}
            - content_type: application/json;charset=UTF-8
        publish:
          - SBMAuth: '${return_result}'
        navigate:
          - SUCCESS: getSbmToken
          - FAILURE: on_failure
    - getSbmToken:
        do:
          io.cloudslang.base.json.get_value:
            - json_input: '${SBMAuth}'
            - json_path: 'token,value'
        publish:
          - sbmToken: '${return_result}'
        navigate:
          - SUCCESS: SubmitToSBM_1
          - FAILURE: on_failure
    - SubmitToSBM_1:
        do:
          dataScraping.SubmitToSBM:
            - aeHost: '${aeHost}'
            - protocol: '${protocol}'
            - sbmToken: '${sbmToken}'
            - sbmProject: '${sbmProject}'
            - datetime: '${isoDatetime}'
            - displayid: '${rowData.split("|")[0]}'
            - isActive: '${rowData.split("|")[1]}'
            - id: '${rowData.split("|")[2]}'
            - ISSUEID: '${rowData.split("|")[3]}'
            - TITLE: '${rowData.split("|")[4]}'
            - TRANSACTION_AMOUNT: '${rowData.split("|")[5]}'
            - TRANSACTION_ID: '${rowData.split("|")[6]}'
            - TRANSACTION_TYPE: '${rowData.split("|")[7]}'
            - TRANSACTION_DATE: '${rowData.split("|")[8]}'
            - SUSPECT: '${rowData.split("|")[9]}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  outputs:
    - flowOutput0: '${tableId}'
    - flowOutput1: '${itemId}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      get_time:
        x: 100
        'y': 150
      post_GetToken:
        x: 400
        'y': 150
      getSbmToken:
        x: 700
        'y': 150
      SubmitToSBM_1:
        x: 1000
        'y': 150
        navigate:
          ceeef48e-c069-572b-51fe-cd7e0c22839e:
            targetId: 9bd17a08-378d-4a28-934e-a37770260411
            port: SUCCESS
    results:
      SUCCESS:
        9bd17a08-378d-4a28-934e-a37770260411:
          x: 1300
          'y': 150
