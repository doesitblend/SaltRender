run_a_thing:
  cmd.run:
    - name: echo "Hello world"

check_pillar_data:
  test.check_pillar:
    - present:
      - pkg
      - version