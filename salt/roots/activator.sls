activator:
    archive:
        - extracted
        - name: /typesafe
        - source: http://downloads.typesafe.com/typesafe-activator/1.2.3/typesafe-activator-1.2.3-minimal.zip
        - archive_format: zip
        - source_hash: md5=a3458076fe768ae951fe7bd5ac627b3e

activator_permissions:
    file.directory:
        - name: /typesafe/activator-1.2.3-minimal
        - mode: 555
        - recurse:
            - mode
        - require: 
            - archive: activator
    
activator_copy:
    file.copy:
        - source: /typesafe/activator-1.2.3-minimal/activator
        - name: /usr/bin/activator
        - require:
            - archive: activator
            - file: activator_permissions

activator_jar_copy:
    file.copy:
        - source: /typesafe/activator-1.2.3-minimal/activator-launch-1.2.3.jar
        - name: /usr/bin/activator-launch-1.2.3.jar
        - require:
            - archive: activator
            - file: activator_permissions