namespace: dataScraping
operation:
  name: generate_empty_list
  inputs:
    - start
    - end
  python_action:
    use_jython: false
    script: "# do not remove the execute function \ndef execute(start, end): \n    listValue = list(range(int(start), int(end)))\n    return locals()\n# you can add additional helper methods below."
  outputs:
    - listValue: '${listValue}'
  results:
    - SUCCESS
