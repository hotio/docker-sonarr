FROM hotio/mono@sha256:a4604e8e6c85fc9b2657296a96bc3e8b77f3ed2d4096ee8b6ddc7fa7a8a41ca8

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 8989

ARG VERSION
ARG SBRANCH
RUN curl -fsSL "https://download.sonarr.tv/v2/${SBRANCH}/mono/NzbDrone.${SBRANCH}.${VERSION}.mono.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    rm -rf "${APP_DIR}/NzbDrone.Update" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
