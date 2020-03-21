namespace: dataScraping
operation:
  name: tableScraping
  sequential_action:
    gav: com.microfocus.seq:dataScraping.tableScraping:1.0.0
    external: true
  outputs:
  - dataTable:
      robot: true
      value: ${dataTable}
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
