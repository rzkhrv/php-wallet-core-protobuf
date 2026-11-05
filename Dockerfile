FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates git protobuf-compiler \
    && rm -rf /var/lib/apt/lists/*

ENV HOME=/tmp
WORKDIR /work

CMD ["/bin/sh", "-ec", ": \"${VERSION:?Specify VERSION, e.g. 4.7.0}\"\ntmp=\"$(mktemp -d)\"\ntrap 'rm -rf \"$tmp\"' EXIT\ngit -c advice.detachedHead=false clone --quiet --depth 1 --single-branch --branch \"$VERSION\"   https://github.com/trustwallet/wallet-core.git \"$tmp/wallet-core\"\nmkdir \"$tmp/php\"\nprotoc --proto_path=\"$tmp/wallet-core/src/proto\"   --php_out=\"$tmp/php\" \"$tmp/wallet-core/src/proto/\"*.proto\nrm -rf /work/src\nmv \"$tmp/php\" /work/src"]
