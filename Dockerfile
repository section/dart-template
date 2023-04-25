FROM dart:2.19.6-sdk AS build

WORKDIR /usr/src/app
COPY pubspec.* ./
RUN dart pub get

COPY bin bin/
COPY public public/

RUN dart pub get --offline
RUN dart compile exe bin/server.dart -o bin/server

FROM scratch

COPY --from=build /runtime/ /

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/bin/server bin/
COPY --from=build /usr/src/app/public/ public/

EXPOSE 8080
CMD ["./bin/server"]
