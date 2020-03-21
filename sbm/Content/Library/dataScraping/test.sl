namespace: dataScraping
flow:
  name: test
  workflow:
    - generate_empty_list:
        do:
          dataScraping.generate_empty_list:
            - start: '0'
            - end: '7'
        publish:
          - list
        navigate:
          - SUCCESS: test
    - test:
        do:
          io.cloudslang.base.strings.append:
            - origin_string: '${rowData}'
            - text: x
            - rowData: '${rowData}'
        publish:
          - displayId: '${rowData.split("|")[0]}'
          - isActive: '${rowData.split("|")[1]}'
          - id: '${rowData.split("|")[2]}'
          - issueId: '${rowData.split("|")[3]}'
          - title: '${rowData.split("|")[4]}'
          - transAmmont: '${rowData.split("|")[5]}'
          - transId: '${rowData.split("|")[6]}'
          - transType: '${rowData.split("|")[7]}'
          - suspect: '${rowData.split("|")[8]}'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      generate_empty_list:
        x: 151
        'y': 74
      test:
        x: 348
        'y': 278
        navigate:
          cb1493c5-0a37-8e99-1ba9-42e3ec3d4d86:
            targetId: 7775081d-a3c6-35b9-d1c4-6c2156c8a86b
            port: SUCCESS
    results:
      SUCCESS:
        7775081d-a3c6-35b9-d1c4-6c2156c8a86b:
          x: 440
          'y': 60
