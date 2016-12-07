# jenkins dockerfile
FROM ubuntu:16.04
USER root
MAINTAINER MikeyB

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -f

WORKDIR /opt/

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

RUN apt-get update
RUN apt-get install -y jenkins
RUN apt-get update

# Install the plugins using jenkins itself.
RUN cd /usr/share/jenkins/ref/plugins/; \
	install-plugins.sh \
        analysis-core \
        ansicolor \
        build-timeout \
        build-metrics \
        credentials \
        credentials-binding \
        cucumber-reports \
        cucumber-testresult-plugin \
        dashboard-view \
        dependency-check-jenkins-plugin \
        description-setter \
        docker-plugin \
        envinject \
        extended-read-permission \
        gerrit-trigger \
        git \
        git-client \
        gitlab-plugin \
        git-server \
        global-build-stats \
        gravatar \
        greenballs \
        groovy-postbuild \
        jobConfigHistory \
        jquery \
        junit \
        ldap \
        m2release \
        mailer \
        mask-passwords \
        matrix-auth \
        matrix-project \
        mercurial \
        naginator \
        nodelabelparameter \
        pam-auth \
        parameterized-trigger \
        plain-credentials \
        PrioritySorter \
        rebuild \
        release \
        scm-api \
        scoverage \
        script-security \
        subversion \
        swarm \
        throttle-concurrents \
        timestamper \
        token-macro \
        view-job-filters \
        workflow-aggregator \
        ws-cleanup

# Disable the upgrade wizard
RUN echo -n 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state  && \
    echo -n 2.0 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion

RUN chown -R jenkins "$JENKINS_HOME" /usr/share/jenkins/ref

USER jenkins

EXPOSE 8080
ENTRYPOINT service jenkins start && bash
