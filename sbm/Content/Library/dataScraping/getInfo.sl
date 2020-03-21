namespace: dataScraping
flow:
  name: getInfo
  workflow:
    - tableScraping:
        do:
          dataScraping.tableScraping: []
        publish:
          - dataTable
          - rowCount: '${str(len(dataTable.split(";"))-1)}'
        navigate:
          - SUCCESS: list_generator
          - WARNING: list_generator
          - FAILURE: on_failure
    - list_generator:
        do:
          dataScraping.generate_empty_list:
            - start: '0'
            - end: '${rowCount}'
        publish:
          - listValue: '${listValue[1:-1]}'
        navigate:
          - SUCCESS: GatherSuspects
    - GatherSuspects:
        parallel_loop:
          for: i in listValue
          do:
            dataScraping.GatherSuspects:
              - rowData: '${dataTable.split(";")[int(i)]}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      tableScraping:
        x: 55
        'y': 131
      list_generator:
        x: 263
        'y': 128
      GatherSuspects:
        x: 474
        'y': 126
        navigate:
          3315dc39-dfd2-07c4-3377-672fb222084d:
            targetId: feda83e5-c2d0-540e-e60c-ebd3c1978b54
            port: SUCCESS
    results:
      SUCCESS:
        feda83e5-c2d0-540e-e60c-ebd3c1978b54:
          x: 729
          'y': 126
