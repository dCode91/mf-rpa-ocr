namespace: utility
flow:
  name: install_python_package
  workflow:
    - install_python_modules:
        do:
          utility.install_python_modules:
            - packages: abbyy
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      install_python_modules:
        x: 54
        'y': 118
        navigate:
          2a4c0968-6e0d-71ee-ffb8-0dc639dca6cb:
            targetId: 23770224-2bb9-f04b-62e3-0791e2453bc5
            port: SUCCESS
    results:
      SUCCESS:
        23770224-2bb9-f04b-62e3-0791e2453bc5:
          x: 297
          'y': 120
