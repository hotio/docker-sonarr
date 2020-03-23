FROM hotio/mono@sha256:7e9445754fb4d1ec6ca10bf79a152437833ed30690474e8922d611ce8899861a

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 8989

ARG SONARR_VERSION=3.0.3.741

# install app
RUN mkdir "${APP_DIR}/bin" && \
    curl -fsSL "https://download.sonarr.tv/v3/phantom-develop/${SONARR_VERSION}/Sonarr.phantom-develop.${SONARR_VERSION}.linux.tar.gz" | tar xzf - -C "${APP_DIR}/bin" --strip-components=1 && \
    rm -rf "${APP_DIR}/bin/Sonarr.Update" && \
    echo "PackageVersion=${SONARR_VERSION}\nPackageAuthor=hotio\nReleaseVersion=${SONARR_VERSION}\nUpdateMethod=Docker\nBranch=phantom-develop" > "${APP_DIR}/package_info" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
