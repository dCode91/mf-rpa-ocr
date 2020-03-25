namespace: utility
operation:
  name: do_not
  python_action:
    use_jython: false
    script: "import time\n# do not remove the execute function \n\ndef execute(): \n    time.sleep(2.4)\n    \n    # code goes here\n# you can add additional helper methods below."
  results:
    - SUCCESS
