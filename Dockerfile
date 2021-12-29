FROM dart:2.15.1

RUN apt-get update && \
    apt-get install -y jq && \
    apt-get purge --auto-remove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/test-runner

COPY pubspec.lock pubspec.yaml ./
RUN dart pub get

COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
