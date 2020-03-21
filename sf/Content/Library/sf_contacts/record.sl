namespace: sf_contacts
operation:
  name: record
  sequential_action:
    gav: com.microfocus.seq:sf_contacts.record:1.0.0
    skills:
    - Web
    settings:
      windows:
        active: false
      web:
        active: false
        close_on_exit: false
    steps:
    - step:
        id: '1'
        object_path: Browser("Browser")
        action: Navigate
        default_args: '"https://login.salesforce.com/"'
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '8586354'
    - step:
        id: '2'
        object_path: Browser("Browser").Page("Login | Salesforce").WebEdit("username")
        action: Set
        default_args: '"crisandaniel@microfocus.com"'
        snapshot: .\Snapshots\ssf2.html
        highlight_id: '10000000'
    - step:
        id: '3'
        object_path: Browser("Browser").Page("Login | Salesforce").WebEdit("pw")
        action: SetSecure
        default_args: '"B33f34t3r???"'
        snapshot: .\Snapshots\ssf3.html
        highlight_id: '10000000'
    - step:
        id: '4'
        object_path: Browser("Browser").Page("Login | Salesforce").WebButton("Log
          In")
        action: Click
        snapshot: .\Snapshots\ssf4.html
        highlight_id: '10000000'
    - step:
        id: '5'
        object_path: Browser("Browser").Page("Home Page ~ Salesforce").Link("Contacts")
        action: Click
        snapshot: .\Snapshots\ssf5.html
        highlight_id: '10000000'
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: Browser
      name: Browser
      properties:
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '1'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 1
          type: creationtime
      smart_identification:
        base_filter: ''
        optional_filter: ''
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments: ''
      visual_relations: ''
      last_update_time: Wednesday, March 18, 2020 9:26:14 AM
      child_objects:
      - object:
          class: Page
          name: Login | Salesforce
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://login.salesforce.com
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://login.salesforce.com
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Login | Salesforce
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '10008'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Wednesday, March 18, 2020 9:26:14 AM
          child_objects:
          - object:
              class: WebEdit
              name: username
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //INPUT[@id="username"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '338'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '281'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '245'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: email
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: username
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: username
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '43'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: input r4 wide mb16 mt8 username
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '352'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '245'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, March 18, 2020 9:26:14 AM
              child_objects: []
          - object:
              class: WebEdit
              name: pw
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //INPUT[@id="password"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '338'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '363'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '245'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: password
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: pw
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: password
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '43'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: input r4 wide mb16 mt8 password
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '434'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '245'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, March 18, 2020 9:26:14 AM
              child_objects: []
          - object:
              class: WebButton
              name: Log In
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //INPUT[@id="Login"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '338'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: '422'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '245'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Log In
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: submit
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Log In
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Login
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '43'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: button r4 wide primary
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '493'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '245'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, March 18, 2020 9:26:14 AM
              child_objects: []
      - object:
          class: Page
          name: Home Page ~ Salesforce
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://eu19.salesforce.com/setup/forcecomHomepage.apexp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://eu19.salesforce.com/setup/forcecomHomepage.apexp?setupid=ForceCom
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Home Page ~ Salesforce - Developer Edition
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '10008'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Wednesday, March 18, 2020 9:26:14 AM
          child_objects:
          - object:
              class: Link
              name: Contacts
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@id="Contact_Tab"]/A[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '55'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: '89'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '459'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Contacts
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Contacts
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://eu19.salesforce.com/003/o
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '15'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '160'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '459'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - role
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, March 18, 2020 9:26:14 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
