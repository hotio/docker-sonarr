FROM hotio/mono@sha256:b272560b56617f92bc29021c14f9bddd9044e14e886d25d5ab59b58e035f08b9

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 8989

ARG VERSION

# install app
RUN curl -fsSL "https://download.sonarr.tv/v2/master/mono/NzbDrone.master.${VERSION}.mono.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    rm -rf "${APP_DIR}/NzbDrone.Update" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
