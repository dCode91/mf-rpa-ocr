namespace: salesforce_contacts
flow:
  name: add_new_contacts
  inputs:
    - file_name: 066.jpg
  workflow:
    - create_contact_sf:
        do:
          utility.do_not: []
        publish: []
        navigate:
          - SUCCESS:
              next_step: SUCCESS
              ROI: '12'
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      create_contact_sf:
        x: 572
        'y': 95
        navigate:
          9570bfb7-9109-8ff9-2d30-470383a0c913:
            targetId: ef66c271-8e07-1dc4-606c-f07db29cd04e
            port: SUCCESS
    results:
      SUCCESS:
        ef66c271-8e07-1dc4-606c-f07db29cd04e:
          x: 817
          'y': 94
