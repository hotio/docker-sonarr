FROM hotio/mono@sha256:f1fd6051b8244eb35da980e8dd53e1d1a8c32abe158da7e3c8c07ca7d64a635d

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 8989

ARG VERSION
ARG SBRANCH
RUN curl -fsSL "https://download.sonarr.tv/v2/${SBRANCH}/mono/NzbDrone.${SBRANCH}.${VERSION}.mono.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    rm -rf "${APP_DIR}/NzbDrone.Update" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
