namespace: OCR
operation:
  name: abbyy_business_card_reader
  inputs:
    - app_id
    - pwd
    - file_path
  python_action:
    use_jython: false
    script: "# do not remove the execute function \nimport importlib\nfrom io import BytesIO\nabbyy = importlib.import_module('ABBYY')\n\ndef execute(app_id, pwd, file_path): \n    input_file = open(file_path, 'rb')\n    post_file = {input_file.name: input_file}\n    ocr_engine = abbyy.CloudOCR(application_id=app_id, password=pwd)\n    task = ocr_engine.processBusinessCard(post_file, exportFormat='xml', language='English')\n    result = ocr_engine.wait_for_task(task)\n    url = result.get('resultUrl')\n    results = ocr_engine.session.get(url)\n    content = results.content.decode(\"utf-8\").replace(\"\\\\xe2\\\\x80\\\\x99s\",\"'\")\n    return locals()\n    # code goes here\n# you can add additional helper methods below."
  outputs:
    - result: '${result}'
    - streams: '${streams}'
    - url: '${url}'
    - results: '${results}'
    - content: '${content}'
  results:
    - SUCCESS
