FROM maven:3.3-jdk-8 as extensionbuilder
WORKDIR /kcextensions
COPY ./extensions ./

RUN mvn -B clean package

FROM quay.io/keycloak/keycloak:18.0.0 as kcbuilder

COPY --from=extensionbuilder /kcextensions/services/target/bcgov-services-1.0.0.jar /opt/keycloak/providers/
COPY ./theme/bcgov /opt/keycloak/themes/bcgov
COPY ./theme/bcgov-idp-stopper /opt/keycloak/themes/bcgov-idp-stopper

RUN /opt/keycloak/bin/kc.sh build

CMD ["/opt/keycloak/bin/kc.sh", "start-dev"]
