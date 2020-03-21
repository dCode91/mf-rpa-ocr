namespace: utility
operation:
  name: install_python_modules
  inputs:
    - packages
  python_action:
    use_jython: false
    script: "import subprocess\nimport sys\nimport ssl\n\n# do not remove the execute function \ndef execute(packages): \n    # leave empty string if you don't need a proxy\n    proxy = \"\"\n    # comma separated list of package names\n    pip_cmd = \"install\"\n    for package in packages.split(\",\"):    \n        subprocess.check_call([sys.executable, \"-m\", \"pip\", \"--proxy\", proxy, pip_cmd, package])\n    # you can add additional helper methods below."
  results:
    - SUCCESS
